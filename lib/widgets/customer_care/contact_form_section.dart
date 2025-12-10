import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Contact Us Form Section
/// Contact form with name, email, phone, and message fields
class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key});

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F7FA),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 600 : double.infinity,
          ),
          child: Column(
            children: [
              // Title
              AppText(
                'Contact Us',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48 : (isTablet ? 36 : 32),
                  color: Colors.black,
                ),
              ),
              Hbox(16),
              // Subtitle
              AppText(
                'Feel free to contact us we\'ll get in touch with you',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 16 : 14,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ),
              Hbox(isDesktop ? 48 : 32),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _CustomTextField(
                      controller: _nameController,
                      hintText: 'Full Name',
                      isLarge: isDesktop,
                    ),
                    Hbox(20),
                    _CustomTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      isLarge: isDesktop,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    Hbox(20),
                    _CustomTextField(
                      controller: _phoneController,
                      hintText: 'Phone',
                      isLarge: isDesktop,
                      keyboardType: TextInputType.phone,
                    ),
                    Hbox(20),
                    _CustomTextField(
                      controller: _messageController,
                      hintText: 'Message',
                      isLarge: isDesktop,
                      maxLines: 5,
                    ),
                    Hbox(32),
                    _SubmitButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Handle form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Message sent successfully!'),
                              backgroundColor: Color(0xFF4CAF50),
                            ),
                          );
                        }
                      },
                      isLarge: isDesktop,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isLarge;
  final TextInputType? keyboardType;
  final int maxLines;

  const _CustomTextField({
    required this.controller,
    required this.hintText,
    required this.isLarge,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  State<_CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<_CustomTextField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() => _isFocused = hasFocus);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isFocused
                ? const Color(0xFFFF69B4).withValues(alpha: 0.5)
                : const Color(0xFFFF69B4).withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                    color: const Color(0xFFFF69B4).withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          style: Ts.regular(
            size: widget.isLarge ? 15 : 14,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Ts.regular(
              size: widget.isLarge ? 15 : 14,
              color: Colors.black.withValues(alpha: 0.4),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: widget.isLarge ? 24 : 20,
              vertical: widget.maxLines > 1
                  ? (widget.isLarge ? 20 : 16)
                  : (widget.isLarge ? 18 : 16),
            ),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ),
    );
  }
}

class _SubmitButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isLarge;

  const _SubmitButton({required this.onPressed, required this.isLarge});

  @override
  State<_SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<_SubmitButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isLarge ? 60 : 50,
            vertical: widget.isLarge ? 16 : 14,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFFFF69B4)
                  : const Color(0xFFFF69B4).withValues(alpha: 0.5),
              width: 2,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFFFF69B4).withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: AppText(
            'Submit',
            style: Ts.bold(
              size: widget.isLarge ? 16 : 15,
              color: _isHovered
                  ? const Color(0xFFFF69B4)
                  : Colors.black.withValues(alpha: 0.6),
            ),
          ),
        ),
      ),
    );
  }
}
