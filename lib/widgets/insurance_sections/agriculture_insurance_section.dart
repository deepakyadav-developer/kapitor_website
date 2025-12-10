import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class AgricultureInsuranceSection extends StatelessWidget {
  const AgricultureInsuranceSection({super.key});

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
              // Quote section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    '"',
                    style: Ts.bold(
                      size: isDesktop ? 80.0 : (isTablet ? 60.0 : 50.0),
                      color: const Color(0xFF26CE92),
                    ),
                  ),
                  Wbox(16.0),
                  Flexible(
                    child: AppText(
                      'Exchange Failure & Stablecoin Depeg Insurance',
                      textAlign: TextAlign.center,
                      style: Ts.bold(
                        size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Wbox(16.0),
                  AppText(
                    '"',
                    style: Ts.bold(
                      size: isDesktop ? 80.0 : (isTablet ? 60.0 : 50.0),
                      color: const Color(0xFF26CE92),
                    ),
                  ),
                ],
              ),
              Hbox(isDesktop ? 32.0 : 24.0),

              // Description
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 800 : double.infinity,
                ),
                child: AppText(
                  'KapSure protects users against exchange bankruptcy, frozen withdrawals, and custodial failures. Additionally, protection against USDT and other stablecoin depeg events ensures users never lose money from peg instability or liquidity-based shocks.',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Hbox(isDesktop ? 40.0 : 32.0),

              // Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                    vertical: isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 0,
                ),
                child: AppText(
                  'check your prices',
                  style: Ts.semiBold(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.white,
                  ),
                ),
              ),
              Hbox(isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0)),

              // Institutional Insurance section
              Column(
                children: [
                  AppText(
                    'SOLUTIONS',
                    style: Ts.semiBold(
                      size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Hbox(isDesktop ? 16.0 : 12.0),
                  AppText(
                    'Institutional-Level Insurance\nfor Vaults & PPP',
                    textAlign: TextAlign.center,
                    style: Ts.bold(
                      size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                      color: Colors.black,
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
}
