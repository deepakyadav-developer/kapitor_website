import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class SellBuyCryptoSection extends StatelessWidget {
  const SellBuyCryptoSection({super.key});

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
          color: const Color(0xFFF8F9FA),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Decorative line with dot
              Row(
                children: [
                  Expanded(
                    child: Container(height: 1, color: Colors.grey.shade300),
                  ),
                  Wbox(16.0),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Wbox(16.0),
                  Expanded(
                    child: Container(height: 1, color: Colors.grey.shade300),
                  ),
                ],
              ),
              Hbox(isDesktop ? 80.0 : (isTablet ? 60.0 : 50.0)),

              // Content
              isMobile
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
                                'Sell & Buy Crypto\nwith ease',
                                style: Ts.bold(
                                  size: isDesktop
                                      ? 48.0
                                      : (isTablet ? 38.0 : 32.0),
                                  color: Colors.black,
                                ),
                              ),
                              Hbox(isDesktop ? 24.0 : 20.0),
                              AppText(
                                'This is going to be the most exciting crypto service you have ever tried in your life. keep going',
                                style: Ts.regular(
                                  size: isDesktop
                                      ? 16.0
                                      : (isTablet ? 15.0 : 14.0),
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              Hbox(isDesktop ? 40.0 : 32.0),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF4169E1),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isDesktop
                                        ? 40.0
                                        : (isTablet ? 32.0 : 28.0),
                                    vertical: isDesktop
                                        ? 18.0
                                        : (isTablet ? 16.0 : 14.0),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 0,
                                ),
                                child: AppText(
                                  'Get Started Now',
                                  style: Ts.semiBold(
                                    size: isDesktop
                                        ? 16.0
                                        : (isTablet ? 15.0 : 14.0),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Wbox(isDesktop ? 80.0 : 60.0),
                        // Right image
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            AppImage.sellcrypto,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
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
          'Sell & Buy Crypto\nwith ease',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 32.0, color: Colors.black),
        ),
        Hbox(20.0),
        AppText(
          'This is going to be the most exciting crypto service you have ever tried in your life. keep going',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: Colors.grey.shade600),
        ),
        Hbox(32.0),
        Image.asset(AppImage.sellcrypto, fit: BoxFit.contain),
        Hbox(32.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4169E1),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 14.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            elevation: 0,
          ),
          child: AppText(
            'Get Started Now',
            style: Ts.semiBold(size: 14.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
