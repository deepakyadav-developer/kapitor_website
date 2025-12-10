import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class AgriculturePointsSection extends StatelessWidget {
  const AgriculturePointsSection({super.key});

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

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Agriculture trading image
              Image.asset(
                AppImage.agtrading,
                width: isDesktop ? 800 : (isTablet ? 600 : double.infinity),
                fit: BoxFit.contain,
              ),
              Hbox(isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0)),

              // Grid of 4 cards
              isMobile
                  ? Column(
                      children: [
                        _buildPointCard(
                          'Commodity Futures Trading',
                          'Trade agricultural futures contracts with leverage and hedging capabilities. Access corn, wheat, soybeans, and more.',
                          [
                            'Real-Time Price Updates',
                            'Leverage Trading Options',
                            'Risk Management Tools',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                        Hbox(24.0),
                        _buildPointCard(
                          'Livestock Market Access',
                          'Invest in livestock markets including cattle, hogs, and poultry. Get exposure to global meat production trends.',
                          [
                            'Live Cattle Futures',
                            'Lean Hogs Trading',
                            'Feeder Cattle Options',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                        Hbox(24.0),
                        _buildPointCard(
                          'Crop Price Analytics',
                          'Advanced analytics and forecasting for crop prices. Make data-driven decisions with AI-powered insights.',
                          [
                            'Weather Impact Analysis',
                            'Seasonal Trend Forecasts',
                            'Supply Chain Insights',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                        Hbox(24.0),
                        _buildPointCard(
                          'Global Agricultural Markets',
                          'Access international agricultural exchanges and trade commodities from around the world with competitive spreads.',
                          [
                            'Multi-Exchange Access',
                            'Currency Hedging',
                            'Global Market Data',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                      ],
                    )
                  : Wrap(
                      spacing: isDesktop ? 40.0 : 24.0,
                      runSpacing: isDesktop ? 40.0 : 24.0,
                      children: [
                        _buildPointCard(
                          'Commodity Futures Trading',
                          'Trade agricultural futures contracts with leverage and hedging capabilities. Access corn, wheat, soybeans, and more.',
                          [
                            'Real-Time Price Updates',
                            'Leverage Trading Options',
                            'Risk Management Tools',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                        _buildPointCard(
                          'Livestock Market Access',
                          'Invest in livestock markets including cattle, hogs, and poultry. Get exposure to global meat production trends.',
                          [
                            'Live Cattle Futures',
                            'Lean Hogs Trading',
                            'Feeder Cattle Options',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                        _buildPointCard(
                          'Crop Price Analytics',
                          'Advanced analytics and forecasting for crop prices. Make data-driven decisions with AI-powered insights.',
                          [
                            'Weather Impact Analysis',
                            'Seasonal Trend Forecasts',
                            'Supply Chain Insights',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                        _buildPointCard(
                          'Global Agricultural Markets',
                          'Access international agricultural exchanges and trade commodities from around the world with competitive spreads.',
                          [
                            'Multi-Exchange Access',
                            'Currency Hedging',
                            'Global Market Data',
                          ],
                          isDesktop,
                          isTablet,
                          isMobile,
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPointCard(
    String title,
    String description,
    List<String> points,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    final cardWidth = isDesktop ? 450.0 : (isTablet ? 320.0 : double.infinity);

    return SizedBox(
      width: isMobile ? double.infinity : cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title,
            style: Ts.bold(
              size: isDesktop ? 24.0 : (isTablet ? 22.0 : 20.0),
              color: const Color(0xFF26CE92),
            ),
          ),
          Hbox(isDesktop ? 16.0 : 12.0),
          AppText(
            description,
            style: Ts.regular(
              size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
              color: Colors.grey.shade600,
            ),
          ),
          Hbox(isDesktop ? 20.0 : 16.0),
          _buildCheckItem(points[0], isDesktop, isTablet),
          Hbox(12.0),
          _buildCheckItem(points[1], isDesktop, isTablet),
          Hbox(12.0),
          _buildCheckItem(points[2], isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildCheckItem(String text, bool isDesktop, bool isTablet) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.check,
          size: isDesktop ? 16.0 : 14.0,
          color: const Color(0xFF26CE92),
        ),
        Wbox(12.0),
        AppText(
          text,
          style: Ts.regular(
            size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }
}
