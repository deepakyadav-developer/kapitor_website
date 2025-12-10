import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// API Categories Section with Expandable Cards
class ApiCategoriesSection extends StatefulWidget {
  const ApiCategoriesSection({super.key});

  @override
  State<ApiCategoriesSection> createState() => _ApiCategoriesSectionState();
}

class _ApiCategoriesSectionState extends State<ApiCategoriesSection> {
  int? _expandedIndex;

  final List<_ApiCategory> _categories = [
    _ApiCategory(
      icon: FontAwesomeIcons.wallet,
      title: 'Wallet APIs',
      description: 'Multi-chain USDT wallet infrastructure',
      color: const Color(0xFF4DB8A4),
      endpoints: [
        'Create wallet',
        'Fetch balances',
        'Transfer USDT (internal & on-chain)',
        'Receive USDT',
        'Fetch transaction history',
        'Cross-chain bridge initiation',
        'Withdrawal whitelisting',
        'Fees & gas estimation',
      ],
      useCases: [
        'Embed a Kapitor wallet in your app',
        'Build custom USDT payment flows',
        'Enable cross-chain capabilities for your users',
      ],
    ),
    _ApiCategory(
      icon: FontAwesomeIcons.fileInvoiceDollar,
      title: 'Payments & Billing APIs',
      description:
          'Bill payments, recharges, utilities, FASTag, EMI, credit-card settlement',
      color: const Color(0xFF5B8DEE),
      endpoints: [
        'Fetch biller list',
        'Fetch bill amount',
        'Initiate bill payment',
        'Check payment status',
        'Download bill receipts',
      ],
      useCases: [
        'Add crypto-powered bill payments to your app',
        'Build a "Recharges using USDT" feature',
        'Integrate domestic utility payments into global apps',
      ],
    ),
    _ApiCategory(
      icon: FontAwesomeIcons.store,
      title: 'Merchant APIs',
      description: 'QR generation, acceptance, settlement, and invoicing',
      color: const Color(0xFFFFB84D),
      endpoints: [
        'Generate QR (static + dynamic)',
        'Verify QR payment',
        'Settlement status',
        'Auto off-ramp triggers',
        'Invoice creation & retrieval',
        'Refund initiation',
        'Webhook configuration',
      ],
      useCases: [
        'Accept USDT on websites',
        'Integrate crypto checkout',
        'Build POS hardware integrations',
        'Automate merchant settlement flows',
      ],
    ),
    _ApiCategory(
      icon: FontAwesomeIcons.vault,
      title: 'KapVault (Yield) APIs',
      description:
          'Vault creation, deposits, withdrawals, APY info, vault health',
      color: const Color(0xFFFF6B6B),
      endpoints: [
        'Fetch vault list',
        'Fetch APY & risk score',
        'Deposit into vault',
        'Withdraw from vault',
        'Fetch daily yield history',
        'Vault health data (KapClear synced)',
        'Insurance coverage details',
      ],
      useCases: [
        'Embed yield generation in third-party wallets',
        'Institutional treasury automation',
        'Custom yield dashboards',
      ],
    ),
    _ApiCategory(
      icon: FontAwesomeIcons.chartLine,
      title: 'KapTrade APIs',
      description:
          'Crypto trading, on-chain DEX aggregation, tokenized stocks/commodities',
      color: const Color(0xFF9B59B6),
      endpoints: [
        'Get crypto prices',
        'Place order (buy/sell)',
        'Cancel order',
        'Fetch order history',
        'Fetch DEX routes',
        'Tokenized stocks NAV',
        'Commodity trading endpoints',
        'Agricultural market endpoints',
        'Farmer production marketplace endpoints',
      ],
      useCases: [
        'Build your own trading app on Kapitor liquidity',
        'Offer tokenized stocks & commodities',
        'Integrate real-world agri trading',
      ],
    ),
    _ApiCategory(
      icon: FontAwesomeIcons.coins,
      title: 'Tokenized Assets APIs',
      description: 'RWA assets, NAV feeds, historical data',
      color: const Color(0xFF1ABC9C),
      endpoints: [
        'Fetch RWA list',
        'Fetch NAV history',
        'Fetch backing verification',
        'Asset metadata',
        'Market feed subscription',
      ],
      useCases: [
        'Build RWA dashboards',
        'Integrate tokenized gold/silver',
        'Add stock/commodity tokens to apps',
      ],
    ),
    _ApiCategory(
      icon: FontAwesomeIcons.chartPie,
      title: 'KapClear Transparency APIs',
      description:
          'Proof-of-reserves, reserve baskets, smart contract audit endpoints',
      color: const Color(0xFFE67E22),
      endpoints: [
        'Proof-of-reserves',
        'Vault reserve composition',
        'PPP pool reserve data',
        'Insurance coverage checks',
        'Smart contract audit logs',
        'Transparency reports (monthly/quarterly/annual)',
      ],
      useCases: [
        'Build compliance dashboards',
        'Integrate PoR verification',
        'Build institutional audit tools',
      ],
    ),
    _ApiCategory(
      icon: FontAwesomeIcons.shieldHalved,
      title: 'KapSure Insurance APIs',
      description: 'Insurance coverage status, policy checks, event triggers',
      color: const Color(0xFFE74C3C),
      endpoints: [
        'Insurance policy status',
        'Coverage eligibility',
        'Event triggers',
        'Insurance claim submission',
        'Depeg detection alerts',
        'Smart contract accident logs',
      ],
      useCases: [
        'Build automated insurance claims',
        'Integrate policy data into enterprise apps',
        'Real-time risk monitoring',
      ],
    ),
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
          AppText(
            'API Categories',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 36 : 32),
              color: Colors.black,
            ),
          ),
          Hbox(16),
          AppText(
            '8 comprehensive API categories for complete integration',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isDesktop ? 16 : 14,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          Hbox(isDesktop ? 60 : 40),
          ..._categories.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ApiCategoryCard(
                category: category,
                isExpanded: _expandedIndex == index,
                onTap: () {
                  setState(() {
                    _expandedIndex = _expandedIndex == index ? null : index;
                  });
                },
                isLarge: isDesktop,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ApiCategory {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final List<String> endpoints;
  final List<String> useCases;

  _ApiCategory({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.endpoints,
    required this.useCases,
  });
}

class _ApiCategoryCard extends StatefulWidget {
  final _ApiCategory category;
  final bool isExpanded;
  final VoidCallback onTap;
  final bool isLarge;

  const _ApiCategoryCard({
    required this.category,
    required this.isExpanded,
    required this.onTap,
    required this.isLarge,
  });

  @override
  State<_ApiCategoryCard> createState() => _ApiCategoryCardState();
}

class _ApiCategoryCardState extends State<_ApiCategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isExpanded || _isHovered
                ? widget.category.color
                : Colors.grey.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: widget.isExpanded || _isHovered
              ? [
                  BoxShadow(
                    color: widget.category.color.withValues(alpha: 0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          children: [
            InkWell(
              onTap: widget.onTap,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(widget.isLarge ? 32 : 24),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(widget.isLarge ? 16 : 14),
                      decoration: BoxDecoration(
                        color: widget.category.color.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FaIcon(
                        widget.category.icon,
                        size: widget.isLarge ? 28 : 24,
                        color: widget.category.color,
                      ),
                    ),
                    Wbox(20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            widget.category.title,
                            style: Ts.bold(
                              size: widget.isLarge ? 24 : 20,
                              color: Colors.black,
                            ),
                          ),
                          Hbox(8),
                          AppText(
                            widget.category.description,
                            style: Ts.regular(
                              size: widget.isLarge ? 14 : 13,
                              color: Colors.black.withValues(alpha: 0.6),
                            ).copyWith(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    Wbox(20),
                    AnimatedRotation(
                      turns: widget.isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        size: widget.isLarge ? 32 : 28,
                        color: widget.category.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: widget.isExpanded
                  ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(
                        widget.isLarge ? 32 : 24,
                        0,
                        widget.isLarge ? 32 : 24,
                        widget.isLarge ? 32 : 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 1,
                            color: Colors.grey.withValues(alpha: 0.2),
                          ),
                          Hbox(24),
                          // Endpoints
                          AppText(
                            'Endpoints',
                            style: Ts.bold(
                              size: widget.isLarge ? 18 : 16,
                              color: widget.category.color,
                            ),
                          ),
                          Hbox(16),
                          ...widget.category.endpoints.map(
                            (endpoint) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 6),
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: widget.category.color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Wbox(12),
                                  Expanded(
                                    child: AppText(
                                      endpoint,
                                      style: Ts.regular(
                                        size: widget.isLarge ? 14 : 13,
                                        color: Colors.black.withValues(
                                          alpha: 0.7,
                                        ),
                                      ).copyWith(height: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Hbox(24),
                          // Use Cases
                          AppText(
                            'Use Cases',
                            style: Ts.bold(
                              size: widget.isLarge ? 18 : 16,
                              color: widget.category.color,
                            ),
                          ),
                          Hbox(16),
                          ...widget.category.useCases.map(
                            (useCase) => Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.check,
                                    size: 14,
                                    color: widget.category.color,
                                  ),
                                  Wbox(12),
                                  Expanded(
                                    child: AppText(
                                      useCase,
                                      style: Ts.regular(
                                        size: widget.isLarge ? 14 : 13,
                                        color: Colors.black.withValues(
                                          alpha: 0.7,
                                        ),
                                      ).copyWith(height: 1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
