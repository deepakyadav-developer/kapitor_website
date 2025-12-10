import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/widgets/common/app_download_buttons.dart';

class Feature4AiIncomeSection extends StatefulWidget {
  const Feature4AiIncomeSection({super.key});

  @override
  State<Feature4AiIncomeSection> createState() =>
      _Feature4AiIncomeSectionState();
}

class _Feature4AiIncomeSectionState extends State<Feature4AiIncomeSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-0.3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

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

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: isMobile
              ? _buildMobileLayout()
              : _buildDesktopLayout(isDesktop, isTablet),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildContent(false), Hbox(40), _buildImage(false)],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: _buildContent(isDesktop)),
        Wbox(isDesktop ? 80 : 60),
        Expanded(flex: 1, child: _buildImage(isDesktop)),
      ],
    );
  }

  Widget _buildContent(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'The Future of Passive Income\nis AI-Powered. Earn Daily APY',
          style: Ts.bold(
            size: isLarge ? 42 : 28,
            color: Colors.black,
          ).copyWith(height: 1.3),
        ),
        Hbox(isLarge ? 32 : 24),
        SizedBox(
          width: isLarge ? 550 : double.infinity,
          child: AppText(
            'KapVault\'s revolutionary AI auto-compound technology automatically harvests and reinvests your yield, optimizing for the highest possible returns around the clock. Benefit from a consistent daily APY without lifting a finger.',
            style: Ts.regular(
              size: isLarge ? 16 : 14,
              color: Colors.black.withValues(alpha: 0.7),
            ).copyWith(height: 1.6),
          ),
        ),
        Hbox(isLarge ? 40 : 32),
        const AppDownloadButtons(
          playStoreUrl: 'https://play.google.com',
          appStoreUrl: 'https://apps.apple.com',
          isLarge: true,
          direction: Axis.horizontal,
        ),
      ],
    );
  }

  Widget _buildImage(bool isLarge) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Image.asset(
            AppImage.feature4,
            height: isLarge ? 500 : 400,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: isLarge ? 500 : 400,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(
                    Icons.rocket_launch,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              );
            },
          ),
        ),
        if (isLarge) ...[
          Positioned(top: 50, right: 100, child: _buildStar(12)),
          Positioned(top: 150, right: 50, child: _buildStar(8)),
          Positioned(bottom: 100, left: 80, child: _buildStar(10)),
          Positioned(top: 20, left: 50, child: _buildStar(6)),
          Positioned(bottom: 50, right: 120, child: _buildStar(8)),
        ],
      ],
    );
  }

  Widget _buildStar(double size) {
    return Icon(Icons.star, size: size, color: Colors.grey.shade400);
  }
}
