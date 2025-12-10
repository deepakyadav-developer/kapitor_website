import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class InsuranceFeaturesSection extends StatelessWidget {
  const InsuranceFeaturesSection({super.key});

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
        final verticalPadding = isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0);

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: isMobile
              ? Column(
                  children: [
                    _buildFeatureCard(
                      FontAwesomeIcons.shield,
                      'Custodial\nInsurance',
                      'Fireblocks/BitGo-grade protection for cold wallets, multi-sig vaults, and segregated institutional storage against theft and protocol compromise.',
                      isDesktop,
                      isTablet,
                    ),
                    Hbox(24.0),
                    _buildFeatureCard(
                      FontAwesomeIcons.puzzlePiece,
                      'Liquidity\nProtection Buffers',
                      'Internal liquidity buffers in each vault and PPP pool absorb volatility and ensure smooth withdrawals with consistent APY.',
                      isDesktop,
                      isTablet,
                    ),
                    Hbox(24.0),
                    _buildFeatureCard(
                      FontAwesomeIcons.fileLines,
                      'Counterparty Risk\nInsurance',
                      'Protection against third-party insolvency, liquidity provider failures, partner breaches, and settlement failures.',
                      isDesktop,
                      isTablet,
                    ),
                    Hbox(24.0),
                    _buildFeatureCard(
                      FontAwesomeIcons.basketShopping,
                      'Segregated\nReserve Baskets\nper Pool',
                      'Each vault and PPP pool maintains independently insured reserves, ensuring one pool\'s risk cannot affect another.',
                      isDesktop,
                      isTablet,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildFeatureCard(
                        FontAwesomeIcons.shield,
                        'Custodial\nInsurance',
                        'Predictive analytics to gain actionable insights and forecast future trends.',
                        isDesktop,
                        isTablet,
                      ),
                    ),
                    Wbox(isDesktop ? 32.0 : 24.0),
                    Expanded(
                      child: _buildFeatureCard(
                        FontAwesomeIcons.puzzlePiece,
                        'Liquidity\nProtection Buffers',
                        'Enhance your operational efficiency with our AI-driven automated workflows.',
                        isDesktop,
                        isTablet,
                      ),
                    ),
                    Wbox(isDesktop ? 32.0 : 24.0),
                    Expanded(
                      child: _buildFeatureCard(
                        FontAwesomeIcons.fileLines,
                        'Counterparty Risk\nInsurance',
                        'Language processing to extract meaningful unstructured data.',
                        isDesktop,
                        isTablet,
                      ),
                    ),
                    Wbox(isDesktop ? 32.0 : 24.0),
                    Expanded(
                      child: _buildFeatureCard(
                        FontAwesomeIcons.basketShopping,
                        'Segregated\nReserve Baskets\nper Pool',
                        'Collaborate with our team of AI experts to build and deploy bespoke models.',
                        isDesktop,
                        isTablet,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildFeatureCard(
    IconData icon,
    String title,
    String description,
    bool isDesktop,
    bool isTablet,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FaIcon(
          icon,
          size: isDesktop ? 48.0 : (isTablet ? 42.0 : 36.0),
          color: const Color(0xFF26CE92),
        ),
        Hbox(isDesktop ? 24.0 : 20.0),
        AppText(
          title,
          style: Ts.bold(
            size: isDesktop ? 22.0 : (isTablet ? 20.0 : 18.0),
            color: Colors.black,
          ),
        ),
        Hbox(isDesktop ? 16.0 : 12.0),
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
