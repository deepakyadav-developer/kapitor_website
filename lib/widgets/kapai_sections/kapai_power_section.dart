import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiPowerSection extends StatelessWidget {
  const KapAiPowerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            const Color(0xFFE8F9F3).withValues(alpha: 0.3),
            const Color(0xFFFFFBE6).withValues(alpha: 0.3),
            Colors.white,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          // Header with icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: isDesktop ? 28 : 24,
                color: Colors.black.withValues(alpha: 0.6),
              ),
              Wbox(16),
              Icon(
                Icons.settings,
                size: isDesktop ? 28 : 24,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ],
          ),

          Hbox(isDesktop ? 32 : 24),

          // Main heading
          AppText(
            'KapAI Seamlessly Integrates\nAcross Every Kapitor Module',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 48 : (isTablet ? 38 : 32),
              color: Colors.black,
            ),
          ),

          Hbox(isDesktop ? 20 : 16),

          // Description
          SizedBox(
            width: isDesktop ? 700 : (isTablet ? 550 : double.infinity),
            child: AppText(
              'From KapVault to KapTrade, from Tokenized Assets to PPP—KapAI is the central intelligence layer that powers every financial decision across the entire Kapitor ecosystem.',
              textAlign: TextAlign.center,
              style: Ts.regular(
                size: isDesktop ? 16 : 15,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
          ),

          Hbox(isDesktop ? 60 : 40),

          // Main content with image and features
          isMobile
              ? _buildMobileLayout()
              : _buildDesktopLayout(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        // Center image
        Image.asset(AppImage.capAi2, height: 300, fit: BoxFit.contain),
        Hbox(40),
        // Features
        _buildFeatureItem(
          Icons.account_balance_wallet_outlined,
          'KapVault Intelligence',
          'AI-powered yield optimization and automated vault selection for maximum returns with minimal risk.',
          true,
        ),
        Hbox(32),
        _buildFeatureItem(
          Icons.show_chart,
          'KapTrade Insights',
          'Real-time trade signals, price predictions, and market sentiment analysis for crypto and tokenized assets.',
          true,
        ),
        Hbox(32),
        _buildFeatureItem(
          Icons.token_outlined,
          'Tokenized Asset Analysis',
          'NAV tracking, RWA verification, and fractional investment recommendations powered by AI.',
          true,
        ),
        Hbox(32),
        _buildFeatureItem(
          Icons.security,
          'PPP Risk Assessment',
          'Institutional-grade portfolio health monitoring and compliance tracking for high-net-worth investors.',
          true,
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left features
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeatureItem(
                Icons.account_balance_wallet_outlined,
                'KapVault Intelligence',
                'AI-powered yield optimization and automated vault selection for maximum returns with minimal risk.',
                false,
              ),
              Hbox(isDesktop ? 50 : 40),
              _buildFeatureItem(
                Icons.show_chart,
                'KapTrade Insights',
                'Real-time trade signals, price predictions, and market sentiment analysis for crypto and tokenized assets.',
                false,
              ),
            ],
          ),
        ),

        Wbox(isDesktop ? 60 : 40),

        // Center image
        Expanded(
          flex: 1,
          child: Image.asset(
            AppImage.capAi2,
            height: isDesktop ? 450 : 380,
            fit: BoxFit.contain,
          ),
        ),

        Wbox(isDesktop ? 60 : 40),

        // Right features
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFeatureItem(
                Icons.token_outlined,
                'Tokenized Asset Analysis',
                'NAV tracking, RWA verification, and fractional investment recommendations powered by AI.',
                false,
              ),
              Hbox(isDesktop ? 50 : 40),
              _buildFeatureItem(
                Icons.security,
                'PPP Risk Assessment',
                'Institutional-grade portfolio health monitoring and compliance tracking for high-net-worth investors.',
                false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(
    IconData icon,
    String title,
    String description,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          padding: EdgeInsets.all(isMobile ? 14 : 16),
          decoration: BoxDecoration(
            color: AppColor.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: isMobile ? 32 : 36, color: AppColor.primary),
        ),

        Hbox(isMobile ? 16 : 20),

        // Title
        AppText(
          title,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.bold(size: isMobile ? 18 : 20, color: Colors.black),
        ),

        Hbox(12),

        // Description
        SizedBox(
          width: isMobile ? double.infinity : 280,
          child: AppText(
            description,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: Ts.regular(
              size: isMobile ? 14 : 15,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
        ),
      ],
    );
  }
}
