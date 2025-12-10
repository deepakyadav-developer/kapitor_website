import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KeepControlBlackCarouselSection extends StatefulWidget {
  const KeepControlBlackCarouselSection({Key? key}) : super(key: key);

  @override
  State<KeepControlBlackCarouselSection> createState() =>
      _KeepControlBlackCarouselSectionState();
}

class _KeepControlBlackCarouselSectionState
    extends State<KeepControlBlackCarouselSection> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        return Column(
          children: [
            // Carousel
            CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: isDesktop ? 600.0 : (isTablet ? 500.0 : 700.0),
                viewportFraction: 1.0,
                enlargeCenterPage: false,
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
              items: [
                _BlackSlide(
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                ),
                _BlackSlide(
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                ),
                _BlackSlide(
                  isDesktop: isDesktop,
                  isTablet: isTablet,
                  isMobile: isMobile,
                ),
              ],
            ),

            // Dot Indicators
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2].map((index) {
                  return Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.grey.shade700,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BlackSlide extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  const _BlackSlide({
    required this.isDesktop,
    required this.isTablet,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = isDesktop
        ? MediaQuery.of(context).size.width * 0.08
        : (isTablet ? 24.0 : 16.0);

    if (isMobile) {
      return Container(
        width: double.infinity,
        color: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildImage(),
            Hbox(40.0),
            _buildContent(
              Colors.white,
              Colors.grey.shade300,
              const Color(0xFF26CE92),
            ),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isDesktop ? 80.0 : 60.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 1, child: _buildImage()),
          Wbox(isDesktop ? 80.0 : 60.0),
          Expanded(
            flex: 1,
            child: _buildContent(
              Colors.white,
              Colors.grey.shade300,
              const Color(0xFF26CE92),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Color titleColor, Color textColor, Color checkColor) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        AppText(
          'Multi-Currency Support',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.semiBold(
            size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
            color: Colors.grey.shade400,
          ),
        ),
        Hbox(isDesktop ? 16.0 : 12.0),
        AppText(
          'Pay Globally\nIn Any Currency',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.bold(
            size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
            color: titleColor,
          ),
        ),
        Hbox(isDesktop ? 24.0 : 20.0),
        AppText(
          'Accept and send payments in multiple currencies with automatic USDT conversion. No forex fees, no banking delays, just instant global transactions.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.regular(
            size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
            color: textColor,
          ),
        ),
        Hbox(isDesktop ? 32.0 : 24.0),
        _buildFeature('150+ Fiat Currencies Supported', checkColor, textColor),
        Hbox(12.0),
        _buildFeature('Automatic Currency Conversion', checkColor, textColor),
        Hbox(12.0),
        _buildFeature('Zero Foreign Exchange Fees', checkColor, textColor),
      ],
    );
  }

  Widget _buildFeature(String text, Color checkColor, Color textColor) {
    return Row(
      mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
      children: [
        Icon(
          Icons.check_circle,
          color: checkColor,
          size: isDesktop ? 20.0 : 18.0,
        ),
        Wbox(8.0),
        AppText(
          text,
          style: Ts.regular(
            size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
            color: textColor,
          ),
        ),
      ],
    );
  }

  Widget _buildImage() {
    return Image.asset(
      AppImage.amico,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: isDesktop ? 400 : (isTablet ? 300 : 250),
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: const Center(
            child: Icon(Icons.analytics, size: 100, color: Colors.grey),
          ),
        );
      },
    );
  }
}
