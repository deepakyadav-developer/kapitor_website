import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Support Services Section
/// Shows Live Chat, KapAI, and Getting Started guides
class SupportServicesSection extends StatelessWidget {
  const SupportServicesSection({super.key});

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
          // Live Chat Support
          _ServiceCard(
            icon: FontAwesomeIcons.comments,
            title: 'Live Chat Support (24/7)',
            description:
                'Round-the-clock live chat assistance for fast resolution',
            features: [
              'Wallet & transfer issues',
              'Payments and bill settlements',
              'KapVault & yield queries',
              'Trading or DEX aggregator issues',
              'Tokenized assets',
              'Travel & recharge concerns',
              'Merchant payment questions',
              'KYC & onboarding help',
              'PPP investor guidance',
            ],
            responseTime: 'Instant to under 3 minutes',
            color: const Color(0xFF4DB8A4),
            isLarge: isDesktop,
          ),
          Hbox(isDesktop ? 40 : 32),
          // KapAI Helpdesk
          _ServiceCard(
            icon: FontAwesomeIcons.robot,
            title: 'KapAI Helpdesk — Intelligent AI Support',
            description:
                'Your personal financial assistant inside the platform',
            features: [
              'Explains any Kapitor feature',
              'Provides step-by-step guides',
              'Answers financial questions',
              'Helps with trading concepts',
              'Breaks down risk alerts',
              'Provides portfolio explanations',
              'Troubleshoots simple issues',
              'Suggests best practices',
            ],
            responseTime: 'Interactive, smart, and always available',
            color: const Color(0xFF5B8DEE),
            isLarge: isDesktop,
          ),
          Hbox(isDesktop ? 40 : 32),
          // Getting Started
          _ServiceCard(
            icon: FontAwesomeIcons.rocket,
            title: 'Getting Started Guides',
            description: 'Comprehensive beginner and onboarding guides',
            features: [
              'How to create an account',
              'Completing KYC',
              'Setting up 2FA & biometrics',
              'Understanding custodial vs self-custody',
              'Adding USDT & withdrawing',
              'Managing devices securely',
              'Basic platform navigation',
            ],
            responseTime: 'Start confidently with step-by-step guidance',
            color: const Color(0xFFFF6B6B),
            isLarge: isDesktop,
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> features;
  final String responseTime;
  final Color color;
  final bool isLarge;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.features,
    required this.responseTime,
    required this.color,
    required this.isLarge,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(widget.isLarge ? 40 : 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? widget.color
                : Colors.grey.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.2),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(widget.isLarge ? 16 : 14),
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: FaIcon(
                    widget.icon,
                    size: widget.isLarge ? 32 : 28,
                    color: widget.color,
                  ),
                ),
              ],
            ),
            Hbox(24),
            AppText(
              widget.title,
              style: Ts.bold(
                size: widget.isLarge ? 28 : 24,
                color: Colors.black,
              ),
            ),
            Hbox(12),
            AppText(
              widget.description,
              style: Ts.regular(
                size: widget.isLarge ? 16 : 14,
                color: Colors.black.withValues(alpha: 0.6),
              ).copyWith(height: 1.6),
            ),
            Hbox(24),
            ...widget.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 6),
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: widget.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Wbox(12),
                    Expanded(
                      child: AppText(
                        feature,
                        style: Ts.regular(
                          size: widget.isLarge ? 15 : 14,
                          color: Colors.black.withValues(alpha: 0.7),
                        ).copyWith(height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Hbox(20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppText(
                widget.responseTime,
                style: Ts.semiBold(
                  size: widget.isLarge ? 14 : 13,
                  color: widget.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
