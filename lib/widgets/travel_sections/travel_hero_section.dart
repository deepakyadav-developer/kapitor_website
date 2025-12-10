import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelHeroSection extends StatelessWidget {
  const TravelHeroSection({super.key});

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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFD4F5E9), Color(0xFFE8F9F3), Color(0xFFF0FCF7)],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: isMobile
          ? _buildMobileLayout()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildLeftContent(isDesktop, isTablet),
                ),
                Wbox(isDesktop ? 80 : 40),
                Expanded(
                  flex: 1,
                  child: _buildRightContent(isDesktop, isTablet),
                ),
              ],
            ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeftContent(false, false),
        Hbox(40),
        _buildRightContent(false, false),
      ],
    );
  }

  Widget _buildLeftContent(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                'Explore the world',
                style: Ts.semiBold(size: 14, color: AppColor.primary),
              ),
              Wbox(8),
              const Icon(Icons.public, color: AppColor.primary, size: 18),
            ],
          ),
        ),

        Hbox(isDesktop ? 32 : 24),

        // Main Heading
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'TRAVEL &\nRECHARGES — ',
                style: Ts.bold(
                  size: isDesktop ? 56 : (isTablet ? 44 : 36),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),

        RichText(
          text: TextSpan(
            text: 'Lifestyle Utility Hub',
            style: Ts.bold(
              size: isDesktop ? 56 : (isTablet ? 44 : 36),
              color: AppColor.primary,
            ),
          ),
        ),

        Hbox(isDesktop ? 24 : 20),

        // Description
        AppText(
          'Kapitor doesn\'t stop at finance.\nIt extends into everyday lifestyle services, making travel,\nutilities, bookings, recharges, and gift cards instantly\naccessible using stablecoins.',
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),

        Hbox(isDesktop ? 40 : 32),

        // Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            // Get Started Button
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 32 : 24,
                  vertical: isDesktop ? 16 : 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AppText(
                  'Get Started',
                  style: Ts.semiBold(
                    size: isDesktop ? 16 : 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            // Watch Demo Button
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 32 : 24,
                  vertical: isDesktop ? 16 : 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.black.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      'Watch Demo',
                      style: Ts.semiBold(
                        size: isDesktop ? 16 : 14,
                        color: Colors.black,
                      ),
                    ),
                    Wbox(8),
                    const Icon(
                      Icons.play_circle_outline,
                      size: 20,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRightContent(bool isDesktop, bool isTablet) {
    final isMobile = !isDesktop && !isTablet;

    return SizedBox(
      height: isDesktop ? 500 : (isTablet ? 400 : 350),
      child: Stack(
        children: [
          // Decorative airplane path
          if (!isMobile)
            Positioned(
              top: 20,
              right: 100,
              child: CustomPaint(
                size: const Size(200, 100),
                painter: AirplanePath(),
              ),
            ),

          // Main image
          Center(
            child: Image.asset(
              AppImage.travel1,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: isDesktop ? 500 : (isTablet ? 400 : 300),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.travel_explore,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
          ),

          // Decorative icons
          Positioned(
            top: 10,
            right: isMobile ? 10 : 20,
            child: Container(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFFC107),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: isMobile ? 16 : 20,
              ),
            ),
          ),

          Positioned(
            bottom: isMobile ? 20 : 40,
            left: isMobile ? 10 : 20,
            child: Container(
              padding: EdgeInsets.all(isMobile ? 10 : 12),
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.location_on,
                color: Colors.white,
                size: isMobile ? 16 : 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AirplanePath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final dashPaint = Paint()
      ..color = AppColor.primary.withValues(alpha: 0.3)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width * 0.5, 0, size.width, size.height * 0.3);

    // Draw dashed line
    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double distance = 0;

    final pathMetrics = path.computeMetrics();
    for (final pathMetric in pathMetrics) {
      while (distance < pathMetric.length) {
        final nextDistance = distance + dashWidth;
        final extractPath = pathMetric.extractPath(
          distance,
          nextDistance > pathMetric.length ? pathMetric.length : nextDistance,
        );
        canvas.drawPath(extractPath, dashPaint);
        distance = nextDistance + dashSpace;
      }
    }

    // Draw airplane icon at the end
    final textPainter = TextPainter(
      text: const TextSpan(
        text: '✈',
        style: TextStyle(fontSize: 24, color: AppColor.primary),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(size.width - 20, size.height * 0.3 - 12));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
