import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Feature 6 - Be the first to use Kapitor
/// Black theme with Frame 164 graph image
class Feature6CryptoFeaturesSection extends StatelessWidget {
  const Feature6CryptoFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final isTablet =
            constraints.maxWidth >= 768 && constraints.maxWidth < 1024;
        final isMobile = constraints.maxWidth < 768;

        return Container(
          width: double.infinity,
          color: Colors.black,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
            vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
          ),
          child: Column(
            children: [
              // Badge
              AppText(
                'Always by your side',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 14 : 12,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),

              Hbox(isDesktop ? 16 : 12),

              // Main Title
              AppText(
                'Be the first to use Kapitor!',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48 : (isTablet ? 36 : 28),
                  color: Colors.white,
                ),
              ),

              Hbox(isDesktop ? 24 : 16),

              // Subtitle
              AppText(
                'Our proprietary Full AI risk management system continuously monitors and optimizes the programme\'s performance, providing clarity via NAV tracking and\nformal assurance with a documented Allocation certificate. Commit to the future of high finance.',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 16 : (isTablet ? 14 : 12),
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),

              Hbox(isDesktop ? 60 : 40),

              // Frame 164 Graph Image - Full Width
              Image.asset(
                AppImage.frame164,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: isDesktop ? 400 : 300,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.show_chart,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
