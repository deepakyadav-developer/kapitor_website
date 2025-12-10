import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// API Endpoints, Developer Tools & Webhooks Section
class ApiEndpointsSection extends StatelessWidget {
  const ApiEndpointsSection({super.key});

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
          // Developer Tools
          _buildDeveloperTools(isDesktop, isTablet),
          Hbox(isDesktop ? 80 : 60),
          // Webhooks
          _buildWebhooks(isDesktop, isTablet),
          Hbox(isDesktop ? 80 : 60),
          // API Versioning
          _buildVersioning(isDesktop),
          Hbox(isDesktop ? 80 : 60),
          // Essence Card
          _buildEssenceCard(isDesktop),
        ],
      ),
    );
  }

  Widget _buildDeveloperTools(bool isDesktop, bool isTablet) {
    return Column(
      children: [
        AppText(
          'Developer Tools & Sandbox',
          textAlign: TextAlign.center,
          style: Ts.bold(
            size: isDesktop ? 48 : (isTablet ? 36 : 32),
            color: Colors.black,
          ),
        ),
        Hbox(16),
        AppText(
          'Complete sandbox environment for testing',
          textAlign: TextAlign.center,
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
        Hbox(isDesktop ? 40 : 32),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            _ToolCard(
              icon: FontAwesomeIcons.flask,
              title: 'Testnet Wallet',
              description: 'Test USDT mint faucet',
              color: const Color(0xFF4DB8A4),
              isLarge: isDesktop,
            ),
            _ToolCard(
              icon: FontAwesomeIcons.fileInvoice,
              title: 'Mock Billers',
              description: 'Simulated payment testing',
              color: const Color(0xFF5B8DEE),
              isLarge: isDesktop,
            ),
            _ToolCard(
              icon: FontAwesomeIcons.vault,
              title: 'Simulated Vaults',
              description: 'Test yield strategies',
              color: const Color(0xFFFF6B6B),
              isLarge: isDesktop,
            ),
            _ToolCard(
              icon: FontAwesomeIcons.chartLine,
              title: 'Trading Simulation',
              description: 'Mock trading engine',
              color: const Color(0xFFFFB84D),
              isLarge: isDesktop,
            ),
            _ToolCard(
              icon: FontAwesomeIcons.briefcase,
              title: 'PPP Mock NAV',
              description: 'Test PPP feeds',
              color: const Color(0xFF9B59B6),
              isLarge: isDesktop,
            ),
            _ToolCard(
              icon: FontAwesomeIcons.plug,
              title: 'Webhook Testing',
              description: 'Console & playground',
              color: const Color(0xFF1ABC9C),
              isLarge: isDesktop,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWebhooks(bool isDesktop, bool isTablet) {
    return Column(
      children: [
        AppText(
          'Webhooks',
          textAlign: TextAlign.center,
          style: Ts.bold(
            size: isDesktop ? 48 : (isTablet ? 36 : 32),
            color: Colors.black,
          ),
        ),
        Hbox(16),
        AppText(
          'Enterprise-grade webhook triggers with 99.999% delivery',
          textAlign: TextAlign.center,
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
        Hbox(isDesktop ? 40 : 32),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          alignment: WrapAlignment.center,
          children: [
            _WebhookBadge(text: 'Payment Received', isLarge: isDesktop),
            _WebhookBadge(
              text: 'Merchant Settlement Completed',
              isLarge: isDesktop,
            ),
            _WebhookBadge(text: 'Vault Yield Credited', isLarge: isDesktop),
            _WebhookBadge(text: 'Trade Executed', isLarge: isDesktop),
            _WebhookBadge(text: 'Trade Failed', isLarge: isDesktop),
            _WebhookBadge(text: 'PPP NAV Updated', isLarge: isDesktop),
            _WebhookBadge(
              text: 'Insurance Coverage Update',
              isLarge: isDesktop,
            ),
            _WebhookBadge(
              text: 'Tokenized Asset NAV Update',
              isLarge: isDesktop,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildVersioning(bool isLarge) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 48 : 36),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF4DB8A4).withValues(alpha: 0.3),
          width: 2,
        ),
      ),
      child: Column(
        children: [
          AppText(
            'API Versioning',
            textAlign: TextAlign.center,
            style: Ts.bold(size: isLarge ? 32 : 24, color: Colors.black),
          ),
          Hbox(32),
          Wrap(
            spacing: isLarge ? 40 : 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _VersionItem(
                version: 'v1',
                description: 'Core wallet, payments, merchant',
                isLarge: isLarge,
              ),
              _VersionItem(
                version: 'v2',
                description: 'KapTrade, RWAs',
                isLarge: isLarge,
              ),
              _VersionItem(
                version: 'v3',
                description: 'PPP, KapVault institutional',
                isLarge: isLarge,
              ),
              _VersionItem(
                version: 'v4',
                description: 'AI-driven endpoints',
                isLarge: isLarge,
              ),
            ],
          ),
          Hbox(24),
          AppText(
            'Deprecated APIs receive 90-day notice',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isLarge ? 14 : 13,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEssenceCard(bool isLarge) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 48 : 36),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1a1a2e), Color(0xFF16213e)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          AppText(
            'THE ESSENCE OF KAPITOR API',
            textAlign: TextAlign.center,
            style: Ts.bold(size: isLarge ? 32 : 24, color: Colors.white),
          ),
          Hbox(32),
          Wrap(
            spacing: isLarge ? 40 : 24,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _EssenceItem(
                icon: FontAwesomeIcons.check,
                text: 'Enterprise-grade',
              ),
              _EssenceItem(
                icon: FontAwesomeIcons.check,
                text: 'Globally compliant',
              ),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Secure'),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Scalable'),
              _EssenceItem(
                icon: FontAwesomeIcons.check,
                text: 'Auditor-friendly',
              ),
              _EssenceItem(
                icon: FontAwesomeIcons.check,
                text: 'Developer-friendly',
              ),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Modular'),
              _EssenceItem(icon: FontAwesomeIcons.check, text: 'Extensible'),
            ],
          ),
          Hbox(32),
          AppText(
            'Build on top of Kapitor\'s financial infrastructure — unlocking global payments, trading, yield, commodities, and transparency.',
            textAlign: TextAlign.center,
            style: Ts.regular(
              size: isLarge ? 16 : 14,
              color: Colors.white.withValues(alpha: 0.9),
            ).copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }
}

class _ToolCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color color;
  final bool isLarge;

  const _ToolCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.isLarge,
  });

  @override
  State<_ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<_ToolCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.isLarge ? 200 : 160,
        padding: EdgeInsets.all(widget.isLarge ? 24 : 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
            FaIcon(
              widget.icon,
              size: widget.isLarge ? 32 : 28,
              color: widget.color,
            ),
            Hbox(16),
            AppText(
              widget.title,
              textAlign: TextAlign.center,
              style: Ts.bold(
                size: widget.isLarge ? 16 : 14,
                color: Colors.black,
              ),
            ),
            Hbox(8),
            AppText(
              widget.description,
              textAlign: TextAlign.center,
              style: Ts.regular(
                size: widget.isLarge ? 13 : 12,
                color: Colors.black.withValues(alpha: 0.6),
              ).copyWith(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

class _WebhookBadge extends StatelessWidget {
  final String text;
  final bool isLarge;

  const _WebhookBadge({required this.text, required this.isLarge});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 20 : 16,
        vertical: isLarge ? 12 : 10,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4DB8A4).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFF4DB8A4).withValues(alpha: 0.3),
        ),
      ),
      child: AppText(
        text,
        style: Ts.semiBold(
          size: isLarge ? 14 : 13,
          color: const Color(0xFF4DB8A4),
        ),
      ),
    );
  }
}

class _VersionItem extends StatelessWidget {
  final String version;
  final String description;
  final bool isLarge;

  const _VersionItem({
    required this.version,
    required this.description,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          version,
          style: Ts.bold(
            size: isLarge ? 24 : 20,
            color: const Color(0xFF4DB8A4),
          ),
        ),
        Hbox(8),
        AppText(
          description,
          textAlign: TextAlign.center,
          style: Ts.regular(
            size: isLarge ? 14 : 13,
            color: Colors.black.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

class _EssenceItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _EssenceItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(icon, size: 16, color: const Color(0xFF4DB8A4)),
        Wbox(8),
        AppText(text, style: Ts.semiBold(size: 15, color: Colors.white)),
      ],
    );
  }
}
