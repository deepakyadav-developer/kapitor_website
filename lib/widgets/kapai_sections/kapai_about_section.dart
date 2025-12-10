import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiAboutSection extends StatelessWidget {
  const KapAiAboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: Colors.white,
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
        // Rocket image
        Center(
          child: Image.asset(AppImage.saly43, height: 280, fit: BoxFit.contain),
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
        // Left side - Rocket image
        Expanded(
          flex: 1,
          child: Image.asset(
            AppImage.saly43,
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
        // Label
        AppText(
          'ABOUT US',
          style: Ts.bold(
            size: isMobile ? 13 : 14,
            color: AppColor.primary,
          ).copyWith(letterSpacing: 2),
        ),

        Hbox(isMobile ? 20 : 24),

        // Heading
        AppText(
          'KAPAI — The Central Brain of Kapitor Ecosystem',
          style: Ts.bold(size: isMobile ? 26 : 36, color: Colors.black),
        ),

        Hbox(isMobile ? 24 : 32),

        // Feature 1
        _buildFeatureItem(
          'Real-Time Market Intelligence & Sentiment Analysis',
          isMobile,
        ),

        Hbox(16),

        // Feature 2
        _buildFeatureItem(
          'Yield Optimization & Portfolio Health Monitoring',
          isMobile,
        ),

        Hbox(isMobile ? 24 : 32),

        // Description
        AppText(
          'KapAI continuously monitors markets, user portfolios, vault performance, PPP risk metrics, transaction routes, and macroeconomic trends to deliver real-time intelligence, safety, and optimization across the entire Kapitor ecosystem.',
          style: Ts.regular(
            size: isMobile ? 14 : 16,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),

        Hbox(isMobile ? 32 : 40),

        // Animated Learn More button
        const _AnimatedLearnMoreButton(),
      ],
    );
  }

  Widget _buildFeatureItem(String text, bool isMobile) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: AppColor.primary,
            shape: BoxShape.circle,
          ),
        ),
        Wbox(12),
        Expanded(
          child: AppText(
            text,
            style: Ts.semiBold(
              size: isMobile ? 15 : 16,
              color: AppColor.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedLearnMoreButton extends StatefulWidget {
  const _AnimatedLearnMoreButton();

  @override
  State<_AnimatedLearnMoreButton> createState() =>
      _AnimatedLearnMoreButtonState();
}

class _AnimatedLearnMoreButtonState extends State<_AnimatedLearnMoreButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _arrowAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _arrowAnimation = Tween<double>(
      begin: 0.0,
      end: 5.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ]
                    : [],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppText(
                      'LEARN MORE',
                      style: Ts.bold(
                        size: 14,
                        color: Colors.white,
                      ).copyWith(letterSpacing: 1.2),
                    ),
                    Wbox(12),
                    Transform.translate(
                      offset: Offset(_arrowAnimation.value, 0),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
