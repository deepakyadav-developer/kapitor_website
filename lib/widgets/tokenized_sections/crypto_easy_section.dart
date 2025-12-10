import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class CryptoEasySection extends StatelessWidget {
  const CryptoEasySection({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left section - Title and description
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            'Real-World Assets,\nDigitally Accessible',
                            style: Ts.bold(
                              size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                              color: Colors.black,
                            ),
                          ),
                          Hbox(isDesktop ? 24.0 : 20.0),
                          AppText(
                            'Kapitor converts traditional global markets into digitally liquid, always-on, universally accessible investment opportunities through tokenization.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Wbox(isDesktop ? 80.0 : 60.0),
                    // Right section - Feature cards
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _buildFeatureCard(
                                  icon: FontAwesomeIcons.database,
                                  title: 'Fractional Ownership',
                                  description:
                                      'Invest with any amount - \$1, ₹100, or 0.01 USDT. No minimum lots or high capital requirements.',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                              ),
                              Wbox(isDesktop ? 32.0 : 24.0),
                              Expanded(
                                child: _buildFeatureCard(
                                  icon: FontAwesomeIcons.shieldHalved,
                                  title: 'Real-World Backed',
                                  description:
                                      'Every token is backed 1:1 with physical assets, verified through custodial audits and reserve proofs.',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                              ),
                            ],
                          ),
                          Hbox(isDesktop ? 40.0 : 32.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: _buildFeatureCard(
                                  icon: FontAwesomeIcons.lightbulb,
                                  title: '24/7 Global Access',
                                  description:
                                      'Trade tokenized assets anytime, anywhere. No brokers, no geographic restrictions, instant settlement.',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                              ),
                              Wbox(isDesktop ? 32.0 : 24.0),
                              Expanded(
                                child: _buildFeatureCard(
                                  icon: FontAwesomeIcons.chartLine,
                                  title: 'Real-Time NAV Tracking',
                                  description:
                                      'View live Net Asset Value for every tokenized asset with historical performance and market comparisons.',
                                  isDesktop: isDesktop,
                                  isTablet: isTablet,
                                ),
                              ),
                            ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'We make crypto\neasy.',
          style: Ts.bold(size: 32.0, color: Colors.black),
        ),
        Hbox(20.0),
        AppText(
          'Kapitor converts traditional global markets into digitally liquid, always-on, universally accessible investment opportunities through tokenization.',
          style: Ts.regular(size: 14.0, color: Colors.grey.shade600),
        ),
        Hbox(40.0),
        _buildFeatureCard(
          icon: FontAwesomeIcons.database,
          title: 'Secure storage',
          description:
              'We store the vast majority of the digital assets in secure offline storage.',
          isDesktop: isDesktop,
          isTablet: isTablet,
        ),
        Hbox(24.0),
        _buildFeatureCard(
          icon: FontAwesomeIcons.shieldHalved,
          title: 'Protected by insurance',
          description:
              'Cryptocurrency stored on our servers is covered by our insurance policy.',
          isDesktop: isDesktop,
          isTablet: isTablet,
        ),
        Hbox(24.0),
        _buildFeatureCard(
          icon: FontAwesomeIcons.lightbulb,
          title: '24/7 Global Access',
          description:
              'Trade tokenized assets anytime, anywhere. No brokers, no geographic restrictions, instant settlement.',
          isDesktop: isDesktop,
          isTablet: isTablet,
        ),
        Hbox(24.0),
        _buildFeatureCard(
          icon: FontAwesomeIcons.chartLine,
          title: 'Trade Assets',
          description:
              'Discover new and innovative crypto assets with over 200 spot trading pairs and 25 margin.',
          isDesktop: isDesktop,
          isTablet: isTablet,
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDesktop,
    required bool isTablet,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF4E6),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: FaIcon(
            icon,
            size: isDesktop ? 24.0 : 20.0,
            color: const Color(0xFFFF9800),
          ),
        ),
        Hbox(16.0),
        AppText(
          title,
          style: Ts.bold(
            size: isDesktop ? 18.0 : (isTablet ? 17.0 : 16.0),
            color: Colors.black,
          ),
        ),
        Hbox(12.0),
        AppText(
          description,
          style: Ts.regular(
            size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
