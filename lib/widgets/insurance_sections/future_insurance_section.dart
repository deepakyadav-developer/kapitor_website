import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class FutureInsuranceSection extends StatelessWidget {
  const FutureInsuranceSection({super.key});

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
                            'Dedicated PPP\nInsurance Framework',
                            style: Ts.bold(
                              size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                              color: Colors.black,
                            ),
                          ),
                          Hbox(isDesktop ? 24.0 : 20.0),
                          AppText(
                            'Kapitor\'s Private Placement Programme has its own insurance layer providing multi-layered protection unmatched by traditional private wealth products.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Hbox(isDesktop ? 32.0 : 28.0),
                          _buildCheckItem(
                            'Principal allocations fully protected',
                            isDesktop,
                            isTablet,
                          ),
                          Hbox(12.0),
                          _buildCheckItem(
                            'NAV stability and diversification logic insurance',
                            isDesktop,
                            isTablet,
                          ),
                          Hbox(12.0),
                          _buildCheckItem(
                            'Liquidity thresholds and execution route protection',
                            isDesktop,
                            isTablet,
                          ),
                          Hbox(isDesktop ? 40.0 : 32.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4CAF50),
                              foregroundColor: Colors.white,
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
                              elevation: 0,
                            ),
                            child: AppText(
                              'Get a demo',
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(
                          AppImage.insurance3,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildCheckItem(String text, bool isDesktop, bool isTablet) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.check,
          size: isDesktop ? 16.0 : 14.0,
          color: const Color(0xFF26CE92),
        ),
        Wbox(12.0),
        Expanded(
          child: AppText(
            text,
            style: Ts.regular(
              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        AppText(
          'Dedicated PPP\nInsurance Framework',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 28.0, color: Colors.black),
        ),
        Hbox(20.0),
        AppText(
          'Kapitor\'s Private Placement Programme has its own insurance layer providing multi-layered protection unmatched by traditional private wealth products.',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: Colors.grey.shade600),
        ),
        Hbox(32.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(AppImage.insurance3, fit: BoxFit.cover),
        ),
        Hbox(32.0),
        _buildCheckItem(
          'Principal allocations fully protected',
          isDesktop,
          isTablet,
        ),
        Hbox(12.0),
        _buildCheckItem(
          'NAV stability and diversification logic insurance',
          isDesktop,
          isTablet,
        ),
        Hbox(12.0),
        _buildCheckItem(
          'Liquidity thresholds and execution route protection',
          isDesktop,
          isTablet,
        ),
        Hbox(32.0),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF50),
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
            'Get a demo',
            style: Ts.semiBold(size: 14.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
