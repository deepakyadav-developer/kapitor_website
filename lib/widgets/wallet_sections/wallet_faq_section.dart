import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class WalletFaqSection extends StatelessWidget {
  const WalletFaqSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0);

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Stack(
            children: [
              // Subtle background shapes
              Positioned(
                left: 0,
                top: 0,
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Opacity(
                  opacity: 0.1,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    // Heading
                    AppText(
                      'Why Kapitor wallet is different',
                      textAlign: TextAlign.center,
                      style: Ts.bold(
                        size: isDesktop ? 36.0 : (isTablet ? 28.0 : 24.0),
                        color: Colors.black,
                      ),
                    ),

                    Hbox(isDesktop ? 60.0 : 40.0),

                    // FAQ Items
                    SizedBox(
                      width: isDesktop
                          ? 800.0
                          : (isTablet ? 600.0 : double.infinity),
                      child: Column(
                        children: [
                          _FaqItem(
                            question: 'What is CashEase?',
                            answer:
                                'CashEase is an e-wallet app that allows you to store money, make payments, and perform other financial transactions electronically through your mobile device.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                          Hbox(isDesktop ? 24.0 : 16.0),
                          _FaqItem(
                            question:
                                'How do I download and install the CashEase app?',
                            answer:
                                'You can download the CashEase app from the Google Play Store for Android devices or the Apple App Store for iOS devices. Simply search for "CashEase" in the store, tap the install button, and follow the on-screen instructions to complete the installation process.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                          Hbox(isDesktop ? 24.0 : 16.0),
                          _FaqItem(
                            question:
                                'Can I transfer money from CashEase to my bank account?',
                            answer:
                                'Yes, you can transfer money from your CashEase wallet to your linked bank account. To do this, go to the "Transfer" section in the app, select "Bank Transfer", choose your linked bank account, enter the amount, and confirm the transaction. Transfers typically take 1-3 business days to process.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                          Hbox(isDesktop ? 24.0 : 16.0),
                          _FaqItem(
                            question:
                                'Is CashEase compatible with all types of devices?',
                            answer:
                                'CashEase is compatible with most modern smartphones and tablets. The app supports iOS devices running iOS 12.0 or later, and Android devices running Android 6.0 (Marshmallow) or later. For the best experience, we recommend using devices with the latest operating system updates.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                          Hbox(isDesktop ? 24.0 : 16.0),
                          _FaqItem(
                            question:
                                'How can I contact CashEase customer support if I encounter issues?',
                            answer:
                                'You can contact CashEase customer support through multiple channels: 1) In-app support: Go to Settings > Help & Support to chat with our support team, 2) Email: Send your query to support@cashease.com, 3) Phone: Call our 24/7 helpline at 1-800-CASHEASE. Our support team is available round the clock to assist you with any issues or questions.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _FaqItem extends StatefulWidget {
  final String question;
  final String answer;
  final bool isDesktop;
  final bool isTablet;

  const _FaqItem({
    required this.question,
    required this.answer,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  State<_FaqItem> createState() => _FaqItemState();
}

class _FaqItemState extends State<_FaqItem>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _isExpanded
        ? Colors
              .green // Purple when expanded
        : Colors.grey.shade300; // Light gray when collapsed

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: borderColor, width: 1.5),
        boxShadow: _isExpanded
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: const Offset(0, 5),
                ),
              ]
            : [],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
                if (_isExpanded) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              });
            },
            borderRadius: BorderRadius.circular(12.0),
            child: Padding(
              padding: EdgeInsets.all(widget.isDesktop ? 24.0 : 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: AppText(
                      widget.question,
                      style: Ts.bold(
                        size: widget.isDesktop
                            ? 18.0
                            : (widget.isTablet ? 16.0 : 15.0),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Wbox(16.0),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.chevron_right,
                      color: _isExpanded
                          ? const Color(0xFF9C27B0)
                          : Colors.grey.shade600,
                      size: widget.isDesktop ? 28.0 : 24.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _expandAnimation,
            child: Container(
              padding: EdgeInsets.only(
                left: widget.isDesktop ? 24.0 : 20.0,
                right: widget.isDesktop ? 24.0 : 20.0,
                bottom: widget.isDesktop ? 24.0 : 20.0,
              ),
              child: AppText(
                widget.answer,
                style: Ts.regular(
                  size: widget.isDesktop
                      ? 16.0
                      : (widget.isTablet ? 14.0 : 13.0),
                  color: Colors.grey.shade700,
                ).copyWith(height: 1.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
