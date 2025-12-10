import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class CryptoSavingBaseSection extends StatelessWidget {
  const CryptoSavingBaseSection({super.key});

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
          decoration: const BoxDecoration(color: Color(0xFF0A0A0A)),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: isMobile
              ? _buildMobileLayout(isDesktop, isTablet, isMobile)
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Left image
                    Expanded(
                      flex: 1,
                      child: Image.asset(AppImage.solar, fit: BoxFit.contain),
                    ),
                    Wbox(isDesktop ? 80.0 : 60.0),
                    // Right content
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'ABOUT US',
                            style: Ts.semiBold(
                              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                              color: const Color(0xFF26CE92),
                            ),
                          ),
                          Hbox(isDesktop ? 16.0 : 12.0),
                          AppText(
                            'Crypto Saving Base\nof Your Choice',
                            style: Ts.bold(
                              size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                              color: Colors.white,
                            ),
                          ),
                          Hbox(isDesktop ? 24.0 : 20.0),
                          AppText(
                            'Build a diversified portfolio combining crypto, precious metals, commodities, stocks, and indices. All tokenized, backed by real assets, and accessible with USDT from one unified platform.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          Hbox(isDesktop ? 40.0 : 32.0),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF26CE92),
                              side: const BorderSide(
                                color: Color(0xFF26CE92),
                                width: 2,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: isDesktop
                                    ? 40.0
                                    : (isTablet ? 32.0 : 28.0),
                                vertical: isDesktop
                                    ? 16.0
                                    : (isTablet ? 14.0 : 12.0),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: AppText(
                              'Learn More',
                              style: Ts.semiBold(
                                size: isDesktop
                                    ? 16.0
                                    : (isTablet ? 15.0 : 14.0),
                                color: const Color(0xFF26CE92),
                              ),
                            ),
                          ),
                        ],
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
          'ABOUT US',
          textAlign: TextAlign.center,
          style: Ts.semiBold(size: 12.0, color: const Color(0xFF26CE92)),
        ),
        Hbox(12.0),
        AppText(
          'Crypto Saving Base\nof Your Choice',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 28.0, color: Colors.white),
        ),
        Hbox(20.0),
        AppText(
          'Build a diversified portfolio combining crypto, precious metals, commodities, stocks, and indices. All tokenized, backed by real assets, and accessible with USDT from one unified platform.',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: Colors.white.withOpacity(0.7)),
        ),
        Hbox(32.0),
        Image.asset(AppImage.solar, fit: BoxFit.contain),
        Hbox(32.0),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF26CE92),
            side: const BorderSide(color: Color(0xFF26CE92), width: 2),
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 12.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: AppText(
            'Learn More',
            style: Ts.semiBold(size: 14.0, color: const Color(0xFF26CE92)),
          ),
        ),
      ],
    );
  }
}
