import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// FAQ Section with expandable questions
class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  int? _expandedIndex;

  final List<Map<String, String>> _faqs = [
    {
      'question': 'What is Kapitor?',
      'answer':
          'Kapitor is a USDT-powered global financial super-app that combines payments, savings, trading, tokenized assets, insurance, and institutional wealth products into one unified platform. It offers the simplicity of a US bank, the security of a private bank, and the transparency of DeFi.',
    },
    {
      'question': 'How do I create a Kapitor account?',
      'answer':
          'Download the Kapitor app from the App Store or Google Play, complete the KYC verification process (identity verification), and start using Kapitor. The entire process takes just a few minutes.',
    },
    {
      'question': 'Which blockchain networks does Kapitor support?',
      'answer':
          'Kapitor supports multiple blockchain networks including Ethereum, Polygon, Arbitrum, Optimism, Base, BNB Chain, Avalanche, and Solana. You can seamlessly move USDT across these chains within the app.',
    },
    {
      'question': 'What is KapVault and how does it generate yield?',
      'answer':
          'KapVault is Kapitor\'s institutional-grade savings product offering 8-12% APY on USDT deposits. It generates yield through diversified DeFi strategies, liquidity provision, and institutional lending, all while maintaining full transparency and insurance coverage.',
    },
    {
      'question': 'Can I trade stocks and commodities on Kapitor?',
      'answer':
          'Yes! KapTrade allows you to trade crypto, tokenized stocks, commodities (gold, silver, oil), and agricultural futures—all using USDT. You get access to global markets 24/7 with AI-powered trade signals and advanced charting tools.',
    },
    {
      'question': 'What are Tokenized Assets on Kapitor?',
      'answer':
          'Tokenized Assets are real-world assets like gold, silver, oil, and global stocks that have been digitized on the blockchain. You can buy fractional ownership, trade 24/7, and track real-time NAV—all backed by physical reserves.',
    },
    {
      'question': 'What is KapSure and what does it protect?',
      'answer':
          'KapSure is Kapitor\'s comprehensive insurance framework protecting custodial wallets, self-custodial wallets, smart contracts, exchange failures, stablecoin depegs, vault deposits, and PPP allocations. It provides institutional-grade protection across the entire ecosystem.',
    },
    {
      'question': 'Who is eligible for the Private Placement Programme (PPP)?',
      'answer':
          'PPP is designed for High Net Worth Individuals (HNWIs), Ultra High Net Worth Individuals (UHNWIs), Accredited Investors, Institutions, and Family Offices. Minimum investment pools range from 1M to 10M with 10x to 20x returns over 1, 3, or 5-year lock-ins.',
    },
    {
      'question': 'What is KapAI and how does it help me?',
      'answer':
          'KapAI is Kapitor\'s central intelligence layer providing real-time market sentiment analysis, yield optimization recommendations, AI-powered trade signals, risk alerts, portfolio health scoring, and 24/7 AI helpdesk support across the entire platform.',
    },
    {
      'question': 'How does Kapitor ensure security and transparency?',
      'answer':
          'Kapitor uses Real-Time Proof-of-Reserves (live reserve data), On-Chain Verification (cold wallet addresses), Smart Contract Audits (externally audited and published), and Insurance-Backed Coverage. Everything is verifiable through KapClear, our transparency dashboard.',
    },
    {
      'question': 'What fees does Kapitor charge?',
      'answer':
          'Kapitor charges minimal fees: 0.1-0.5% trading fees (volume-based), 0% deposit fees, minimal withdrawal fees (network gas only), and no hidden charges. KapVault and PPP have performance-based fee structures disclosed upfront.',
    },
    {
      'question': 'Is Kapitor beginner-friendly?',
      'answer':
          'Absolutely! Kapitor is designed to be as simple as a US bank while offering advanced features for experienced users. KapAI provides guided assistance, educational content, and personalized recommendations to help beginners navigate the platform confidently.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          // Section Title
          AppText(
            'KAPITOR — Frequently Asked Questions\nYour Complete Knowledge Foundation',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 36 : 28),
              color: Colors.black,
            ).copyWith(height: 1.2),
          ),
          Hbox(isDesktop ? 60 : 40),
          // FAQ Items Grid
          if (isDesktop || isTablet)
            _buildDesktopLayout(isDesktop)
          else
            _buildMobileLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(bool isLarge) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildFaqItem(
                _faqs[0]['question']!,
                _faqs[0]['answer']!,
                0,
                isLarge,
                isExpanded: true,
                isBlack: true,
              ),
            ),
            Wbox(24),
            Expanded(
              child: _buildFaqItem(
                _faqs[1]['question']!,
                _faqs[1]['answer']!,
                1,
                isLarge,
              ),
            ),
            Wbox(24),
            Expanded(
              child: _buildFaqItem(
                _faqs[2]['question']!,
                _faqs[2]['answer']!,
                2,
                isLarge,
              ),
            ),
          ],
        ),
        Hbox(24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildFaqItem(
                _faqs[3]['question']!,
                _faqs[3]['answer']!,
                3,
                isLarge,
              ),
            ),
            Wbox(24),
            Expanded(
              child: _buildFaqItem(
                _faqs[4]['question']!,
                _faqs[4]['answer']!,
                4,
                isLarge,
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        Hbox(24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildFaqItem(
                _faqs[5]['question']!,
                _faqs[5]['answer']!,
                5,
                isLarge,
              ),
            ),
            const Expanded(child: SizedBox()),
            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: List.generate(
        _faqs.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildFaqItem(
            _faqs[index]['question']!,
            _faqs[index]['answer']!,
            index,
            false,
            isExpanded: index == 0,
            isBlack: index == 0,
          ),
        ),
      ),
    );
  }

  Widget _buildFaqItem(
    String question,
    String answer,
    int index,
    bool isLarge, {
    bool isExpanded = false,
    bool isBlack = false,
  }) {
    final expanded = isExpanded ? true : (_expandedIndex == index);
    final bgColor = isBlack ? Colors.black : Colors.white;
    final textColor = isBlack ? Colors.white : Colors.black;
    final iconColor = isBlack ? Colors.white : Colors.black;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isBlack
              ? Colors.black
              : const Color(0xFF8B7FFF).withValues(alpha: 0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: isBlack
                ? Colors.black.withValues(alpha: 0.2)
                : const Color(0xFF8B7FFF).withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                if (!isExpanded) {
                  setState(() {
                    _expandedIndex = expanded ? null : index;
                  });
                }
              },
              child: Padding(
                padding: EdgeInsets.all(isLarge ? 24 : 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppText(
                        question,
                        style: Ts.bold(
                          size: isLarge ? 16 : 15,
                          color: textColor,
                        ).copyWith(height: 1.4),
                      ),
                    ),
                    Wbox(16),
                    AnimatedRotation(
                      turns: expanded ? 0.125 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Icon(
                        expanded ? Icons.remove : Icons.add,
                        size: isLarge ? 24 : 22,
                        color: iconColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: expanded
                  ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(
                        isLarge ? 24 : 20,
                        0,
                        isLarge ? 24 : 20,
                        isLarge ? 24 : 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            answer,
                            style: Ts.regular(
                              size: isLarge ? 14 : 13,
                              color: textColor.withValues(alpha: 0.7),
                            ).copyWith(height: 1.6),
                          ),
                          if (isBlack) ...[
                            Hbox(20),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.1),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.3),
                                  ),
                                ),
                                child: AppText(
                                  'Explore more',
                                  style: Ts.medium(
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
