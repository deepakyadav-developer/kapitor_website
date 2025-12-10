import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiEmpoweringSection extends StatelessWidget {
  const KapAiEmpoweringSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFF0A0A0A),
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
        _buildContent(true),
        Hbox(40),
        Center(
          child: Image.asset(AppImage.aiHand, height: 300, fit: BoxFit.contain),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Content
        Expanded(flex: 1, child: _buildContent(false)),

        Wbox(isDesktop ? 100 : 60),

        // Right side - AI Hand image
        Expanded(
          flex: 1,
          child: Image.asset(
            AppImage.aiHand,
            height: isDesktop ? 500 : 420,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        AppText(
          'The Intelligence Layer',
          style: Ts.semiBold(
            size: isMobile ? 14 : 16,
            color: Colors.white.withValues(alpha: 0.7),
          ),
        ),

        Hbox(isMobile ? 20 : 24),

        // Heading with colored word
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Empowering ',
                style: Ts.bold(size: isMobile ? 32 : 44, color: Colors.white),
              ),
              TextSpan(
                text: 'Investors ',
                style: Ts.bold(
                  size: isMobile ? 32 : 44,
                  color: AppColor.primary,
                ),
              ),
              TextSpan(
                text: 'With\nAI-Driven Financial Intelligence',
                style: Ts.bold(size: isMobile ? 32 : 44, color: Colors.white),
              ),
            ],
          ),
        ),

        Hbox(isMobile ? 24 : 32),

        // Description
        AppText(
          'KapAI transforms complex financial data into actionable insights, helping you make confident investment decisions backed by real-time AI analysis and predictive intelligence.',
          style: Ts.regular(
            size: isMobile ? 14 : 16,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),

        Hbox(isMobile ? 32 : 40),

        // Feature items
        _FeatureItem(
          icon: Icons.psychology,
          title: 'Advanced Machine Learning',
          description:
              'Deep learning algorithms analyze millions of data points across crypto markets, tokenized assets, and commodities to predict trends and identify opportunities.',
          isMobile: isMobile,
        ),

        Hbox(isMobile ? 24 : 32),

        _FeatureItem(
          icon: Icons.auto_awesome,
          title: 'Natural Language Processing',
          description:
              'KapAI understands your questions in plain language and provides personalized financial guidance, explanations, and recommendations tailored to your portfolio.',
          isMobile: isMobile,
        ),
      ],
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isMobile;

  const _FeatureItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon with circular progress
        SizedBox(
          width: isMobile ? 60 : 70,
          height: isMobile ? 60 : 70,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Circular progress indicator
              SizedBox(
                width: isMobile ? 60 : 70,
                height: isMobile ? 60 : 70,
                child: CircularProgressIndicator(
                  value: 0.75,
                  strokeWidth: 3,
                  backgroundColor: Colors.white.withValues(alpha: 0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                ),
              ),
              // Icon
              Container(
                padding: EdgeInsets.all(isMobile ? 12 : 14),
                decoration: BoxDecoration(
                  color: AppColor.primary.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: isMobile ? 20 : 24,
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ),

        Wbox(isMobile ? 16 : 20),

        // Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: Ts.bold(size: isMobile ? 18 : 20, color: Colors.white),
              ),
              Hbox(8),
              AppText(
                description,
                style: Ts.regular(
                  size: isMobile ? 13 : 14,
                  color: Colors.white.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
