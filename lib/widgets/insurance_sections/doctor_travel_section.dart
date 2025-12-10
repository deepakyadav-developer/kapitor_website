import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class DoctorTravelSection extends StatelessWidget {
  const DoctorTravelSection({super.key});

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
                            'SMART CONTRACT PROTECTION',
                            style: Ts.semiBold(
                              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                              color: const Color(0xFF26CE92),
                            ),
                          ),
                          Hbox(isDesktop ? 16.0 : 12.0),
                          AppText(
                            'Coverage for\nthe DeFi\nBackbone',
                            style: Ts.bold(
                              size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                              color: Colors.black,
                            ),
                          ),
                          Hbox(isDesktop ? 24.0 : 20.0),
                          AppText(
                            'All smart contracts across Kapitor\'s ecosystem are fully covered. Protection against contract vulnerabilities, execution failures, oracle malfunctions, exploit attempts, and zero-day vulnerabilities.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wbox(isDesktop ? 80.0 : 60.0),
                    // Right image and text
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Image.asset(AppImage.doctors, fit: BoxFit.contain),
                          Hbox(isDesktop ? 32.0 : 24.0),
                          Container(
                            padding: EdgeInsets.all(isDesktop ? 24.0 : 20.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF8F9FA),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: AppText(
                              'KapSure ensures DeFi elements of KapVault, KapTrade, PPP, and Tokenized Assets remain protected at all times with comprehensive smart contract insurance.',
                              textAlign: TextAlign.center,
                              style: Ts.regular(
                                size: isDesktop
                                    ? 14.0
                                    : (isTablet ? 13.0 : 12.0),
                                color: Colors.grey.shade600,
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
          'SMART CONTRACT PROTECTION',
          textAlign: TextAlign.center,
          style: Ts.semiBold(size: 12.0, color: const Color(0xFF26CE92)),
        ),
        Hbox(12.0),
        AppText(
          'Coverage for\nthe DeFi\nBackbone',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 32.0, color: Colors.black),
        ),
        Hbox(20.0),
        AppText(
          'All smart contracts across Kapitor\'s ecosystem are fully covered. Protection against contract vulnerabilities, execution failures, oracle malfunctions, exploit attempts, and zero-day vulnerabilities.',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: Colors.grey.shade600),
        ),
        Hbox(40.0),
        Image.asset(AppImage.doctors, fit: BoxFit.contain),
        Hbox(24.0),
        Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FA),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: AppText(
            'KapSure ensures DeFi elements of KapVault, KapTrade, PPP, and Tokenized Assets remain protected at all times with comprehensive smart contract insurance.',
            textAlign: TextAlign.center,
            style: Ts.regular(size: 12.0, color: Colors.grey.shade600),
          ),
        ),
      ],
    );
  }
}
