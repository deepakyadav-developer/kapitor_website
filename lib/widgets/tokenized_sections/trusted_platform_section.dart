import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TrustedPlatformSection extends StatelessWidget {
  const TrustedPlatformSection({super.key});

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
          child: isMobile
              ? _buildMobileLayout(isDesktop, isTablet, isMobile)
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left content
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'The Most Trusted\nCryptocurrency\nPlatform',
                            style: Ts.bold(
                              size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                              color: Colors.black,
                            ),
                          ),
                          Hbox(isDesktop ? 40.0 : 32.0),
                          _buildFeatureItem(
                            number: '01',
                            title: 'Sync between platforms',
                            description:
                                'No matter if you\'re using our web interface or mobile app — your data is always synced. Just one account for all our services.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                          Hbox(isDesktop ? 32.0 : 28.0),
                          _buildFeatureItem(
                            number: '02',
                            title: 'More focus, less clutter',
                            description:
                                'No ads, just the crypto and content you love.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                          Hbox(isDesktop ? 32.0 : 28.0),
                          _buildFeatureItem(
                            number: '03',
                            title: 'Security by default',
                            description:
                                'Enable privacy mode and app locking to protect your data.',
                            isDesktop: isDesktop,
                            isTablet: isTablet,
                          ),
                        ],
                      ),
                    ),
                    Wbox(isDesktop ? 80.0 : 60.0),
                    // Right image
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        AppImage.trustedplatform,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        AppText(
          'The Most Trusted\nCryptocurrency\nPlatform',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 32.0, color: Colors.black),
        ),
        Hbox(40.0),
        Image.asset(AppImage.trustedplatform, fit: BoxFit.contain),
        Hbox(40.0),
        _buildFeatureItem(
          number: '01',
          title: 'Sync between platforms',
          description:
              'No matter if you\'re using our web interface or mobile app — your data is always synced. Just one account for all our services.',
          isDesktop: isDesktop,
          isTablet: isTablet,
        ),
        Hbox(28.0),
        _buildFeatureItem(
          number: '02',
          title: 'More focus, less clutter',
          description: 'No ads, just the crypto and content you love.',
          isDesktop: isDesktop,
          isTablet: isTablet,
        ),
        Hbox(28.0),
        _buildFeatureItem(
          number: '03',
          title: 'Security by default',
          description:
              'Enable privacy mode and app locking to protect your data.',
          isDesktop: isDesktop,
          isTablet: isTablet,
        ),
      ],
    );
  }

  Widget _buildFeatureItem({
    required String number,
    required String title,
    required String description,
    required bool isDesktop,
    required bool isTablet,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          number,
          style: Ts.bold(
            size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
            color: const Color(0xFF26CE92).withOpacity(0.3),
          ),
        ),
        Wbox(16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: Ts.bold(
                  size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
                  color: Colors.black,
                ),
              ),
              Hbox(8.0),
              AppText(
                description,
                style: Ts.regular(
                  size: isDesktop ? 15.0 : (isTablet ? 14.0 : 13.0),
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
