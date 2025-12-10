import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TradingHeroSection extends StatefulWidget {
  const TradingHeroSection({Key? key}) : super(key: key);

  @override
  State<TradingHeroSection> createState() => _TradingHeroSectionState();
}

class _TradingHeroSectionState extends State<TradingHeroSection> {
  int _currentSlide = 0;
  final int _totalSlides = 3;

  void _nextSlide() {
    setState(() {
      _currentSlide = (_currentSlide + 1) % _totalSlides;
    });
  }

  void _previousSlide() {
    setState(() {
      _currentSlide = (_currentSlide - 1 + _totalSlides) % _totalSlides;
    });
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
        final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0);

        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left Section - Content
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Live and\nOn-Demand\nTrading',
                      style: Ts.bold(
                        size: isDesktop ? 48.0 : (isTablet ? 40.0 : 32.0),
                        color: Colors.black,
                      ),
                    ),
                    Hbox(isDesktop ? 24.0 : 20.0),
                    AppText(
                      'Trade crypto, tokenized stocks, commodities, and global indices with real-time charts, AI signals, and institutional liquidity. Access the world\'s markets from one platform.',
                      style: Ts.regular(
                        size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                        color: Colors.grey.shade700,
                      ),
                    ),
                    Hbox(isDesktop ? 40.0 : 32.0),
                    Row(
                      children: [
                        AppText(
                          'Explore Now',
                          style: Ts.semiBold(
                            size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                            color: Colors.black,
                          ),
                        ),
                        Wbox(isDesktop ? 40.0 : 32.0),
                        // Previous Arrow
                        InkWell(
                          onTap: _previousSlide,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: isDesktop ? 20.0 : 18.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                        Wbox(16.0),
                        // Slide Number
                        AppText(
                          '0${_currentSlide + 1}',
                          style: Ts.bold(
                            size: isDesktop ? 24.0 : (isTablet ? 20.0 : 18.0),
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Wbox(16.0),
                        // Next Arrow
                        InkWell(
                          onTap: _nextSlide,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: isDesktop ? 20.0 : 18.0,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Wbox(isDesktop ? 80.0 : 60.0),

              // Right Section - Carousel Images
              Expanded(
                flex: 1,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Image.asset(
                    _getImageForSlide(_currentSlide),
                    key: ValueKey<int>(_currentSlide),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: isDesktop ? 400 : 300,
                        color: Colors.grey.shade200,
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

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          AppText(
            'live and\non-demand\ntrading',
            textAlign: TextAlign.center,
            style: Ts.bold(size: 32.0, color: Colors.black),
          ),
          Hbox(20.0),
          AppText(
            'Trade crypto, tokenized stocks, commodities, and global indices with real-time charts, AI signals, and institutional liquidity. Access the world\'s markets from one platform.',
            textAlign: TextAlign.center,
            style: Ts.regular(size: 14.0, color: Colors.grey.shade700),
          ),
          Hbox(32.0),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(
              _getImageForSlide(_currentSlide),
              key: ValueKey<int>(_currentSlide),
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(height: 250, color: Colors.grey.shade200);
              },
            ),
          ),
          Hbox(32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                'Explore Now',
                style: Ts.semiBold(size: 14.0, color: Colors.black),
              ),
              Wbox(24.0),
              InkWell(
                onTap: _previousSlide,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              Wbox(12.0),
              AppText(
                '0${_currentSlide + 1}',
                style: Ts.bold(size: 18.0, color: Colors.grey.shade400),
              ),
              Wbox(12.0),
              InkWell(
                onTap: _nextSlide,
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getImageForSlide(int index) {
    switch (index) {
      case 0:
        return AppImage.statics;
      case 1:
        return AppImage.chart;
      case 2:
        return AppImage.agtrading;
      default:
        return AppImage.statics;
    }
  }
}
