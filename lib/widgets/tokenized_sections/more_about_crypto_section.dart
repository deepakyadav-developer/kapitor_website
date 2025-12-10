import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class MoreAboutCryptoSection extends StatelessWidget {
  const MoreAboutCryptoSection({super.key});

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
          color: const Color(0xFF0D3B3B),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Title
              AppText(
                'Why Tokenized Assets on Kapitor',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                  color: Colors.white,
                ),
              ),
              Hbox(isDesktop ? 24.0 : 20.0),
              // Subtitle
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 800 : double.infinity,
                ),
                child: AppText(
                  'Kapitor transforms traditional markets into instant, borderless digital assets with complete transparency, fractional ownership, and real-world backing.',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
              Hbox(isDesktop ? 60.0 : 50.0),

              // Feature cards grid
              isMobile
                  ? Column(
                      children: [
                        _buildFeatureCard(
                          icon: FontAwesomeIcons.dollarSign,
                          title: 'Gold & Silver Tokens',
                          description:
                              'Invest in PAXG, XAUT, and silver tokens backed by physical bullion. Fully redeemable with verified custodial reports and on-chain reserve proofs.',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                          isMobile: isMobile,
                        ),
                        Hbox(40.0),
                        _buildFeatureCard(
                          icon: FontAwesomeIcons.link,
                          title: 'Oil & Energy Markets',
                          description:
                              'Access crude oil, natural gas, and energy baskets through synthetic token exposure. Trade global energy markets 24/7 without futures accounts.',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                          isMobile: isMobile,
                        ),
                        Hbox(40.0),
                        _buildFeatureCard(
                          icon: FontAwesomeIcons.gear,
                          title: 'Industrial Metals',
                          description:
                              'Trade copper, nickel, zinc, and rare earth metals. Get exposure to industrial commodities driving global manufacturing and technology.',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                          isMobile: isMobile,
                        ),
                        Hbox(40.0),
                        _buildFeatureCard(
                          icon: FontAwesomeIcons.chartArea,
                          title: 'Real-Time NAV Tracking',
                          description:
                              'View live Net Asset Value for every tokenized commodity with historical performance charts and global market comparisons.',
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                          isMobile: isMobile,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildFeatureCard(
                                icon: FontAwesomeIcons.dollarSign,
                                title: 'Gold & Silver Tokens',
                                description:
                                    'Invest in PAXG, XAUT, and silver tokens backed by physical bullion. Fully redeemable with verified custodial reports and on-chain reserve proofs.',
                                isDesktop: isDesktop,
                                isTablet: isTablet,
                                isMobile: isMobile,
                              ),
                            ),
                            Wbox(isDesktop ? 60.0 : 40.0),
                            Expanded(
                              child: _buildFeatureCard(
                                icon: FontAwesomeIcons.link,
                                title: 'Oil & Energy Markets',
                                description:
                                    'Access crude oil, natural gas, and energy baskets through synthetic token exposure. Trade global energy markets 24/7 without futures accounts.',
                                isDesktop: isDesktop,
                                isTablet: isTablet,
                                isMobile: isMobile,
                              ),
                            ),
                          ],
                        ),
                        Hbox(isDesktop ? 60.0 : 50.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildFeatureCard(
                                icon: FontAwesomeIcons.gear,
                                title: 'Industrial Metals',
                                description:
                                    'Trade copper, nickel, zinc, and rare earth metals. Get exposure to industrial commodities driving global manufacturing and technology.',
                                isDesktop: isDesktop,
                                isTablet: isTablet,
                                isMobile: isMobile,
                              ),
                            ),
                            Wbox(isDesktop ? 60.0 : 40.0),
                            Expanded(
                              child: _buildFeatureCard(
                                icon: FontAwesomeIcons.chartArea,
                                title: 'Real-Time NAV Tracking',
                                description:
                                    'View live Net Asset Value for every tokenized commodity with historical performance charts and global market comparisons.',
                                isDesktop: isDesktop,
                                isTablet: isTablet,
                                isMobile: isMobile,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDesktop,
    required bool isTablet,
    required bool isMobile,
  }) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0)),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color(0xFF26CE92).withOpacity(0.2),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: FaIcon(
              icon,
              size: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
              color: const Color(0xFF26CE92),
            ),
          ),
          Hbox(isDesktop ? 24.0 : 20.0),
          AppText(
            title,
            style: Ts.bold(
              size: isDesktop ? 22.0 : (isTablet ? 20.0 : 18.0),
              color: Colors.white,
            ),
          ),
          Hbox(16.0),
          AppText(
            description,
            style: Ts.regular(
              size: isDesktop ? 15.0 : (isTablet ? 14.0 : 13.0),
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          Hbox(isDesktop ? 20.0 : 16.0),
          Row(
            children: [
              AppText(
                'Find out more',
                style: Ts.semiBold(
                  size: isDesktop ? 15.0 : (isTablet ? 14.0 : 13.0),
                  color: const Color(0xFF26CE92),
                ),
              ),
              Wbox(8.0),
              FaIcon(
                FontAwesomeIcons.arrowRight,
                size: isDesktop ? 14.0 : 12.0,
                color: const Color(0xFF26CE92),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
