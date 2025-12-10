import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class MarketPortfolioSection extends StatelessWidget {
  const MarketPortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0);

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Title
              AppText(
                'Market sentiments, portfolio, and run\nthe infrastructure of your choice',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 42.0 : (isTablet ? 34.0 : 28.0),
                  color: Colors.black,
                ),
              ),
              Hbox(isDesktop ? 80.0 : 60.0),
              
              // Section 1: Invest Smart
              isMobile
                  ? _buildMobileSection1(isDesktop, isTablet, isMobile)
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Invest Smart',
                                style: Ts.bold(
                                  size: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
                                  color: Colors.black,
                                ),
                              ),
                              Hbox(isDesktop ? 20.0 : 16.0),
                              AppText(
                                'Get full statistic information about the behaviour of buyers and sellers will help you to make the decision.',
                                style: Ts.regular(
                                  size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Wbox(isDesktop ? 80.0 : 60.0),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            AppImage.investSmart,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
              
              Hbox(isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0)),
              
              // Section 2: Detailed Statistics
              isMobile
                  ? _buildMobileSection2(isDesktop, isTablet, isMobile)
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            AppImage.statastics,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Wbox(isDesktop ? 80.0 : 60.0),
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Detailed Statistics',
                                style: Ts.bold(
                                  size: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
                                  color: Colors.black,
                                ),
                              ),
                              Hbox(isDesktop ? 20.0 : 16.0),
                              AppText(
                                'View all mining related information in realtime, at any point at any location and decide which polls you want to mine in.',
                                style: Ts.regular(
                                  size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
              
              Hbox(isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0)),
              
              // Section 3: Grow your profit
              isMobile
                  ? _buildMobileSection3(isDesktop, isTablet, isMobile)
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Grow your profit and track\nyour investments',
                                style: Ts.bold(
                                  size: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
                                  color: Colors.black,
                                ),
                              ),
                              Hbox(isDesktop ? 20.0 : 16.0),
                              AppText(
                                'Use advanced analytical tools. Clear TradingView charts let you track current and historical profit investments.',
                                style: Ts.regular(
                                  size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Wbox(isDesktop ? 80.0 : 60.0),
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            AppImage.table,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileSection1(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        AppText(
          'Invest Smart',
          textAlign: TextAlign.center,
          style: Ts.bold(
            size: 24.0,
            color: Colors.black,
          ),
        ),
        Hbox(16.0),
        AppText(
          'Get full statistic information about the behaviour of buyers and sellers will help you to make the decision.',
          textAlign: TextAlign.center,
          style: Ts.regular(
            size: 14.0,
            color: Colors.grey.shade600,
          ),
        ),
        Hbox(32.0),
        Image.asset(
          AppImage.investSmart,
          fit: BoxFit.contain,
        ),
      ],
    );
  }

  Widget _buildMobileSection2(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        Image.asset(
          AppImage.statastics,
          fit: BoxFit.contain,
        ),
        Hbox(32.0),
        AppText(
          'Detailed Statistics',
          textAlign: TextAlign.center,
          style: Ts.bold(
            size: 24.0,
            color: Colors.black,
          ),
        ),
        Hbox(16.0),
        AppText(
          'View all mining related information in realtime, at any point at any location and decide which polls you want to mine in.',
          textAlign: TextAlign.center,
          style: Ts.regular(
            size: 14.0,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildMobileSection3(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        AppText(
          'Grow your profit and track\nyour investments',
          textAlign: TextAlign.center,
          style: Ts.bold(
            size: 24.0,
            color: Colors.black,
          ),
        ),
        Hbox(16.0),
        AppText(
          'Use advanced analytical tools. Clear TradingView charts let you track current and historical profit investments.',
          textAlign: TextAlign.center,
          style: Ts.regular(
            size: 14.0,
            color: Colors.grey.shade600,
          ),
        ),
        Hbox(32.0),
        Image.asset(
          AppImage.table,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
