import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// API Security & Authentication Section
class ApiSecuritySection extends StatelessWidget {
  const ApiSecuritySection({super.key});

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
            'API Security & Authentication',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 36 : 32),
              color: Colors.black,
            ),
          ),
          Hbox(16),
          AppText(
            'Multi-layer security to maintain institutional-grade protection',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isDesktop ? 16 : 14,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          Hbox(isDesktop ? 60 : 40),
          _buildSecurityGrid(isDesktop, isTablet, screenWidth),
          Hbox(isDesktop ? 60 : 40),
          _buildRateLimits(isDesktop),
        ],
      ),
    );
  }

  Widget _buildSecurityGrid(bool isDesktop, bool isTablet, double screenWidth) {
    final securityFeatures = [
      _SecurityFeature(
        icon: FontAwesomeIcons.key,
        title: 'Authentication Methods',
        items: [
          'OAuth 2.0',
          'Bearer Tokens',
          'HMAC-SHA256 Signatures',
          'IP Whitelisting',
          'Device Binding',
          'Optional JWT session tokens',
        ],
        color: const Color(0xFF4DB8A4),
      ),
      _SecurityFeature(
        icon: FontAwesomeIcons.lock,
        title: 'Encryption',
        items: [
          'TLS 1.3 Transport Encryption',
          'AES-256 Data Encryption',
          'MPC Key Signing',
        ],
        color: const Color(0xFF5B8DEE),
      ),
      _SecurityFeature(
        icon: FontAwesomeIcons.shieldHalved,
        title: 'Compliance',
        items: [
          'AML screening',
          'KYC validation',
          'Transaction monitoring (Chainalysis)',
          'Fraud signature evaluation',
          'Audit trail logging',
        ],
        color: const Color(0xFFFF6B6B),
      ),
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: securityFeatures
            .map(
              (feature) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: _SecurityCard(feature: feature, isLarge: true),
                ),
              ),
            )
            .toList(),
      );
    } else {
      return Column(
        children: securityFeatures
            .map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _SecurityCard(feature: feature, isLarge: false),
              ),
            )
            .toList(),
      );
    }
  }

  Widget _buildRateLimits(bool isLarge) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 40 : 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4DB8A4), Color(0xFF5B8DEE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4DB8A4).withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          AppText(
            'Rate Limits',
            textAlign: TextAlign.center,
            style: Ts.bold(size: isLarge ? 32 : 24, color: Colors.white),
          ),
          Hbox(32),
          Wrap(
            spacing: isLarge ? 60 : 40,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _RateLimitItem(
                tier: 'Standard',
                limit: '300 req/min',
                isLarge: isLarge,
              ),
              _RateLimitItem(
                tier: 'Merchant',
                limit: '1,000 req/min',
                isLarge: isLarge,
              ),
              _RateLimitItem(
                tier: 'Institutional',
                limit: '5,000 req/min',
                isLarge: isLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SecurityFeature {
  final IconData icon;
  final String title;
  final List<String> items;
  final Color color;

  _SecurityFeature({
    required this.icon,
    required this.title,
    required this.items,
    required this.color,
  });
}

class _SecurityCard extends StatefulWidget {
  final _SecurityFeature feature;
  final bool isLarge;

  const _SecurityCard({required this.feature, required this.isLarge});

  @override
  State<_SecurityCard> createState() => _SecurityCardState();
}

class _SecurityCardState extends State<_SecurityCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(widget.isLarge ? 32 : 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? widget.feature.color
                : Colors.grey.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.feature.color.withValues(alpha: 0.2),
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
            Container(
              padding: EdgeInsets.all(widget.isLarge ? 16 : 14),
              decoration: BoxDecoration(
                color: widget.feature.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FaIcon(
                widget.feature.icon,
                size: widget.isLarge ? 28 : 24,
                color: widget.feature.color,
              ),
            ),
            Hbox(20),
            AppText(
              widget.feature.title,
              style: Ts.bold(
                size: widget.isLarge ? 22 : 20,
                color: Colors.black,
              ),
            ),
            Hbox(20),
            ...widget.feature.items.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.check,
                      size: 14,
                      color: widget.feature.color,
                    ),
                    Wbox(12),
                    Expanded(
                      child: AppText(
                        item,
                        style: Ts.regular(
                          size: widget.isLarge ? 14 : 13,
                          color: Colors.black.withValues(alpha: 0.7),
                        ).copyWith(height: 1.5),
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

class _RateLimitItem extends StatelessWidget {
  final String tier;
  final String limit;
  final bool isLarge;

  const _RateLimitItem({
    required this.tier,
    required this.limit,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          tier,
          style: Ts.semiBold(
            size: isLarge ? 16 : 14,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        Hbox(8),
        AppText(
          limit,
          style: Ts.bold(size: isLarge ? 28 : 24, color: Colors.white),
        ),
      ],
    );
  }
}
