import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Feature 5 - Private Placement Programme (PPP) Section
/// Black theme with Frame 35 image
class Feature5PppSection extends StatelessWidget {
  const Feature5PppSection({super.key});

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
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF99E39E).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF99E39E).withValues(alpha: 0.3),
                    width: 1,
                  ),
                ),
                child: AppText(
                  'Future of crypto trading',
                  style: Ts.medium(
                    size: isDesktop ? 14 : 12,
                    color: const Color(0xFF99E39E),
                  ),
                ),
              ),

              Hbox(isDesktop ? 24 : 16),

              // Main Title
              AppText(
                'Private Placement Programme (PPP)\nExclusive Institutional Alpha',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48 : (isTablet ? 36 : 28),
                  color: Colors.white,
                ),
              ),

              Hbox(isDesktop ? 16 : 12),

              // Subtitle
              AppText(
                'The Apex of Investment: Principal-Insured Private Placement Programmes',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 16 : (isTablet ? 14 : 12),
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),

              Hbox(isDesktop ? 32 : 24),

              // Download Button
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 32,
                    vertical: isMobile ? 12 : 16,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF99E39E),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF99E39E).withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        'Download Now',
                        style: Ts.semiBold(
                          size: isMobile ? 14 : 16,
                          color: Colors.black,
                        ),
                      ),
                      Wbox(8),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),

              Hbox(isDesktop ? 60 : 40),

              // Frame 35 Image
              Center(
                child: Image.asset(
                  AppImage.frame35,
                  width: isDesktop ? 600 : (isTablet ? 700 : double.infinity),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: isDesktop ? 600 : 400,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.phone_iphone,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
