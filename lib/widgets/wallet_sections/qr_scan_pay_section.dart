import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class QrScanPaySection extends StatelessWidget {
  const QrScanPaySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
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
              // Left Section - Features
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading
                    AppText(
                      'QR SCAN & PAY — Global USDT Payment Rail',
                      style: Ts.bold(
                        size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                        color: Colors.black,
                      ),
                    ),
                    
                    Hbox(isDesktop ? 24.0 : 20.0),
                    
                    // Introductory Text
                    AppText(
                      'Kapitor\'s universal QR standard enables instant crypto payments across online and offline environments.',
                      style: Ts.regular(
                        size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        color: Colors.grey.shade700,
                      ),
                    ),
                    
                    Hbox(isDesktop ? 40.0 : 32.0),
                    
                    // Features List with Icons
                    _FeatureItemWithIcon(
                      iconPath: AppImage.qs1,
                      title: 'Peer-to-Peer Transfers',
                      description: 'Send money to anyone via QR — no wallet address typing, no errors.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 32.0 : 24.0),
                    _FeatureItemWithIcon(
                      iconPath: AppImage.qs2,
                      title: 'Merchant Acceptance',
                      description: 'Shops, businesses, freelancers, and websites can accept USDT instantly.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 32.0 : 24.0),
                    _FeatureItemWithIcon(
                      iconPath: AppImage.qs3,
                      title: 'Offline/Online Compatibility',
                      description: 'Works across mobile POS systems, printed QR, digital QR, and NFC-enabled setups.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 32.0 : 24.0),
                    _FeatureItemWithIcon(
                      iconPath: AppImage.qs4,
                      title: 'Kapitor turns USDT into a real-world spending currency, not just a trading asset.',
                      description: '',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                  ],
                ),
              ),
              
              Wbox(isDesktop ? 80.0 : 60.0),
              
              // Right Section - QR Code Illustration
              Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isDesktop ? 600.0 : (isTablet ? 500.0 : 400.0),
                  ),
                  child: Image.asset(
                    AppImage.quickpay,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: isDesktop ? 500 : 400,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Center(
                          child: Icon(Icons.qr_code_scanner, size: 100, color: Colors.grey),
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
          // Heading
          AppText(
            'QR SCAN & PAY — Global USDT Payment Rail',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: 28.0,
              color: Colors.black,
            ),
          ),
          
          Hbox(20.0),
          
          // Introductory Text
          AppText(
            'Kapitor\'s universal QR standard enables instant crypto payments across online and offline environments.',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: 14.0,
              color: Colors.grey.shade700,
            ),
          ),
          
          Hbox(32.0),
          
          // QR Code Illustration
          Container(
            constraints: const BoxConstraints(maxHeight: 350.0),
            child: Image.asset(
              AppImage.kphone,
              fit: BoxFit.contain,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Center(
                    child: Icon(Icons.qr_code_scanner, size: 80, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          
          Hbox(32.0),
          
          // Features List with Icons
          _FeatureItemWithIcon(
            iconPath: AppImage.qs1,
            title: 'Peer-to-Peer Transfers',
            description: 'Send money to anyone via QR — no wallet address typing, no errors.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(24.0),
          _FeatureItemWithIcon(
            iconPath: AppImage.qs2,
            title: 'Merchant Acceptance',
            description: 'Shops, businesses, freelancers, and websites can accept USDT instantly.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(24.0),
          _FeatureItemWithIcon(
            iconPath: AppImage.qs3,
            title: 'Offline/Online Compatibility',
            description: 'Works across mobile POS systems, printed QR, digital QR, and NFC-enabled setups.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(24.0),
          _FeatureItemWithIcon(
            iconPath: AppImage.qs4,
            title: 'Kapitor turns USDT into a real-world spending currency, not just a trading asset.',
            description: '',
            isDesktop: false,
            isTablet: false,
          ),
        ],
      ),
    );
  }
}

class _FeatureItemWithIcon extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;

  const _FeatureItemWithIcon({
    required this.iconPath,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          width: isDesktop ? 48.0 : (isTablet ? 42.0 : 38.0),
          height: isDesktop ? 48.0 : (isTablet ? 42.0 : 38.0),
          margin: EdgeInsets.only(right: isDesktop ? 16.0 : 12.0),
          child: Image.asset(
            iconPath,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.check_circle_outline,
                  color: Colors.grey.shade600,
                  size: isDesktop ? 24.0 : 20.0,
                ),
              );
            },
          ),
        ),
        
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: Ts.semiBold(
                  size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                  color: Colors.black,
                ),
              ),
              if (description.isNotEmpty) ...[
                Hbox(4.0),
                AppText(
                  description,
                  style: Ts.regular(
                    size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

