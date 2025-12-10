import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class GetAppSection extends StatelessWidget {
  const GetAppSection({super.key});

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

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(isDesktop ? 24.0 : 16.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 60.0 : (isTablet ? 40.0 : 24.0),
              vertical: isDesktop ? 50.0 : (isTablet ? 40.0 : 32.0),
            ),
            child: isMobile
                ? _buildMobileLayout(isDesktop, isTablet)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Get the',
                            style: Ts.bold(
                              size: isDesktop ? 36.0 : (isTablet ? 30.0 : 26.0),
                              color: const Color(0xFF26CE92),
                            ),
                          ),
                          AppText(
                            'Kapitor app',
                            style: Ts.bold(
                              size: isDesktop ? 36.0 : (isTablet ? 30.0 : 26.0),
                              color: const Color(0xFF26CE92),
                            ),
                          ),
                        ],
                      ),
                      // Right buttons
                      Row(
                        children: [
                          _buildStoreButton(
                            AppImage.playstorelogo,
                            'GET IT ON',
                            'Google Play',
                            isDesktop,
                            isTablet,
                          ),
                          Wbox(isDesktop ? 20.0 : 16.0),
                          _buildStoreButton(
                            AppImage.applelogo,
                            'Download on the',
                            'App Store',
                            isDesktop,
                            isTablet,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  Widget _buildStoreButton(
    String logoPath,
    String topText,
    String bottomText,
    bool isDesktop,
    bool isTablet,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 24.0 : (isTablet ? 20.0 : 16.0),
        vertical: isDesktop ? 12.0 : (isTablet ? 10.0 : 8.0),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image.asset(
            logoPath,
            width: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
            height: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
            fit: BoxFit.contain,
          ),
          Wbox(12.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                topText,
                style: Ts.regular(
                  size: isDesktop ? 10.0 : (isTablet ? 9.0 : 8.0),
                  color: Colors.white,
                ),
              ),
              AppText(
                bottomText,
                style: Ts.bold(
                  size: isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet) {
    return Column(
      children: [
        AppText(
          'Get the',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 26.0, color: const Color(0xFF26CE92)),
        ),
        AppText(
          'Kapitor app',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 26.0, color: const Color(0xFF26CE92)),
        ),
        Hbox(32.0),
        Column(
          children: [
            _buildStoreButton(
              AppImage.playstorelogo,
              'GET IT ON',
              'Google Play',
              isDesktop,
              isTablet,
            ),
            Hbox(16.0),
            _buildStoreButton(
              AppImage.applelogo,
              'Download on the',
              'App Store',
              isDesktop,
              isTablet,
            ),
          ],
        ),
      ],
    );
  }
}
