import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class CrossChainBridgeSection extends StatelessWidget {
  const CrossChainBridgeSection({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Section - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Heading
                    AppText(
                      'CROSS-CHAIN BRIDGE — Intelligent Multi-Chain Transfer Engine',
                      style: Ts.bold(
                        size: isDesktop ? 36.0 : (isTablet ? 28.0 : 24.0),
                        color: Colors.black,
                      ),
                    ),
                    
                    Hbox(isDesktop ? 40.0 : 32.0),
                    
                    // Features List
                    _BridgeFeatureItem(
                      title: 'Advanced Bridge Features',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 24.0 : 16.0),
                    _BridgeFeatureItem(
                      title: 'Automated Chain Routing',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 24.0 : 16.0),
                    _BridgeFeatureItem(
                      title: 'Optimal Gas Fee Path Selection: The system automatically chooses the cheapest and fastest route.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 24.0 : 16.0),
                    _BridgeFeatureItem(
                      title: 'Secure Cross-Chain Message Passing: All transfers use secure bridging protocols validated by audit trails and browser-side verification.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(isDesktop ? 24.0 : 16.0),
                    _BridgeFeatureItem(
                      title: 'Zero Technical Complexity for Users: Users simply choose: \'Send > Select Chain > Confirm\' Kapitor handles the rest behind the scenes.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    
                    Hbox(isDesktop ? 40.0 : 32.0),
                    
                    // Download Apps Button
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 32.0 : 24.0,
                        vertical: isDesktop ? 16.0 : 12.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: AppText(
                        'Download Apps',
                        style: Ts.semiBold(
                          size: isDesktop ? 16.0 : 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Wbox(isDesktop ? 60.0 : 40.0),
              
              // Right Section - Illustration
              Expanded(
                flex: 1,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isDesktop ? 500.0 : (isTablet ? 400.0 : 300.0),
                  ),
                  child: Image.asset(
                    AppImage.chainbridge, // Using app image as placeholder
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
                          child: Icon(Icons.phone_android, size: 100, color: Colors.grey),
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
            'CROSS-CHAIN BRIDGE — Intelligent Multi-Chain Transfer Engine',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: 24.0,
              color: Colors.black,
            ),
          ),
          
          Hbox(32.0),
          
          // Illustration
          Container(
            constraints: const BoxConstraints(maxHeight: 300.0),
            child: Image.asset(
              AppImage.app,
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
                    child: Icon(Icons.phone_android, size: 80, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          
          Hbox(32.0),
          
          // Features List
          _BridgeFeatureItem(
            title: 'Advanced Bridge Features',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(16.0),
          _BridgeFeatureItem(
            title: 'Automated Chain Routing',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(16.0),
          _BridgeFeatureItem(
            title: 'Optimal Gas Fee Path Selection: The system automatically chooses the cheapest and fastest route.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(16.0),
          _BridgeFeatureItem(
            title: 'Secure Cross-Chain Message Passing: All transfers use secure bridging protocols validated by audit trails and browser-side verification.',
            isDesktop: false,
            isTablet: false,
          ),
          Hbox(16.0),
          _BridgeFeatureItem(
            title: 'Zero Technical Complexity for Users: Users simply choose: \'Send > Select Chain > Confirm\' Kapitor handles the rest behind the scenes.',
            isDesktop: false,
            isTablet: false,
          ),
          
          Hbox(32.0),
          
          // Download Apps Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: AppText(
              'Download Apps',
              style: Ts.semiBold(
                size: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BridgeFeatureItem extends StatelessWidget {
  final String title;
  final bool isDesktop;
  final bool isTablet;

  const _BridgeFeatureItem({
    required this.title,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8.0,
          height: 8.0,
          margin: EdgeInsets.only(top: isDesktop ? 8.0 : 6.0, right: 12.0),
          decoration: const BoxDecoration(
            color: Color(0xFF4CAF50),
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: AppText(
            title,
            style: Ts.regular(
              size: isDesktop ? 16.0 : (isTablet ? 14.0 : 13.0),
              color: Colors.grey.shade700,
            ),
          ),
        ),
      ],
    );
  }
}

