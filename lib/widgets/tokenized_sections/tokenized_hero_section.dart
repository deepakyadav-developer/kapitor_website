import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TokenizedHeroSection extends StatefulWidget {
  const TokenizedHeroSection({super.key});

  @override
  State<TokenizedHeroSection> createState() => _TokenizedHeroSectionState();
}

class _TokenizedHeroSectionState extends State<TokenizedHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: -10,
      end: 10,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF26CE92), Color(0xFF1DB87A)],
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0),
          ),
          child: isMobile
              ? _buildMobileLayout(isDesktop, isTablet, isMobile)
              : Row(
                  children: [
                    // Left content
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            'Tokenized Assets\nThe Global RWA Marketplace',
                            style: Ts.bold(
                              size: isDesktop ? 48.0 : (isTablet ? 38.0 : 32.0),
                              color: Colors.white,
                            ),
                          ),
                          Hbox(isDesktop ? 24.0 : 20.0),
                          AppText(
                            'Invest in gold, silver, oil, global stocks, and indices — all tokenized, backed by real assets, and accessible 24/7 with USDT.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                          Hbox(isDesktop ? 40.0 : 32.0),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isDesktop
                                        ? 40.0
                                        : (isTablet ? 32.0 : 28.0),
                                    vertical: isDesktop
                                        ? 18.0
                                        : (isTablet ? 16.0 : 14.0),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  elevation: 0,
                                ),
                                child: AppText(
                                  'GET STARTED',
                                  style: Ts.semiBold(
                                    size: isDesktop
                                        ? 16.0
                                        : (isTablet ? 15.0 : 14.0),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Wbox(16.0),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isDesktop
                                        ? 40.0
                                        : (isTablet ? 32.0 : 28.0),
                                    vertical: isDesktop
                                        ? 18.0
                                        : (isTablet ? 16.0 : 14.0),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                child: AppText(
                                  'VIEW MARKET',
                                  style: Ts.semiBold(
                                    size: isDesktop
                                        ? 16.0
                                        : (isTablet ? 15.0 : 14.0),
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Wbox(isDesktop ? 80.0 : 60.0),
                    // Right image with floating animation
                    Expanded(
                      flex: 1,
                      child: AnimatedBuilder(
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _animation.value),
                            child: child,
                          );
                        },
                        child: Image.asset(
                          AppImage.cryptobanner,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 400,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.image_not_supported,
                                  size: 80,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        AppText(
          'Tokenized Assets\nThe Global RWA Marketplace',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 28.0, color: Colors.white),
        ),
        Hbox(20.0),
        AppText(
          'Invest in gold, silver, oil, global stocks, and indices — all tokenized, backed by real assets, and accessible 24/7 with USDT.',
          textAlign: TextAlign.center,
          style: Ts.regular(
            size: 14.0,
            color: Colors.white.withValues(alpha: 0.9),
          ),
        ),
        Hbox(32.0),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _animation.value),
              child: child,
            );
          },
          child: Image.asset(
            AppImage.cryptobanner,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Center(
                  child: Icon(
                    Icons.image_not_supported,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
        Hbox(32.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 4,
              ),
              child: AppText(
                'GET STARTED',
                style: Ts.semiBold(size: 15.0, color: Colors.white),
              ),
            ),
            Hbox(16.0),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: AppText(
                'VIEW MARKET',
                style: Ts.semiBold(size: 15.0, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
