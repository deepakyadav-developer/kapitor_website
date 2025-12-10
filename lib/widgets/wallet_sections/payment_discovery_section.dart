import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class PaymentDiscoverySection extends StatelessWidget {
  const PaymentDiscoverySection({Key? key}) : super(key: key);

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

        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Section - Text Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Heading
                    AppText(
                      'KAPITOR PAYMENTS\nThe Global Stablecoin Payments Network',
                      style: Ts.bold(
                        size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                        color: const Color(0xFF1A1A1A),
                      ).copyWith(height: 1.2),
                    ),

                    Hbox(isDesktop ? 24.0 : 20.0),

                    // Description
                    AppText(
                      'Turning USDT into a universal, everyday financial instrument. Kapitor eliminates SWIFT delays, cross-border restrictions, and high banking fees — replacing them with instant payments, universal QR acceptance, and global crypto-to-fiat off-ramping.',
                      style: Ts.regular(
                        size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        color: Colors.grey.shade700,
                      ).copyWith(height: 1.6),
                    ),

                    Hbox(isDesktop ? 40.0 : 32.0),

                    // App Download Buttons
                    Row(
                      children: [
                        _AppStoreButton(
                          imagePath: AppImage.playstorelogo,
                          text: 'GET IT ON\nGoogle Play',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                        Wbox(16.0),
                        _AppStoreButton(
                          imagePath: AppImage.applelogo,
                          text: 'Available on the\nApp Store',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Wbox(isDesktop ? 80.0 : 60.0),

              // Right Section - Illustration
              Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isDesktop ? 500.0 : (isTablet ? 400.0 : 350.0),
                  ),
                  child: Image.asset(
                    AppImage.pana,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: isDesktop ? 400 : 300,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.payment,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Main Heading
          AppText(
            'KAPITOR PAYMENTS\nThe Global Stablecoin Payments Network',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: 32.0,
              color: const Color(0xFF1A1A1A),
            ).copyWith(height: 1.2),
          ),

          Hbox(20.0),

          // Description
          AppText(
            'Turning USDT into a universal, everyday financial instrument. Kapitor eliminates SWIFT delays, cross-border restrictions, and high banking fees — replacing them with instant payments, universal QR acceptance, and global crypto-to-fiat off-ramping.',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: 14.0,
              color: Colors.grey.shade700,
            ).copyWith(height: 1.6),
          ),

          Hbox(32.0),

          // Illustration
          Container(
            constraints: const BoxConstraints(maxHeight: 300.0),
            child: Image.asset(
              AppImage.pana,
              fit: BoxFit.contain,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Icon(Icons.payment, size: 80, color: Colors.grey),
                  ),
                );
              },
            ),
          ),

          Hbox(32.0),

          // App Download Buttons
          Column(
            children: [
              _AppStoreButton(
                imagePath: AppImage.playstorelogo,
                text: 'GET IT ON\nGoogle Play',
                isDesktop: false,
                isTablet: false,
              ),
              Hbox(16.0),
              _AppStoreButton(
                imagePath: AppImage.applelogo,
                text: 'Available on the\nApp Store',
                isDesktop: false,
                isTablet: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AppStoreButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final bool isDesktop;
  final bool isTablet;

  const _AppStoreButton({
    required this.imagePath,
    required this.text,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 20.0 : (isTablet ? 16.0 : 14.0),
        vertical: isDesktop ? 14.0 : (isTablet ? 12.0 : 10.0),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: isDesktop ? 28.0 : (isTablet ? 24.0 : 22.0),
            height: isDesktop ? 28.0 : (isTablet ? 24.0 : 22.0),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.shop,
                color: Colors.white,
                size: isDesktop ? 28.0 : (isTablet ? 24.0 : 22.0),
              );
            },
          ),
          Wbox(12.0),
          AppText(
            text,
            style: Ts.semiBold(
              size: isDesktop ? 14.0 : (isTablet ? 12.0 : 11.0),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
