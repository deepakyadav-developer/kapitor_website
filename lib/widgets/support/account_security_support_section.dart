import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Account & Security Support Section
class AccountSecuritySupportSection extends StatelessWidget {
  const AccountSecuritySupportSection({super.key});

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
            'Account & Security Support',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 36 : 32),
              color: Colors.black,
            ),
          ),
          Hbox(16),
          AppText(
            'Practical guidance on keeping your account secure',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isDesktop ? 16 : 14,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          Hbox(isDesktop ? 60 : 40),
          _buildSecurityGrid(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildSecurityGrid(bool isDesktop, bool isTablet) {
    final screenWidth = MediaQuery.of(navigatorKey.currentContext!).size.width;
    final securityTopics = [
      _SecurityTopic(
        icon: FontAwesomeIcons.key,
        title: 'Password Resets',
        description: 'Quick and secure password recovery process',
        color: const Color(0xFF4DB8A4),
      ),
      _SecurityTopic(
        icon: FontAwesomeIcons.shieldHalved,
        title: 'Recognizing Scams & Phishing',
        description: 'Learn to identify and avoid security threats',
        color: const Color(0xFFFF6B6B),
      ),
      _SecurityTopic(
        icon: FontAwesomeIcons.mobileScreen,
        title: 'Device Binding',
        description: 'Secure your account to trusted devices',
        color: const Color(0xFF5B8DEE),
      ),
      _SecurityTopic(
        icon: FontAwesomeIcons.listCheck,
        title: 'Withdrawal Whitelisting',
        description: 'Add trusted addresses for secure withdrawals',
        color: const Color(0xFFFFB84D),
      ),
      _SecurityTopic(
        icon: FontAwesomeIcons.triangleExclamation,
        title: 'Account Compromised',
        description: 'Immediate steps if your account is at risk',
        color: const Color(0xFFE74C3C),
      ),
      _SecurityTopic(
        icon: FontAwesomeIcons.fingerprint,
        title: 'Biometric Login',
        description: 'Setup and troubleshoot biometric authentication',
        color: const Color(0xFF9B59B6),
      ),
    ];

    if (isDesktop) {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        children: securityTopics
            .map(
              (topic) => SizedBox(
                width: (screenWidth - 160 - 48) / 3,
                child: _SecurityCard(topic: topic, isLarge: true),
              ),
            )
            .toList(),
      );
    } else if (isTablet) {
      return Wrap(
        spacing: 20,
        runSpacing: 20,
        children: securityTopics
            .map(
              (topic) => SizedBox(
                width: (screenWidth - 80 - 20) / 2,
                child: _SecurityCard(topic: topic, isLarge: false),
              ),
            )
            .toList(),
      );
    } else {
      return Column(
        children: securityTopics
            .map(
              (topic) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _SecurityCard(topic: topic, isLarge: false),
              ),
            )
            .toList(),
      );
    }
  }
}

final navigatorKey = GlobalKey<NavigatorState>();

class _SecurityTopic {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  _SecurityTopic({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}

class _SecurityCard extends StatefulWidget {
  final _SecurityTopic topic;
  final bool isLarge;

  const _SecurityCard({required this.topic, required this.isLarge});

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
                ? widget.topic.color
                : Colors.grey.withValues(alpha: 0.2),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.topic.color.withValues(alpha: 0.2),
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
                color: widget.topic.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: FaIcon(
                widget.topic.icon,
                size: widget.isLarge ? 28 : 24,
                color: widget.topic.color,
              ),
            ),
            Hbox(20),
            AppText(
              widget.topic.title,
              style: Ts.bold(
                size: widget.isLarge ? 20 : 18,
                color: Colors.black,
              ),
            ),
            Hbox(8),
            AppText(
              widget.topic.description,
              style: Ts.regular(
                size: widget.isLarge ? 14 : 13,
                color: Colors.black.withValues(alpha: 0.6),
              ).copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
