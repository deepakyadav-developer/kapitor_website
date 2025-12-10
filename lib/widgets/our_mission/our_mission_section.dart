import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/size.dart';

class OurMissionSection extends StatelessWidget {
  const OurMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0);

        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }

        return Container(
          padding: EdgeInsets.only(
            left: horizontalPadding,
            right: 0, // No right padding to allow dark bar
            top: verticalPadding,
            bottom: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Side - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Our mission button
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text(
                        'Our mission',
                        style: TextStyle(
                          fontSize: isDesktop ? 14.0 : 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Hbox(isDesktop ? 32.0 : 24.0),

                    // Main Heading
                    Text(
                      'Building a Transparent, Borderless Financial Ecosystem',
                      style: TextStyle(
                        fontSize: isDesktop ? 40.0 : (isTablet ? 36.0 : 30.0),
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),

                    Hbox(isDesktop ? 24.0 : 16.0),

                    // Description
                    Text(
                      'To build a transparent, borderless, and intelligence-driven global financial ecosystem where any individual — from a daily user to an institutional investor — can bank, invest, trade, protect, and grow wealth securely using stablecoins. Everyone deserves access to a global financial system that is instant, safe, predictable, and independent of traditional banking limitations.',
                      style: TextStyle(
                        fontSize: isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0),
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),

              Wbox(isDesktop ? 60.0 : 40.0),

              // Right Side - Illustration
              Expanded(
                flex: 1,
                child: Image.asset(
                  AppImage.about1,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: isDesktop ? 500 : 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Center(
                        child: Icon(Icons.image, size: 100, color: Colors.grey),
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

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Illustration
          Image.asset(
            AppImage.about1,
            fit: BoxFit.contain,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 100, color: Colors.grey),
                ),
              );
            },
          ),

          Hbox(40.0),

          // Our mission button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 1),
            ),
            child: Text(
              'Our mission',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),

          Hbox(24.0),

          // Main Heading
          Text(
            'Building a Transparent,\nBorderless Financial Ecosystem',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.2,
            ),
          ),

          Hbox(16.0),

          // Description
          Text(
            'To build a transparent, borderless, and intelligence-driven global financial ecosystem where any individual — from a daily user to an institutional investor — can bank, invest, trade, protect, and grow wealth securely using stablecoins. Everyone deserves access to a global financial system that is instant, safe, predictable, and independent of traditional banking limitations.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
