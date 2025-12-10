import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiPerformanceSection extends StatefulWidget {
  const KapAiPerformanceSection({super.key});

  @override
  State<KapAiPerformanceSection> createState() =>
      _KapAiPerformanceSectionState();
}

class _KapAiPerformanceSectionState extends State<KapAiPerformanceSection> {
  int _expandedIndex = 3; // Last item expanded by default

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFFFAFAFA),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: isMobile
          ? _buildMobileLayout()
          : _buildDesktopLayout(isDesktop, isTablet),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Robot image
        Center(
          child: Image.asset(AppImage.ai2, height: 300, fit: BoxFit.contain),
        ),
        Hbox(40),
        // Content
        _buildContent(true),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Robot image
        Expanded(
          flex: 1,
          child: Image.asset(
            AppImage.ai2,
            height: isDesktop ? 450 : 380,
            fit: BoxFit.contain,
          ),
        ),

        Wbox(isDesktop ? 100 : 60),

        // Right side - Content
        Expanded(flex: 1, child: _buildContent(false)),
      ],
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading
        AppText(
          'KapAI Intelligence\nPowers Every Financial\nDecision',
          style: Ts.bold(size: isMobile ? 26 : 34, color: Colors.black),
        ),

        Hbox(isMobile ? 16 : 20),

        // Description
        AppText(
          'Real-time monitoring, predictive analytics, and automated optimization across the entire Kapitor ecosystem.',
          style: Ts.regular(
            size: isMobile ? 14 : 15,
            color: Colors.black.withValues(alpha: 0.5),
          ),
        ),

        Hbox(isMobile ? 32 : 40),

        // Accordion items
        _AccordionItem(
          title: 'Real-Time Market Monitoring',
          description:
              'KapAI continuously analyzes millions of data points across crypto markets, equities, commodities, and macroeconomic indicators to provide live sentiment assessments and trend predictions.',
          isExpanded: _expandedIndex == 0,
          onTap: () =>
              setState(() => _expandedIndex = _expandedIndex == 0 ? -1 : 0),
          isMobile: isMobile,
        ),

        Hbox(16),

        _AccordionItem(
          title: 'Automated Yield Optimization',
          description:
              'Intelligently evaluates yield routes, risk profiles, and compounding opportunities to ensure each KapVault user earns the highest possible yield with the lowest risk exposure.',
          isExpanded: _expandedIndex == 1,
          onTap: () =>
              setState(() => _expandedIndex = _expandedIndex == 1 ? -1 : 1),
          isMobile: isMobile,
        ),

        Hbox(16),

        _AccordionItem(
          title: 'Predictive Risk Alerts',
          description:
              'Detects unusual price movements, fraud signatures, liquidity anomalies, and counterparty issues. In critical conditions, KapAI can pause withdrawals or halt trades to protect assets.',
          isExpanded: _expandedIndex == 2,
          onTap: () =>
              setState(() => _expandedIndex = _expandedIndex == 2 ? -1 : 2),
          isMobile: isMobile,
        ),

        Hbox(16),

        _AccordionItem(
          title: 'AI-Powered Trade Signals',
          description:
              'Analyzes technical indicators, moving averages, liquidity heatmaps, and whale clusters to provide predictive buy/sell signals, volatility forecasts, and risk-adjusted entry points.',
          isExpanded: _expandedIndex == 3,
          onTap: () =>
              setState(() => _expandedIndex = _expandedIndex == 3 ? -1 : 3),
          isMobile: isMobile,
        ),
      ],
    );
  }
}

class _AccordionItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isExpanded;
  final VoidCallback onTap;
  final bool isMobile;

  const _AccordionItem({
    required this.title,
    required this.description,
    required this.isExpanded,
    required this.onTap,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(isMobile ? 20 : 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isExpanded
                ? AppColor.primary.withValues(alpha: 0.3)
                : Colors.black.withValues(alpha: 0.08),
            width: 1,
          ),
          boxShadow: isExpanded
              ? [
                  BoxShadow(
                    color: AppColor.primary.withValues(alpha: 0.1),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row with icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppText(
                    title,
                    style: Ts.bold(
                      size: isMobile ? 16 : 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Wbox(16),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 300),
                  turns: isExpanded ? 0.125 : 0, // 45 degrees when expanded
                  child: Icon(
                    Icons.add,
                    size: isMobile ? 20 : 24,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),

            // Expandable description
            AnimatedCrossFade(
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: EdgeInsets.only(top: isMobile ? 12 : 16),
                child: AppText(
                  description,
                  style: Ts.regular(
                    size: isMobile ? 13 : 14,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
