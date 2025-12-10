import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TradingChartsCarouselSection extends StatefulWidget {
  const TradingChartsCarouselSection({Key? key}) : super(key: key);

  @override
  State<TradingChartsCarouselSection> createState() =>
      _TradingChartsCarouselSectionState();
}

class _TradingChartsCarouselSectionState
    extends State<TradingChartsCarouselSection> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  final List<ChartData> _charts = [
    ChartData(
      title: 'Automated portfolio tracking',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna, tortor tempus.',
      imageUrl: AppImage.chart,
    ),
    ChartData(
      title: 'Crypto Premium',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna, tortor tempus.',
      imageUrl: AppImage.chart,
    ),
    ChartData(
      title: 'Market Analysis',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Urna, tortor tempus.',
      imageUrl: AppImage.chart,
    ),
  ];

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
              // Carousel
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: isDesktop ? 400.0 : (isTablet ? 350.0 : 300.0),
                  viewportFraction: isMobile ? 0.9 : (isTablet ? 0.8 : 0.4),
                  enlargeCenterPage: true,
                  autoPlay: false,
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: _charts.map((chart) {
                  return Builder(
                    builder: (BuildContext context) {
                      return _ChartCard(
                        chart: chart,
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      );
                    },
                  );
                }).toList(),
              ),
              
              Hbox(isDesktop ? 40.0 : 32.0),
              
              // Navigation Arrows
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous Arrow
                  _ArrowButton(
                    icon: Icons.arrow_back_ios,
                    onPressed: () {
                      _carouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    isDesktop: isDesktop,
                  ),
                  
                  Wbox(isDesktop ? 32.0 : 24.0),
                  
                  // Indicators
                  Row(
                    children: _charts.asMap().entries.map((entry) {
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == entry.key
                              ? const Color(0xFF1E3A5F)
                              : Colors.grey.shade300,
                        ),
                      );
                    }).toList(),
                  ),
                  
                  Wbox(isDesktop ? 32.0 : 24.0),
                  
                  // Next Arrow
                  _ArrowButton(
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {
                      _carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    isDesktop: isDesktop,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ChartCard extends StatelessWidget {
  final ChartData chart;
  final bool isDesktop;
  final bool isTablet;

  const _ChartCard({
    required this.chart,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Chart Image
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
              child: Image.asset(
                chart.imageUrl,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey.shade200,
                    child: const Center(
                      child: Icon(Icons.show_chart, size: 80, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Title and Description
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  chart.title,
                  style: Ts.bold(
                    size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
                    color: Colors.black,
                  ),
                ),
                Hbox(8.0),
                AppText(
                  chart.description,
                  style: Ts.regular(
                    size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool isDesktop;

  const _ArrowButton({
    required this.icon,
    required this.onPressed,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: isDesktop ? 56.0 : 48.0,
        height: isDesktop ? 56.0 : 48.0,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: const Color(0xFF1E3A5F),
            size: isDesktop ? 24.0 : 20.0,
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final String title;
  final String description;
  final String imageUrl;

  ChartData({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
