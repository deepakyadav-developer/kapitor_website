import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class AdvancedStatsCarouselSection extends StatefulWidget {
  const AdvancedStatsCarouselSection({Key? key}) : super(key: key);

  @override
  State<AdvancedStatsCarouselSection> createState() =>
      _AdvancedStatsCarouselSectionState();
}

class _AdvancedStatsCarouselSectionState
    extends State<AdvancedStatsCarouselSection> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
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
                _WhiteSlide(isDesktop: isDesktop, isTablet: isTablet, isMobile: isMobile),
                _BlackSlide(isDesktop: isDesktop, isTablet: isTablet, isMobile: isMobile),
              ],
            ),
            
            // Dot Indicators
            Container(
              color: _currentIndex == 0 ? Colors.white : Colors.black,
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1].map((index) {
                  return Container(
                    width: 12.0,
                    height: 12.0,
                    margin: const EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? (_currentIndex == 0 ? Colors.black : Colors.white)
                          : (_currentIndex == 0
                              ? Colors.grey.shade300
                              : Colors.grey.shade700),
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

class _WhiteSlide extends StatelessWidget {
  final bool isDesktop;
  final bool isTablet;
  final bool isMobile;

  const _WhiteSlide({
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
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildContent(Colors.black, Colors.grey.shade700, const Color(0xFF26CE92)),
            Hbox(40.0),
            _buildImage(),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: isDesktop ? 80.0 : 60.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _buildContent(Colors.black, Colors.grey.shade700, const Color(0xFF26CE92)),
          ),
          Wbox(isDesktop ? 80.0 : 60.0),
          Expanded(
            flex: 1,
            child: _buildImage(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Color titleColor, Color textColor, Color checkColor) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        AppText(
          'Advanced Statistics',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.semiBold(
            size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
            color: Colors.grey.shade600,
          ),
        ),
        Hbox(isDesktop ? 16.0 : 12.0),
        AppText(
          'Keep control over your money',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.bold(
            size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
            color: titleColor,
          ),
        ),
        Hbox(isDesktop ? 24.0 : 20.0),
        AppText(
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.regular(
            size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
            color: textColor,
          ),
        ),
        Hbox(isDesktop ? 32.0 : 24.0),
        _buildFeature('Malesuada Ipsum', checkColor, textColor),
        Hbox(12.0),
        _buildFeature('Vestibulum', checkColor, textColor),
        Hbox(12.0),
        _buildFeature('Parturient Lorem', checkColor, textColor),
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
            color: Colors.grey.shade200,
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
            _buildContent(Colors.white, Colors.grey.shade300, const Color(0xFF26CE92)),
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
          Expanded(
            flex: 1,
            child: _buildImage(),
          ),
          Wbox(isDesktop ? 80.0 : 60.0),
          Expanded(
            flex: 1,
            child: _buildContent(Colors.white, Colors.grey.shade300, const Color(0xFF26CE92)),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(Color titleColor, Color textColor, Color checkColor) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        AppText(
          'Advanced Statistics',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.semiBold(
            size: isDesktop ? 14.0 : (isTablet ? 13.0 : 12.0),
            color: Colors.grey.shade400,
          ),
        ),
        Hbox(isDesktop ? 16.0 : 12.0),
        AppText(
          'Keep control over your money',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.bold(
            size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
            color: titleColor,
          ),
        ),
        Hbox(isDesktop ? 24.0 : 20.0),
        AppText(
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Ts.regular(
            size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
            color: textColor,
          ),
        ),
        Hbox(isDesktop ? 32.0 : 24.0),
        _buildFeature('Malesuada Ipsum', checkColor, textColor),
        Hbox(12.0),
        _buildFeature('Vestibulum', checkColor, textColor),
        Hbox(12.0),
        _buildFeature('Parturient Lorem', checkColor, textColor),
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
