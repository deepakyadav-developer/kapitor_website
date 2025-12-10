import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// API Hero Section
class ApiHeroSection extends StatelessWidget {
  const ApiHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFF1a1a2e), const Color(0xFF16213e)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 120 : (isTablet ? 80 : 60),
      ),
      child: Column(
        children: [
          // Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF4DB8A4).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFF4DB8A4).withValues(alpha: 0.5),
              ),
            ),
            child: AppText(
              'DEVELOPER & ENTERPRISE INTEGRATION',
              style: Ts.semiBold(
                size: isDesktop ? 12 : 11,
                color: const Color(0xFF4DB8A4),
              ),
            ),
          ),
          Hbox(24),
          // Title
          AppText(
            'KAPITOR API\nDOCUMENTATION',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 64 : (isTablet ? 48 : 36),
              color: Colors.white,
            ).copyWith(height: 1.2),
          ),
          Hbox(20),
          // Description
          SizedBox(
            width: isDesktop ? 800 : double.infinity,
            child: AppText(
              'Secure, compliant, high-performance APIs powering the Kapitor global financial ecosystem',
              textAlign: TextAlign.center,
              style: Ts.regular(
                size: isDesktop ? 18 : (isTablet ? 16 : 14),
                color: Colors.white.withValues(alpha: 0.8),
              ).copyWith(height: 1.6),
            ),
          ),
          Hbox(40),
          // Stats Row
          Wrap(
            spacing: isDesktop ? 60 : 40,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _StatItem(
                icon: FontAwesomeIcons.code,
                value: '8',
                label: 'API Categories',
                isLarge: isDesktop,
              ),
              _StatItem(
                icon: FontAwesomeIcons.server,
                value: '99.99%',
                label: 'Uptime SLA',
                isLarge: isDesktop,
              ),
              _StatItem(
                icon: FontAwesomeIcons.lock,
                value: 'TLS 1.3',
                label: 'Encryption',
                isLarge: isDesktop,
              ),
              _StatItem(
                icon: FontAwesomeIcons.bolt,
                value: '<100ms',
                label: 'Response Time',
                isLarge: isDesktop,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final bool isLarge;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FaIcon(icon, size: isLarge ? 32 : 28, color: const Color(0xFF4DB8A4)),
        Hbox(12),
        AppText(
          value,
          style: Ts.bold(size: isLarge ? 28 : 24, color: Colors.white),
        ),
        Hbox(4),
        AppText(
          label,
          style: Ts.regular(
            size: isLarge ? 14 : 12,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
