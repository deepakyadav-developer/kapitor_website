import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiCtaSection extends StatelessWidget {
  const KapAiCtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xFFE8F9F3).withValues(alpha: 0.5),
            const Color(0xFFFFFBE6).withValues(alpha: 0.5),
            Colors.white,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isDesktop ? 1200 : double.infinity,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 0),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 50 : 30),
          vertical: isDesktop ? 60 : (isTablet ? 50 : 40),
        ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFFE8F9F3), Color(0xFFFFFBE6)],
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: isMobile
            ? _buildMobileLayout()
            : _buildDesktopLayout(isDesktop, isTablet),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icons
        Row(
          children: [
            Icon(
              Icons.auto_awesome,
              size: 24,
              color: Colors.black.withValues(alpha: 0.6),
            ),
            Wbox(16),
            Icon(
              Icons.settings,
              size: 24,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ],
        ),
        Hbox(24),
        // Heading
        AppText(
          'Start your\n7-day free trial',
          style: Ts.bold(size: 32, color: Colors.black),
        ),
        Hbox(20),
        // Features
        _buildFeatureItem('Free 7-day trial', true),
        Hbox(12),
        _buildFeatureItem('No credit card required', true),
        Hbox(24),
        // Button and rating
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AnimatedLearnMoreButton(isMobile: true),
            Hbox(16),
            _buildRating(true),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Content
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              AppText(
                'Start your\n7-day free trial',
                style: Ts.bold(size: isDesktop ? 48 : 38, color: Colors.black),
              ),
              Hbox(isDesktop ? 24 : 20),
              // Features
              Row(
                children: [
                  _buildFeatureItem('Free 7-day trial', false),
                  Wbox(isDesktop ? 32 : 24),
                  _buildFeatureItem('No credit card required', false),
                ],
              ),
            ],
          ),
        ),

        Wbox(isDesktop ? 60 : 40),

        // Right side - Button and rating
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Icons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: isDesktop ? 28 : 24,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
                Wbox(16),
                Icon(
                  Icons.settings,
                  size: isDesktop ? 28 : 24,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ],
            ),
            Hbox(isDesktop ? 32 : 24),
            _AnimatedLearnMoreButton(isMobile: false),
            Hbox(16),
            _buildRating(false),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String text, bool isMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            size: isMobile ? 14 : 16,
            color: Colors.white,
          ),
        ),
        Wbox(12),
        AppText(
          text,
          style: Ts.semiBold(size: isMobile ? 14 : 16, color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildRating(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        AppText(
          '4.80/5',
          style: Ts.bold(size: isMobile ? 16 : 18, color: Colors.black),
        ),
        Hbox(4),
        AppText(
          'From 300+ Customer Reviews',
          style: Ts.regular(
            size: isMobile ? 12 : 13,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

class _AnimatedLearnMoreButton extends StatefulWidget {
  final bool isMobile;

  const _AnimatedLearnMoreButton({required this.isMobile});

  @override
  State<_AnimatedLearnMoreButton> createState() =>
      _AnimatedLearnMoreButtonState();
}

class _AnimatedLearnMoreButtonState extends State<_AnimatedLearnMoreButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
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
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : [],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.isMobile ? 32 : 40,
                    vertical: widget.isMobile ? 16 : 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
                child: AppText(
                  'Learn More',
                  style: Ts.bold(
                    size: widget.isMobile ? 14 : 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
