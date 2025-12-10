import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapsureKapclearSection extends StatelessWidget {
  const KapsureKapclearSection({super.key});

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
                            'KapSure + KapClear: Full\nTransparency, Zero\nUncertainty',
                            style: Ts.bold(
                              size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                              color: Colors.black,
                            ),
                          ),
                          Hbox(isDesktop ? 24.0 : 20.0),
                          AppText(
                            'KapSure integrates with KapClear for real-time verification. View vault insurance details, PPP coverage, reserve health, liquidity buffers, custodian insurance validity, on-chain contract verification, and coverage ratios - all transparent and independently verifiable.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Hbox(isDesktop ? 40.0 : 32.0),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.black,
                              side: const BorderSide(
                                color: Colors.black,
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
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: AppText(
                              'Explore Now',
                              style: Ts.semiBold(
                                size: isDesktop
                                    ? 16.0
                                    : (isTablet ? 15.0 : 14.0),
                                color: Colors.black,
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
                        AppImage.insurance4,
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
          'KapSure + KapClear: Full\nTransparency, Zero\nUncertainty',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 28.0, color: Colors.black),
        ),
        Hbox(20.0),
        AppText(
          'KapSure integrates with KapClear for real-time verification. View vault insurance details, PPP coverage, reserve health, liquidity buffers, custodian insurance validity, on-chain contract verification, and coverage ratios - all transparent and independently verifiable.',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: Colors.grey.shade600),
        ),
        Hbox(32.0),
        Image.asset(AppImage.insurance3, fit: BoxFit.contain),
        Hbox(32.0),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.black, width: 2),
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
              vertical: 14.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: AppText(
            'Explore Now',
            style: Ts.semiBold(size: 14.0, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
