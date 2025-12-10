import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class CurrentOffersSection extends StatefulWidget {
  const CurrentOffersSection({Key? key}) : super(key: key);

  @override
  State<CurrentOffersSection> createState() => _CurrentOffersSectionState();
}

class _CurrentOffersSectionState extends State<CurrentOffersSection> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  final List<OfferData> _offers = [
    OfferData(
      imageUrl: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=800&q=80',
      title: '10%',
      subtitle: 'Discount On\nM-Cash Payment',
      buttonText: 'Buy Now',
      buttonColor: Color(0xFF00ACC1),
    ),
    OfferData(
      imageUrl: 'https://images.unsplash.com/photo-1450101499163-c8848c66ca85?w=800&q=80',
      title: 'Get A Personal\nLoan In 2\nMinutes.',
      subtitle: '',
      buttonText: 'Learn More',
      buttonColor: Color(0xFF00ACC1),
    ),
    OfferData(
      imageUrl: 'https://images.unsplash.com/photo-1521791136064-7986c2920216?w=800&q=80',
      title: '15%',
      subtitle: 'Cashback On\nFirst Transaction',
      buttonText: 'Get Started',
      buttonColor: Color(0xFF00ACC1),
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
          color: const Color(0xFFF8F9FA),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Section Title
              AppText(
                'Current Offers',
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                  color: const Color(0xFF1A1A1A),
                ),
              ),
              
              Hbox(isDesktop ? 50.0 : (isTablet ? 40.0 : 32.0)),
              
              // Carousel
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: isDesktop ? 300.0 : (isTablet ? 250.0 : 200.0),
                  viewportFraction: isMobile ? 0.9 : (isTablet ? 0.7 : 0.45),
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: _offers.map((offer) {
                  return Builder(
                    builder: (BuildContext context) {
                      return _OfferCard(
                        offer: offer,
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      );
                    },
                  );
                }).toList(),
              ),
              
              Hbox(isDesktop ? 32.0 : 24.0),
              
              // Navigation Arrows and Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous Arrow
                  IconButton(
                    onPressed: () {
                      _carouselController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey.shade600,
                      size: isDesktop ? 24.0 : 20.0,
                    ),
                  ),
                  
                  Wbox(16.0),
                  
                  // Indicators
                  Row(
                    children: _offers.asMap().entries.map((entry) {
                      return Container(
                        width: _currentIndex == entry.key ? 32.0 : 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: _currentIndex == entry.key
                              ? const Color(0xFF00ACC1)
                              : Colors.grey.shade300,
                        ),
                      );
                    }).toList(),
                  ),
                  
                  Wbox(16.0),
                  
                  // Next Arrow
                  IconButton(
                    onPressed: () {
                      _carouselController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey.shade600,
                      size: isDesktop ? 24.0 : 20.0,
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
}

class _OfferCard extends StatelessWidget {
  final OfferData offer;
  final bool isDesktop;
  final bool isTablet;

  const _OfferCard({
    required this.offer,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.network(
              offer.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: Icon(Icons.image, size: 50, color: Colors.grey),
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  color: Colors.grey.shade200,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
            ),
            
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            
            // Content
            Positioned(
              left: isDesktop ? 40.0 : (isTablet ? 32.0 : 24.0),
              top: 0,
              bottom: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  AppText(
                    offer.title,
                    style: Ts.bold(
                      size: isDesktop ? 48.0 : (isTablet ? 40.0 : 36.0),
                      color: Colors.white,
                    ),
                  ),
                  
                  if (offer.subtitle.isNotEmpty) ...[
                    Hbox(8.0),
                    AppText(
                      offer.subtitle,
                      style: Ts.semiBold(
                        size: isDesktop ? 18.0 : (isTablet ? 16.0 : 14.0),
                        color: Colors.white,
                      ),
                    ),
                  ],
                  
                  Hbox(isDesktop ? 24.0 : 16.0),
                  
                  // Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: offer.buttonColor,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: isDesktop ? 32.0 : (isTablet ? 28.0 : 24.0),
                        vertical: isDesktop ? 16.0 : (isTablet ? 14.0 : 12.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      elevation: 0,
                    ),
                    child: AppText(
                      offer.buttonText,
                      style: Ts.semiBold(
                        size: isDesktop ? 16.0 : (isTablet ? 14.0 : 13.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OfferData {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String buttonText;
  final Color buttonColor;

  OfferData({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.buttonColor,
  });
}
