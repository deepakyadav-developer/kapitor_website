import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class InsuranceHeroSection extends StatelessWidget {
  const InsuranceHeroSection({super.key});

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
        final verticalPadding = isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0);

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF26CE92), Color(0xFF1DB87A)],
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Title
              AppText(
                'KAPSURE — The Hybrid Real-World +\nCrypto Insurance Engine',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                  color: Colors.black,
                ),
              ),
              Hbox(isDesktop ? 24.0 : 20.0),

              // Description
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 900 : double.infinity,
                ),
                child: AppText(
                  'KapSure is Kapitor\'s dedicated insurance and risk-mitigation framework, built to protect every element of a user\'s financial journey — from wallets and stablecoins to smart contracts, exchanges, vaults, and private placement pools.',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.black.withOpacity(0.8),
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
              Hbox(isDesktop ? 60.0 : 50.0),

              // Insurance image
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 900 : double.infinity,
                ),
                child: Image.asset(AppImage.insurance, fit: BoxFit.contain),
              ),
            ],
          ),
        );
      },
    );
  }
}
