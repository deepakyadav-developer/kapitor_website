import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class InviteTeamInsuranceSection extends StatelessWidget {
  const InviteTeamInsuranceSection({super.key});

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
                      child: Container(
                        padding: EdgeInsets.all(isDesktop ? 60.0 : 40.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Circular text badge
                            Container(
                              width: isDesktop ? 120 : 100,
                              height: isDesktop ? 120 : 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: AppText(
                                  'EXPANDING\nYOUR\nOPPORTUNITIES',
                                  textAlign: TextAlign.center,
                                  style: Ts.bold(
                                    size: isDesktop ? 10.0 : 9.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Hbox(isDesktop ? 40.0 : 32.0),
                            AppText(
                              'Crypto Wallet Insurance\nCustodial & Self-Custodial',
                              style: Ts.bold(
                                size: isDesktop
                                    ? 36.0
                                    : (isTablet ? 30.0 : 26.0),
                                color: Colors.black,
                              ),
                            ),
                            Hbox(isDesktop ? 24.0 : 20.0),
                            AppText(
                              'KapSure provides full coverage for both custodial wallets with MPC-secured custody and self-custodial wallets connected through WalletConnect. Protection against unauthorized access, custody breaches, and malicious approvals.',
                              style: Ts.regular(
                                size: isDesktop
                                    ? 16.0
                                    : (isTablet ? 15.0 : 14.0),
                                color: Colors.grey.shade600,
                              ),
                            ),
                            Hbox(isDesktop ? 32.0 : 28.0),
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
                    ),
                    Wbox(isDesktop ? 80.0 : 60.0),
                    // Right image
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        AppImage.insuranceteam,
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
        Container(
          padding: const EdgeInsets.all(40.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular text badge
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: Center(
                  child: AppText(
                    'EXPANDING\nYOUR\nOPPORTUNITIES',
                    textAlign: TextAlign.center,
                    style: Ts.bold(size: 9.0, color: Colors.black),
                  ),
                ),
              ),
              Hbox(32.0),
              AppText(
                'Crypto Wallet Insurance\nCustodial & Self-Custodial',
                style: Ts.bold(size: 26.0, color: Colors.black),
              ),
              Hbox(20.0),
              AppText(
                'KapSure provides full coverage for both custodial wallets with MPC-secured custody and self-custodial wallets connected through WalletConnect. Protection against unauthorized access, custody breaches, and malicious approvals.',
                style: Ts.regular(size: 14.0, color: Colors.grey.shade600),
              ),
              Hbox(28.0),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black, width: 2),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 12.0,
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
          ),
        ),
        Hbox(40.0),
        Image.asset(AppImage.insuranceteam, fit: BoxFit.contain),
      ],
    );
  }
}
