import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelFeaturesSection extends StatelessWidget {
  const TravelFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFE8F9F3), Color(0xFFF0FCF7), Colors.white],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: isMobile
          ? _buildMobileLayout(isDesktop, isTablet)
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildContentSection(isDesktop, isTablet),
                ),
                Wbox(isDesktop ? 80 : 40),
                Expanded(
                  flex: 1,
                  child: _buildImageSection(isDesktop, isTablet),
                ),
              ],
            ),
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentSection(isDesktop, isTablet),
        Hbox(40),
        _buildImageSection(isDesktop, isTablet),
      ],
    );
  }

  Widget _buildContentSection(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Key Features Label
        Text(
          'KEY FEATURES',
          style: Ts.bold(
            size: 14,
            color: AppColor.primary,
          ).copyWith(letterSpacing: 2),
        ),

        Hbox(16),

        // Main Heading
        AppText(
          'We offer best services',
          style: Ts.bold(
            size: isDesktop ? 40 : (isTablet ? 32 : 28),
            color: Colors.black,
          ),
        ),

        Hbox(24),

        // Description
        AppText(
          'Kapitor extends beyond finance into everyday lifestyle services. Travel booking, utility recharges, global gift cards, domestic & international transportation - all paid through stablecoins.',
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),

        Hbox(isDesktop ? 40 : 32),

        // Feature Cards
        Column(
          children: [
            _FeatureCard(
              icon: Icons.flight_takeoff,
              title: 'Flights & Hotels',
              description: 'Global travel booking with USDT payment',
              color: const Color(0xFF7C4DFF),
              isDesktop: isDesktop,
              isTablet: isTablet,
            ),
            Hbox(24),
            _FeatureCard(
              icon: Icons.phone_android,
              title: 'Mobile & DTH Recharges',
              description: 'All utilities in one dashboard',
              color: const Color(0xFFFF6F00),
              isDesktop: isDesktop,
              isTablet: isTablet,
            ),
            Hbox(24),
            _FeatureCard(
              icon: Icons.card_giftcard,
              title: 'Gift Card Marketplace',
              description: 'Global brands paid with USDT',
              color: const Color(0xFFE91E63),
              isDesktop: isDesktop,
              isTablet: isTablet,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildImageSection(bool isDesktop, bool isTablet) {
    return Stack(
      children: [
        // Decorative pattern (top right)
        Positioned(
          right: 0,
          top: 0,
          child: CustomPaint(
            size: Size(isDesktop ? 120 : 80, isDesktop ? 120 : 80),
            painter: DotPatternPainter(),
          ),
        ),

        // Main image
        Center(
          child: Image.asset(
            AppImage.travel3,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: isDesktop ? 500 : (isTablet ? 400 : 300),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final bool isDesktop;
  final bool isTablet;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_isHovered ? -0.05 : 0)
          ..translate(0.0, _isHovered ? -8.0 : 0.0, _isHovered ? 15.0 : 0.0),
        padding: EdgeInsets.all(widget.isDesktop ? 24 : 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? Colors.black.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 25 : 10,
              offset: Offset(0, _isHovered ? 10 : 4),
              spreadRadius: _isHovered ? 3 : 0,
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon Container
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(widget.isDesktop ? 16 : 14),
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(12),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: widget.color.withValues(alpha: 0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ]
                    : [],
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: widget.isDesktop ? 32 : 28,
              ),
            ),

            Wbox(20),

            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    widget.title,
                    style: Ts.bold(
                      size: widget.isDesktop ? 20 : 18,
                      color: Colors.black,
                    ),
                  ),
                  Hbox(6),
                  AppText(
                    widget.description,
                    style: Ts.regular(
                      size: widget.isDesktop ? 14 : 13,
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.primary.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    const dotSize = 4.0;
    const spacing = 12.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotSize / 2, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
