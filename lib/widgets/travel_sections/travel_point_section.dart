import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelPointSection extends StatelessWidget {
  const TravelPointSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: Colors.white,
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
                  child: _buildImageSection(isDesktop, isTablet),
                ),
                Wbox(isDesktop ? 80 : 40),
                Expanded(
                  flex: 1,
                  child: _buildContentSection(isDesktop, isTablet),
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

  Widget _buildImageSection(bool isDesktop, bool isTablet) {
    return Stack(
      children: [
        // Yellow circle background
        Positioned(
          left: isDesktop ? 40 : 20,
          top: isDesktop ? 40 : 20,
          child: Container(
            width: isDesktop ? 400 : (isTablet ? 350 : 280),
            height: isDesktop ? 400 : (isTablet ? 350 : 280),
            decoration: const BoxDecoration(
              color: Color(0xFFFFC107),
              shape: BoxShape.circle,
            ),
          ),
        ),

        // Decorative circles
        Positioned(
          left: 0,
          top: isDesktop ? 20 : 10,
          child: Container(
            width: isDesktop ? 40 : 30,
            height: isDesktop ? 40 : 30,
            decoration: const BoxDecoration(
              color: AppColor.primary,
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          right: isDesktop ? 60 : 40,
          top: isDesktop ? 100 : 80,
          child: Container(
            width: isDesktop ? 30 : 24,
            height: isDesktop ? 30 : 24,
            decoration: const BoxDecoration(
              color: Color(0xFFFF5252),
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          right: isDesktop ? 40 : 20,
          bottom: isDesktop ? 120 : 100,
          child: Container(
            width: isDesktop ? 35 : 28,
            height: isDesktop ? 35 : 28,
            decoration: const BoxDecoration(
              color: Color(0xFFFF5252),
              shape: BoxShape.circle,
            ),
          ),
        ),

        Positioned(
          right: 0,
          top: isDesktop ? 60 : 40,
          child: Container(
            width: isDesktop ? 50 : 40,
            height: isDesktop ? 50 : 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFFC107),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
            ),
            child: const Icon(Icons.location_on, color: Colors.white, size: 24),
          ),
        ),

        // Main image
        Container(
          margin: EdgeInsets.only(
            top: isDesktop ? 60 : 40,
            left: isDesktop ? 60 : 40,
          ),
          child: ClipPath(
            clipper: CircleClipper(),
            child: Image.asset(
              AppImage.assets2,
              width: isDesktop ? 400 : (isTablet ? 350 : 280),
              height: isDesktop ? 400 : (isTablet ? 350 : 280),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: isDesktop ? 400 : (isTablet ? 350 : 280),
                  height: isDesktop ? 400 : (isTablet ? 350 : 280),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.person, size: 100, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContentSection(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Travel Point Label
        Text(
          'UTILITY RECHARGES',
          style: Ts.bold(
            size: 14,
            color: AppColor.primary,
          ).copyWith(letterSpacing: 2),
        ),

        Hbox(16),

        // Main Heading
        AppText(
          'Mobile, DTH & Broadband Recharges',
          style: Ts.bold(
            size: isDesktop ? 40 : (isTablet ? 32 : 28),
            color: Colors.black,
          ),
        ),

        Hbox(24),

        // Description paragraphs
        AppText(
          'MOBILE, DTH & BROADBAND RECHARGES — All Utilities in One Dashboard. A dedicated recharge layer makes Kapitor a one-stop utility management system.',
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),

        Hbox(16),

        AppText(
          'Mobile recharges for prepaid top-ups and postpaid bill payments. DTH recharges for Tata Play, Airtel Digital TV, Dish TV, Sun Direct. Broadband payments for ACT, Airtel Fiber, Jio Fiber, Hathway.',
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),

        Hbox(16),

        AppText(
          'One dashboard for all recharges with instant settlement, no failed transactions, perfect for travelers abroad sending recharges home.',
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
