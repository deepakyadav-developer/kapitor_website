import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class PppCryptoCoinsSection extends StatelessWidget {
  const PppCryptoCoinsSection({super.key});

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
        final verticalPadding = isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0);

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'Featured ',
                    style: Ts.bold(
                      size: isDesktop ? 16.0 : 14.0,
                      color: Colors.black,
                    ),
                  ),
                  AppText(
                    'Crypto coins',
                    style: Ts.bold(
                      size: isDesktop ? 16.0 : 14.0,
                      color: const Color(0xFF26CE92),
                    ),
                  ),
                ],
              ),

              Hbox(isDesktop ? 24.0 : 16.0),

              // Title
              AppText(
                'Top crypto coins updates',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 42.0 : (isTablet ? 32.0 : 28.0),
                  color: Colors.black,
                ),
              ),

              Hbox(isDesktop ? 60.0 : 40.0),

              // Crypto Cards Grid
              isMobile
                  ? _buildMobileLayout()
                  : _buildDesktopLayout(isDesktop, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    final cards = [
      _CryptoCard(
        iconUrl: 'https://cryptologos.cc/logos/bitcoin-btc-logo.png',
        title: 'Highest volume',
        subtitle: '10x to 20x ROI',
        description: 'High returns',
        value: '3337.28',
        isDesktop: isDesktop,
        isTablet: isTablet,
      ),
      _CryptoCard(
        iconUrl: 'https://cryptologos.cc/logos/ethereum-eth-logo.png',
        title: 'Top gainer',
        subtitle: '100% insured',
        description: 'principal',
        value: '3337.28',
        isDesktop: isDesktop,
        isTablet: isTablet,
      ),
      _CryptoCard(
        iconUrl: 'https://cryptologos.cc/logos/litecoin-ltc-logo.png',
        title: 'New listing',
        subtitle: '1/3/5 year lock-ins',
        description: '105,000',
        value: '',
        isDesktop: isDesktop,
        isTablet: isTablet,
      ),
      _CryptoCard(
        iconUrl: 'https://cryptologos.cc/logos/polygon-matic-logo.png',
        title: 'Most traded',
        subtitle: 'Pools from \$1M to',
        description: '\$10M',
        value: '6.6423',
        isDesktop: isDesktop,
        isTablet: isTablet,
      ),
      _CryptoCard(
        iconUrl: 'https://cryptologos.cc/logos/solana-sol-logo.png',
        title: 'Biggest gainers',
        subtitle: 'On-chain',
        description: 'transparency',
        value: '189.63',
        isDesktop: isDesktop,
        isTablet: isTablet,
      ),
      _CryptoCard(
        iconUrl: 'https://cryptologos.cc/logos/cardano-ada-logo.png',
        title: 'Trending',
        subtitle: 'AI-managed',
        description: 'diversification',
        value: '19.991',
        isDesktop: isDesktop,
        isTablet: isTablet,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardsPerRow = isDesktop ? 3 : 2;
        final rows = <Widget>[];

        for (var i = 0; i < cards.length; i += cardsPerRow) {
          final rowCards = cards.sublist(
            i,
            (i + cardsPerRow > cards.length) ? cards.length : i + cardsPerRow,
          );

          rows.add(
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (var j = 0; j < rowCards.length; j++) ...[
                    Expanded(child: rowCards[j]),
                    if (j < rowCards.length - 1) Wbox(isDesktop ? 24.0 : 16.0),
                  ],
                ],
              ),
            ),
          );

          if (i + cardsPerRow < cards.length) {
            rows.add(Hbox(isDesktop ? 24.0 : 16.0));
          }
        }

        return Column(children: rows);
      },
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _CryptoCard(
          iconUrl: 'https://cryptologos.cc/logos/bitcoin-btc-logo.png',
          title: 'Highest volume',
          subtitle: '10x to 20x ROI',
          description: 'High returns',
          value: '3337.28',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _CryptoCard(
          iconUrl: 'https://cryptologos.cc/logos/ethereum-eth-logo.png',
          title: 'Top gainer',
          subtitle: '100% insured',
          description: 'principal',
          value: '3337.28',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _CryptoCard(
          iconUrl: 'https://cryptologos.cc/logos/litecoin-ltc-logo.png',
          title: 'New listing',
          subtitle: '1/3/5 year lock-ins',
          description: '105,000',
          value: '',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _CryptoCard(
          iconUrl: 'https://cryptologos.cc/logos/polygon-matic-logo.png',
          title: 'Most traded',
          subtitle: 'Pools from \$1M to',
          description: '\$10M',
          value: '6.6423',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _CryptoCard(
          iconUrl: 'https://cryptologos.cc/logos/solana-sol-logo.png',
          title: 'Biggest gainers',
          subtitle: 'On-chain',
          description: 'transparency',
          value: '189.63',
          isDesktop: false,
          isTablet: false,
        ),
        Hbox(16.0),
        _CryptoCard(
          iconUrl: 'https://cryptologos.cc/logos/cardano-ada-logo.png',
          title: 'Trending',
          subtitle: 'AI-managed',
          description: 'diversification',
          value: '19.991',
          isDesktop: false,
          isTablet: false,
        ),
      ],
    );
  }
}

class _CryptoCard extends StatefulWidget {
  final String iconUrl;
  final String title;
  final String subtitle;
  final String description;
  final String value;
  final bool isDesktop;
  final bool isTablet;

  const _CryptoCard({
    required this.iconUrl,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.value,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  State<_CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<_CryptoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: double.infinity,
        padding: EdgeInsets.all(widget.isDesktop ? 24.0 : 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          border: Border.all(
            color: _isHovered ? const Color(0xFF26CE92) : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: const Color(0xFF26CE92).withValues(alpha: 0.2),
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
            // Icon from network
            Container(
              width: widget.isDesktop ? 56.0 : 48.0,
              height: widget.isDesktop ? 56.0 : 48.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(12.0),
              child: Image.network(
                widget.iconUrl,
                fit: BoxFit.contain,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                      strokeWidth: 2,
                      color: const Color(0xFF26CE92),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.currency_bitcoin,
                    color: Colors.grey.shade400,
                    size: 24,
                  );
                },
              ),
            ),

            Hbox(widget.isDesktop ? 20.0 : 16.0),

            // Title
            AppText(
              widget.title,
              style: Ts.semiBold(
                size: widget.isDesktop ? 14.0 : 13.0,
                color: Colors.grey.shade600,
              ),
            ),

            Hbox(8.0),

            // Subtitle
            AppText(
              widget.subtitle,
              style: Ts.bold(
                size: widget.isDesktop ? 16.0 : 15.0,
                color: Colors.black,
              ),
            ),

            Hbox(4.0),

            // Description
            AppText(
              widget.description,
              style: Ts.regular(
                size: widget.isDesktop ? 14.0 : 13.0,
                color: Colors.black,
              ),
            ),

            if (widget.value.isNotEmpty) ...[
              Hbox(12.0),
              AppText(
                widget.value,
                style: Ts.bold(
                  size: widget.isDesktop ? 18.0 : 16.0,
                  color: Colors.black,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
