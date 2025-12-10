import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// PPP Crypto Coins Section
class PppCryptoSection extends StatefulWidget {
  const PppCryptoSection({super.key});

  @override
  State<PppCryptoSection> createState() => _PppCryptoSectionState();
}

class _PppCryptoSectionState extends State<PppCryptoSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
          vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
        ),
        child: Column(
          children: [
            _buildHeader(isDesktop, isTablet, isMobile),
            Hbox(isDesktop ? 60 : (isTablet ? 50 : 40)),
            _buildCryptoGrid(isDesktop, isTablet, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF4DB8A4).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: AppText(
            'PPP Key Features',
            style: Ts.medium(
              size: isDesktop ? 14 : 12,
              color: const Color(0xFF4DB8A4),
            ),
          ),
        ),
        Hbox(isDesktop ? 24 : 20),
        // Title
        AppText(
          'Why Choose Kapitor PPP',
          style: Ts.bold(
            size: isDesktop ? 48 : (isTablet ? 38 : 28),
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCryptoGrid(bool isDesktop, bool isTablet, bool isMobile) {
    final pppFeatures = [
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/3135/3135706.png',
        'title': '10x to 20x ROI',
        'subtitle': 'High returns on multi-year investment plans',
      },
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
        'title': '100% Insured Principal',
        'subtitle': 'Your capital is fully protected and guaranteed',
      },
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/3135/3135768.png',
        'title': '1/3/5 Year Lock-ins',
        'subtitle': 'Flexible investment duration options',
      },
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/3135/3135789.png',
        'title': 'Pools from \$1M to \$10M',
        'subtitle': 'Institutional-grade investment tiers',
      },
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/3135/3135807.png',
        'title': 'On-Chain Transparency',
        'subtitle': 'Real-time NAV tracking and proof-of-reserves',
      },
      {
        'image': 'https://cdn-icons-png.flaticon.com/512/3135/3135706.png',
        'title': 'AI-Managed Diversification',
        'subtitle': 'Intelligent portfolio optimization and risk management',
      },
    ];

    if (isMobile) {
      return Column(
        children: pppFeatures
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _buildFeatureCard(
                  image: item['image'] as String,
                  title: item['title'] as String,
                  subtitle: item['subtitle'] as String,
                  isDesktop: false,
                ),
              ),
            )
            .toList(),
      );
    } else if (isTablet) {
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: pppFeatures
            .map(
              (item) => SizedBox(
                width: (MediaQuery.of(context).size.width - 100) / 2,
                child: _buildFeatureCard(
                  image: item['image'] as String,
                  title: item['title'] as String,
                  subtitle: item['subtitle'] as String,
                  isDesktop: false,
                ),
              ),
            )
            .toList(),
      );
    } else {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        children: pppFeatures
            .map(
              (item) => SizedBox(
                width: (MediaQuery.of(context).size.width - 208) / 3,
                child: _buildFeatureCard(
                  image: item['image'] as String,
                  title: item['title'] as String,
                  subtitle: item['subtitle'] as String,
                  isDesktop: true,
                ),
              ),
            )
            .toList(),
      );
    }
  }

  Widget _buildFeatureCard({
    required String image,
    required String title,
    required String subtitle,
    required bool isDesktop,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(isDesktop ? 24 : 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Small Feature Icon
            Container(
              width: isDesktop ? 60 : 50,
              height: isDesktop ? 60 : 50,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFF4DB8A4).withValues(alpha: 0.1),
              ),
              child: Image.network(
                image,
                width: isDesktop ? 60 : 50,
                height: isDesktop ? 60 : 50,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.account_balance_wallet,
                    size: isDesktop ? 30 : 25,
                    color: const Color(0xFF4DB8A4),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                      strokeWidth: 2,
                      color: const Color(0xFF4DB8A4),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  AppText(
                    title,
                    style: Ts.bold(
                      size: isDesktop ? 18 : 16,
                      color: Colors.black,
                    ),
                  ),
                  Hbox(8),
                  // Subtitle
                  AppText(
                    subtitle,
                    style: Ts.regular(
                      size: isDesktop ? 14 : 13,
                      color: Colors.black.withValues(alpha: 0.6),
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
