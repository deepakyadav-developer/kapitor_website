import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Product & Feature Support Section
/// Detailed support pages for each major module
class ProductSupportSection extends StatelessWidget {
  const ProductSupportSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF8F9FA),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          AppText(
            'Product & Feature Support',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 36 : 32),
              color: Colors.black,
            ),
          ),
          Hbox(16),
          AppText(
            'Detailed support for each major module in Kapitor',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isDesktop ? 16 : 14,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          Hbox(isDesktop ? 60 : 40),
          _buildProductGrid(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildProductGrid(bool isDesktop, bool isTablet) {
    final products = _getProducts();

    if (isDesktop) {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        children: products
            .map(
              (product) => SizedBox(
                width:
                    (MediaQuery.of(navigatorKey.currentContext!).size.width -
                        160 -
                        48) /
                    3,
                child: _ProductCard(product: product, isLarge: true),
              ),
            )
            .toList(),
      );
    } else if (isTablet) {
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: products
            .map(
              (product) => SizedBox(
                width:
                    (MediaQuery.of(navigatorKey.currentContext!).size.width -
                        80 -
                        20) /
                    2,
                child: _ProductCard(product: product, isLarge: false),
              ),
            )
            .toList(),
      );
    } else {
      return Column(
        children: products
            .map(
              (product) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _ProductCard(product: product, isLarge: false),
              ),
            )
            .toList(),
      );
    }
  }

  List<_ProductModule> _getProducts() {
    return [
      _ProductModule(
        icon: FontAwesomeIcons.wallet,
        title: 'Wallet & Payments',
        topics: [
          'USDT deposits/withdrawals',
          'Internal instant transfers',
          'QR Scan & Pay',
          'Bill payments (electricity, broadband, mobile, water)',
          'FASTag',
          'Credit card bill settlement',
          'Off-ramp (USDT → Fiat)',
        ],
        color: const Color(0xFF4DB8A4),
      ),
      _ProductModule(
        icon: FontAwesomeIcons.vault,
        title: 'KapVault (Yield Engine)',
        topics: [
          'Understanding APY',
          'Flexible vs Locked Vaults',
          'Institutional vault breakdown',
          'How daily yield is credited',
          'Insurance layers',
          'Vault health scores',
        ],
        color: const Color(0xFFFF6B6B),
      ),
      _ProductModule(
        icon: FontAwesomeIcons.chartLine,
        title: 'KapTrade',
        topics: [
          'How to trade crypto',
          'On-chain swaps (DEX aggregator)',
          'Tokenized stock/commodity trading',
          'Commodity & agricultural trading',
          'Price alerts',
          'AI trade recommendations',
        ],
        color: const Color(0xFFFFB84D),
      ),
      _ProductModule(
        icon: FontAwesomeIcons.coins,
        title: 'Tokenized Assets',
        topics: [
          'NAV charts',
          'Precious metal tokens',
          'Equity tokens',
          'Commodity-backed assets',
          'RWA verification',
          'Fractional investing guidance',
        ],
        color: const Color(0xFF9B59B6),
      ),
      _ProductModule(
        icon: FontAwesomeIcons.briefcase,
        title: 'PPP Support',
        topics: [
          'Understanding PPP plans',
          '1/3/5-year structures',
          'NAV tracking',
          'Allocation certificate',
          'Insurance framework',
          'Compliance guidance',
        ],
        color: const Color(0xFF1ABC9C),
        isPriority: true,
      ),
      _ProductModule(
        icon: FontAwesomeIcons.shieldHalved,
        title: 'KapSure (Insurance)',
        topics: [
          'Wallet insurance',
          'Smart contract coverage',
          'Exchange failure protection',
          'Depeg insurance',
          'PPP & KapVault insurance',
        ],
        color: const Color(0xFFE67E22),
      ),
      _ProductModule(
        icon: FontAwesomeIcons.store,
        title: 'Merchant Support',
        topics: [
          'Merchant onboarding',
          'Creating crypto QR',
          'Auto off-ramp setup',
          'Invoice generation',
          'Settlement explanations',
          'Refund assistance',
          'Business analytics',
        ],
        color: const Color(0xFF3498DB),
      ),
      _ProductModule(
        icon: FontAwesomeIcons.plane,
        title: 'Travel & Recharges',
        topics: [
          'Booking flights & hotels',
          'Bus & train bookings',
          'Mobile/DTH/broadband recharges',
          'Gift card delivery',
          'Refund/cancellation flows',
        ],
        color: const Color(0xFFE74C3C),
      ),
    ];
  }
}

class _ProductModule {
  final IconData icon;
  final String title;
  final List<String> topics;
  final Color color;
  final bool isPriority;

  _ProductModule({
    required this.icon,
    required this.title,
    required this.topics,
    required this.color,
    this.isPriority = false,
  });
}

class _ProductCard extends StatefulWidget {
  final _ProductModule product;
  final bool isLarge;

  const _ProductCard({required this.product, required this.isLarge});

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(widget.isLarge ? 28 : 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? widget.product.color
                : Colors.grey.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.product.color.withValues(alpha: 0.2),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(widget.isLarge ? 14 : 12),
                  decoration: BoxDecoration(
                    color: widget.product.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FaIcon(
                    widget.product.icon,
                    size: widget.isLarge ? 24 : 20,
                    color: widget.product.color,
                  ),
                ),
                if (widget.product.isPriority) ...[
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B6B).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: AppText(
                      'PRIORITY',
                      style: Ts.bold(size: 10, color: const Color(0xFFFF6B6B)),
                    ),
                  ),
                ],
              ],
            ),
            Hbox(16),
            AppText(
              widget.product.title,
              style: Ts.bold(
                size: widget.isLarge ? 20 : 18,
                color: Colors.black,
              ),
            ),
            Hbox(16),
            ...widget.product.topics.map(
              (topic) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: widget.product.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Wbox(10),
                    Expanded(
                      child: AppText(
                        topic,
                        style: Ts.regular(
                          size: widget.isLarge ? 14 : 13,
                          color: Colors.black.withValues(alpha: 0.7),
                        ).copyWith(height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final navigatorKey = GlobalKey<NavigatorState>();
