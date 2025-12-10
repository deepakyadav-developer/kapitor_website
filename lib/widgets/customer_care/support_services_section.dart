import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// All Customer Support Services Section
/// Shows different support channels with telecommuting images
class SupportServicesSection extends StatefulWidget {
  const SupportServicesSection({super.key});

  @override
  State<SupportServicesSection> createState() => _SupportServicesSectionState();
}

class _SupportServicesSectionState extends State<SupportServicesSection> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          // Section Title
          AppText(
            'All Customer Support\nServices By Kapitor',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 36 : 28),
              color: Colors.black,
            ).copyWith(height: 1.2),
          ),
          Hbox(isDesktop ? 60 : 40),
          // Services Grid
          _buildServicesGrid(isDesktop, isTablet),
          Hbox(isDesktop ? 60 : 40),
          // Bottom Text
          SizedBox(
            width: isDesktop ? 700 : double.infinity,
            child: AppText(
              'We are a highly dedicated customer support service provider with 0% churn rate.',
              textAlign: TextAlign.center,
              style: Ts.regular(
                size: isDesktop ? 18 : (isTablet ? 16 : 14),
                color: Colors.black.withValues(alpha: 0.7),
              ).copyWith(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesGrid(bool isDesktop, bool isTablet) {
    if (isDesktop || isTablet) {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ServiceCard(
                  image: AppImage.telecommuting,
                  title: 'Customer Support',
                  description:
                      'Outsource your Customer Support Services to Helplama and avail Tested Experts to handle your Phone, Email and Live Chat Answering Services.',
                  isLarge: isDesktop,
                ),
              ),
              Wbox(isDesktop ? 24 : 16),
              Expanded(
                child: _ServiceCard(
                  image: AppImage.telecommuting,
                  title: 'Live Chat Answering',
                  description:
                      'Hire US-based Live Chat Agents with category expertise in your business domain to engage your customers and appease their queries and concerns.',
                  isLarge: isDesktop,
                ),
              ),
            ],
          ),
          Hbox(isDesktop ? 24 : 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ServiceCard(
                  image: AppImage.telecommuting,
                  title: 'Phone Answering',
                  description:
                      'Call Answering Executives from the USA with the appropriate tone, accent, verbiage and cultural background to cater to your customers\' needs.',
                  isLarge: isDesktop,
                ),
              ),
              Wbox(isDesktop ? 24 : 16),
              Expanded(
                child: _ServiceCard(
                  image: AppImage.telecommuting,
                  title: 'Email Answering',
                  description:
                      'Outsource your Customer Support Services to Helplama and avail Tested Experts to handle your Phone, Email and Live Chat Answering Services.',
                  isLarge: isDesktop,
                ),
              ),
            ],
          ),
        ],
      );
    }

    // Mobile layout
    return Column(
      children: [
        _ServiceCard(
          image: AppImage.telecommuting,
          title: 'Customer Support',
          description:
              'Outsource your Customer Support Services to Helplama and avail Tested Experts to handle your Phone, Email and Live Chat Answering Services.',
          isLarge: false,
        ),
        Hbox(24),
        _ServiceCard(
          image: AppImage.telecommuting,
          title: 'Live Chat Answering',
          description:
              'Hire US-based Live Chat Agents with category expertise in your business domain to engage your customers and appease their queries and concerns.',
          isLarge: false,
        ),
        Hbox(24),
        _ServiceCard(
          image: AppImage.telecommuting,
          title: 'Phone Answering',
          description:
              'Call Answering Executives from the USA with the appropriate tone, accent, verbiage and cultural background to cater to your customers\' needs.',
          isLarge: false,
        ),
        Hbox(24),
        _ServiceCard(
          image: AppImage.telecommuting,
          title: 'Email Answering',
          description:
              'Outsource your Customer Support Services to Helplama and avail Tested Experts to handle your Phone, Email and Live Chat Answering Services.',
          isLarge: false,
        ),
      ],
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final bool isLarge;

  const _ServiceCard({
    required this.image,
    required this.title,
    required this.description,
    required this.isLarge,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.02,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: EdgeInsets.all(widget.isLarge ? 32 : 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300, width: 1),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Column(
            children: [
              // Image
              Image.asset(
                widget.image,
                height: widget.isLarge ? 200 : 160,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: widget.isLarge ? 200 : 160,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.support_agent,
                      size: widget.isLarge ? 80 : 60,
                      color: Colors.grey.shade400,
                    ),
                  );
                },
              ),
              Hbox(widget.isLarge ? 24 : 20),
              // Title
              AppText(
                widget.title,
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: widget.isLarge ? 22 : 18,
                  color: Colors.black,
                ),
              ),
              Hbox(widget.isLarge ? 16 : 12),
              // Description
              AppText(
                widget.description,
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: widget.isLarge ? 14 : 13,
                  color: Colors.black.withValues(alpha: 0.6),
                ).copyWith(height: 1.6),
              ),
              Hbox(widget.isLarge ? 24 : 20),
              // Button
              _AnimatedButton(
                text: 'Give it a Try',
                isLarge: widget.isLarge,
                onTap: () {
                  // TODO: Add action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedButton extends StatefulWidget {
  final String text;
  final bool isLarge;
  final VoidCallback onTap;

  const _AnimatedButton({
    required this.text,
    required this.isLarge,
    required this.onTap,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isLarge ? 32 : 28,
            vertical: widget.isLarge ? 14 : 12,
          ),
          decoration: BoxDecoration(
            color: _isHovered ? const Color(0xFF4CAF50) : Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFF4CAF50)
                  : Colors.grey.shade300,
              width: 1.5,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: const Color(0xFF4CAF50).withValues(alpha: 0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: AppText(
            widget.text,
            style: Ts.medium(
              size: widget.isLarge ? 15 : 14,
              color: _isHovered
                  ? Colors.white
                  : Colors.black.withValues(alpha: 0.7),
            ),
          ),
        ),
      ),
    );
  }
}
