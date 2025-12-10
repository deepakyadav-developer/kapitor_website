import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Feature 3 Crypto Section - Global Investing, Simplified: Tokenized Assets
class Feature3CryptoSection extends StatelessWidget {
  const Feature3CryptoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 1024;
        final isTablet =
            constraints.maxWidth >= 768 && constraints.maxWidth < 1024;

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
            vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
          ),
          child: Column(
            children: [
              // Title
              AppText(
                'Global Investing, Simplified: Tokenized Assets',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48 : (isTablet ? 36 : 28),
                  color: Colors.black,
                ).copyWith(height: 1.2),
              ),

              Hbox(isDesktop ? 24 : 16),

              // Subtitle
              AppText(
                'Unlock Elite Assets with Fractional Ownership',
                textAlign: TextAlign.center,
                style: Ts.regular(
                  size: isDesktop ? 18 : (isTablet ? 16 : 14),
                  color: Colors.black.withValues(alpha: 0.7),
                ),
              ),

              Hbox(isDesktop ? 80 : 60),

              // Main Content - Frame 92 Image
              Center(
                child: Image.asset(
                  AppImage.frame92,
                  width: isDesktop ? 900 : (isTablet ? 900 : double.infinity),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: isDesktop ? 600 : 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(Icons.image, size: 80, color: Colors.grey),
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
