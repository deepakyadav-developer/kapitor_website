import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/pages/feature/feature_detail_page.dart';
import 'package:kapitor_website/widgets/common/feature_hero_section.dart';

/// Example usage of FeatureHeroSection widget
/// This shows how to implement the feature section with navigation
class FeatureHeroExample extends StatelessWidget {
  const FeatureHeroExample({super.key});

  @override
  Widget build(BuildContext context) {
    return FeatureHeroSection(
      badge: 'Welcome to a Modern Financial Experience',
      title: 'Managing Your Personal\nFinances Made Easier',
      description:
          'Elevate your financial experience with CashEase. We simplify how you pay, transfer money, and manage your finances, giving you full control over your money. with QR Scan & Pay Instant transfers',
      imagePath: AppImage.feature1,
      playStoreUrl: 'https://play.google.com',
      appStoreUrl: 'https://apps.apple.com',
      onFeatureTap: () {},
      floatingIcons: [
        // Top left - Pie chart icon
        const Positioned(
          top: 20,
          left: 20,
          child: FloatingIcon(
            icon: Icons.pie_chart,
            color: Color(0xFF7B61FF),
            size: 32,
          ),
        ),
        // Top right - Percent icon
        const Positioned(
          top: 40,
          right: 100,
          child: FloatingIcon(
            icon: Icons.percent,
            color: Color(0xFFFF6B9D),
            size: 28,
          ),
        ),
        // Bottom left - User icon
        const Positioned(
          bottom: 60,
          left: 40,
          child: FloatingIcon(
            icon: Icons.person,
            color: Color(0xFF9B59B6),
            size: 30,
          ),
        ),
        // Right side - Check icon
        Positioned(
          top: 150,
          right: 20,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF9B59B6), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.check, size: 24, color: Color(0xFF9B59B6)),
          ),
        ),
      ],
    );
  }
}
