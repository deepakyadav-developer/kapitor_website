import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class EssenceFaqSection extends StatelessWidget {
  const EssenceFaqSection({super.key});

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
              // Header
              AppText(
                'FAQ',
                style: Ts.semiBold(
                  size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                  color: const Color(0xFF26CE92),
                ),
              ),
              Hbox(isDesktop ? 16.0 : 12.0),
              AppText(
                'The Essence of KapSure',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                  color: Colors.black,
                ),
              ),
              Hbox(isDesktop ? 16.0 : 12.0),
              Container(
                constraints: BoxConstraints(
                  maxWidth: isDesktop ? 700 : double.infinity,
                ),
                child: AppText(
                  'KapSure transforms Kapitor into a fortress-like financial system with institutional-grade risk protection, rebuilt for the digital era.',
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Hbox(isDesktop ? 60.0 : 50.0),

              // FAQ Grid
              isMobile
                  ? Column(
                      children: [
                        _buildFaqCard(
                          'What does KapSure cover?',
                          'KapSure provides comprehensive coverage including crypto wallet insurance, smart contract protection, exchange failure insurance, stablecoin depeg protection, and institutional-level insurance for vaults and PPP.',
                          isDesktop,
                          isTablet,
                        ),
                        Hbox(24.0),
                        _buildFaqCard(
                          'How does custodial insurance work?',
                          'Fireblocks/BitGo-grade protection covers cold wallets, multi-sig vaults, and segregated institutional storage against theft, protocol compromise, custodian insolvency, and malicious insiders.',
                          isDesktop,
                          isTablet,
                        ),
                        Hbox(24.0),
                        _buildFaqCard(
                          'What is stablecoin depeg insurance?',
                          'KapSure protects users against partial depeg, severe temporary depeg, long-term depeg, liquidity-based instability, and market-wide stablecoin shocks for USDT, USDC, and other pegged assets.',
                          isDesktop,
                          isTablet,
                        ),
                        Hbox(24.0),
                        _buildFaqCard(
                          'How are PPP investments protected?',
                          'PPP has dedicated insurance covering principal allocations, NAV stability, diversification logic, liquidity thresholds, and execution routes with segregated reserve baskets per pool.',
                          isDesktop,
                          isTablet,
                        ),
                        Hbox(24.0),
                        _buildFaqCard(
                          'What is counterparty risk insurance?',
                          'Protection against third-party insolvency, liquidity provider failures, partner breaches, and settlement failures ensures investor funds remain protected even if partners fail.',
                          isDesktop,
                          isTablet,
                        ),
                        Hbox(24.0),
                        _buildFaqCard(
                          'How can I verify my insurance coverage?',
                          'KapSure integrates with KapClear allowing real-time verification of vault insurance, PPP coverage, reserve health, liquidity buffers, custodian validity, and on-chain contract verification.',
                          isDesktop,
                          isTablet,
                        ),
                      ],
                    )
                  : Wrap(
                      spacing: isDesktop ? 40.0 : 24.0,
                      runSpacing: isDesktop ? 40.0 : 24.0,
                      children: [
                        _buildFaqCard(
                          'What does KapSure cover?',
                          'KapSure provides comprehensive coverage including crypto wallet insurance, smart contract protection, exchange failure insurance, stablecoin depeg protection, and institutional-level insurance for vaults and PPP.',
                          isDesktop,
                          isTablet,
                        ),
                        _buildFaqCard(
                          'How does custodial insurance work?',
                          'Fireblocks/BitGo-grade protection covers cold wallets, multi-sig vaults, and segregated institutional storage against theft, protocol compromise, custodian insolvency, and malicious insiders.',
                          isDesktop,
                          isTablet,
                        ),
                        _buildFaqCard(
                          'What is stablecoin depeg insurance?',
                          'KapSure protects users against partial depeg, severe temporary depeg, long-term depeg, liquidity-based instability, and market-wide stablecoin shocks for USDT, USDC, and other pegged assets.',
                          isDesktop,
                          isTablet,
                        ),
                        _buildFaqCard(
                          'How are PPP investments protected?',
                          'PPP has dedicated insurance covering principal allocations, NAV stability, diversification logic, liquidity thresholds, and execution routes with segregated reserve baskets per pool.',
                          isDesktop,
                          isTablet,
                        ),
                        _buildFaqCard(
                          'What is counterparty risk insurance?',
                          'Protection against third-party insolvency, liquidity provider failures, partner breaches, and settlement failures ensures investor funds remain protected even if partners fail.',
                          isDesktop,
                          isTablet,
                        ),
                        _buildFaqCard(
                          'How can I verify my insurance coverage?',
                          'KapSure integrates with KapClear allowing real-time verification of vault insurance, PPP coverage, reserve health, liquidity buffers, custodian validity, and on-chain contract verification.',
                          isDesktop,
                          isTablet,
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFaqCard(
    String question,
    String answer,
    bool isDesktop,
    bool isTablet,
  ) {
    final cardWidth = isDesktop ? 450.0 : (isTablet ? 320.0 : double.infinity);

    return SizedBox(
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            question,
            style: Ts.bold(
              size: isDesktop ? 18.0 : (isTablet ? 17.0 : 16.0),
              color: Colors.black,
            ),
          ),
          Hbox(12.0),
          AppText(
            answer,
            style: Ts.regular(
              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
