import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class CryptoPremiumSection extends StatelessWidget {
  const CryptoPremiumSection({Key? key}) : super(key: key);

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
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFFE8F5F1), const Color(0xFFD4F1E8)],
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Section - Chart Image
              Expanded(
                flex: 1,
                child: Image.asset(
                  AppImage.statastics,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: isDesktop ? 400 : 300,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.show_chart,
                          size: 100,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Wbox(isDesktop ? 80.0 : 60.0),

              // Right Section - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag
                    AppText(
                      'FEATURES',
                      style: Ts.semiBold(
                        size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                        color: const Color(0xFF26CE92),
                      ),
                    ),

                    Hbox(isDesktop ? 16.0 : 12.0),

                    // Main Heading
                    AppText(
                      'Crypto Premium',
                      style: Ts.bold(
                        size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                        color: Colors.black,
                      ),
                    ),

                    Hbox(isDesktop ? 40.0 : 32.0),

                    // Feature 1
                    _FeatureItem(
                      icon: FontAwesomeIcons.plus,
                      iconColor: const Color(0xFFE91E63),
                      title: 'Advanced Trading Tools',
                      description:
                          'Access professional-grade charting, technical indicators, and real-time market data for informed trading decisions.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),

                    Hbox(isDesktop ? 32.0 : 24.0),

                    // Feature 2
                    _FeatureItem(
                      icon: FontAwesomeIcons.basketShopping,
                      iconColor: const Color(0xFFE91E63),
                      title: 'Instant Order Execution',
                      description:
                          'Execute trades instantly with institutional-grade liquidity and minimal slippage across all markets.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),

                    Hbox(isDesktop ? 32.0 : 24.0),

                    // Feature 3
                    _FeatureItem(
                      icon: FontAwesomeIcons.gift,
                      iconColor: const Color(0xFFE91E63),
                      title: 'AI Trade Signals',
                      description:
                          'Get AI-powered trade recommendations based on market analysis, trends, and risk indicators.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
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

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [const Color(0xFFE8F5F1), const Color(0xFFD4F1E8)],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // Tag
          AppText(
            'FEATURES',
            textAlign: TextAlign.center,
            style: Ts.semiBold(size: 12.0, color: const Color(0xFF26CE92)),
          ),

          Hbox(12.0),

          // Main Heading
          AppText(
            'Crypto Premium',
            textAlign: TextAlign.center,
            style: Ts.bold(size: 28.0, color: Colors.black),
          ),

          Hbox(32.0),

          // Chart Image
          Image.asset(
            AppImage.chart,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Icon(Icons.show_chart, size: 80, color: Colors.grey),
                ),
              );
            },
          ),

          Hbox(32.0),

          // Features
          _FeatureItem(
            icon: FontAwesomeIcons.plus,
            iconColor: const Color(0xFFE91E63),
            title: 'Budgeting Intervals',
            description:
                'Lorem ipsum dolor sit amet. Qui consequatur sint 33 voluptatem officia et sint laboriosam sed ipsa sint ut voluptatum labore et.',
            isDesktop: false,
            isTablet: false,
          ),

          Hbox(24.0),

          _FeatureItem(
            icon: FontAwesomeIcons.basketShopping,
            iconColor: const Color(0xFFE91E63),
            title: 'Budgeting Intervals',
            description:
                'Lorem ipsum dolor sit amet. Qui consequatur sint 33 voluptatem officia et sint laboriosam sed ipsa sint ut voluptatum labore et.',
            isDesktop: false,
            isTablet: false,
          ),

          Hbox(24.0),

          _FeatureItem(
            icon: FontAwesomeIcons.gift,
            iconColor: const Color(0xFFE91E63),
            title: 'Budgeting Intervals',
            description:
                'Lorem ipsum dolor sit amet. Qui consequatur sint 33 voluptatem officia et sint laboriosam sed ipsa sint ut voluptatum labore et.',
            isDesktop: false,
            isTablet: false,
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;

  const _FeatureItem({
    required this.icon,
    required this.iconColor,
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
          width: isDesktop ? 24.0 : (isTablet ? 22.0 : 20.0),
          height: isDesktop ? 24.0 : (isTablet ? 22.0 : 20.0),
          margin: EdgeInsets.only(top: 2.0, right: isDesktop ? 16.0 : 12.0),
          child: FaIcon(
            icon,
            color: iconColor,
            size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
          ),
        ),

        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: Ts.bold(
                  size: isDesktop ? 18.0 : (isTablet ? 16.0 : 15.0),
                  color: Colors.black,
                ),
              ),
              Hbox(8.0),
              AppText(
                description,
                style: Ts.regular(
                  size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
