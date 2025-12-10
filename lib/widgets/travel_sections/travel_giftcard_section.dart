import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelGiftcardSection extends StatefulWidget {
  const TravelGiftcardSection({super.key});

  @override
  State<TravelGiftcardSection> createState() => _TravelGiftcardSectionState();
}

class _TravelGiftcardSectionState extends State<TravelGiftcardSection> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  final List<GiftCardItem> _giftCards = [
    GiftCardItem(
      title: 'E-Commerce',
      description:
          'Amazon, Flipkart, Myntra, Nykaa - Purchase gift cards for global e-commerce platforms paid instantly with USDT',
      imageUrl:
          'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?w=500',
    ),
    GiftCardItem(
      title: 'Entertainment',
      description:
          'Netflix, Amazon Prime, Spotify, Google Play - Access entertainment platforms worldwide with USDT-powered gift cards',
      imageUrl:
          'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?w=500',
    ),
    GiftCardItem(
      title: 'Food & Travel',
      description:
          'Swiggy, Zomato, Uber, Airbnb - Book rides, order food, and find accommodations using stablecoin gift cards',
      imageUrl:
          'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=500',
    ),
    GiftCardItem(
      title: 'Global Brands',
      description:
          'Apple, Walmart, Target, Best Buy, Sephora, Starbucks - Shop at global brands with instant USDT gift card delivery',
      imageUrl:
          'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=500',
    ),
    GiftCardItem(
      title: 'Gaming',
      description:
          'Steam, Xbox, PlayStation - Purchase gaming gift cards for personal use or gifting, all paid with USDT',
      imageUrl:
          'https://images.unsplash.com/photo-1511512578047-dfb367046420?w=500',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _giftCards.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

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
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Destination Label
                    Text(
                      'TOP DESTINATION',
                      style: Ts.bold(
                        size: 14,
                        color: AppColor.primary,
                      ).copyWith(letterSpacing: 2),
                    ),

                    Hbox(16),

                    // Main Heading
                    AppText(
                      'GIFT CARD MARKETPLACE —\nGlobal Brands, Paid with USDT',
                      style: Ts.bold(
                        size: isDesktop ? 40 : (isTablet ? 32 : 24),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Navigation Arrows (Desktop only)
              if (!isMobile) ...[
                Wbox(40),
                Row(
                  children: [
                    // Previous Button
                    InkWell(
                      onTap: _previousPage,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black.withValues(alpha: 0.2),
                            width: 2,
                          ),
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),

                    Wbox(16),

                    // Next Button
                    InkWell(
                      onTap: _nextPage,
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),

          Hbox(isDesktop ? 60 : 40),

          // Carousel
          SizedBox(
            height: isDesktop ? 500 : (isTablet ? 450 : 420),
            child: isMobile
                ? PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemCount: _giftCards.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: _GiftCardItem(
                          item: _giftCards[index],
                          isDesktop: isDesktop,
                          isTablet: isTablet,
                        ),
                      );
                    },
                  )
                : Row(
                    children: [
                      for (int i = 0; i < (isDesktop ? 3 : 2); i++)
                        if (i < _giftCards.length)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: isDesktop ? 12 : 8,
                              ),
                              child: _GiftCardItem(
                                item: _giftCards[i],
                                isDesktop: isDesktop,
                                isTablet: isTablet,
                              ),
                            ),
                          ),
                    ],
                  ),
          ),

          // Mobile Navigation Arrows
          if (isMobile) ...[
            Hbox(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Previous Button
                InkWell(
                  onTap: _previousPage,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.2),
                        width: 2,
                      ),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ),

                Wbox(16),

                // Next Button
                InkWell(
                  onTap: _nextPage,
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _GiftCardItem extends StatelessWidget {
  final GiftCardItem item;
  final bool isDesktop;
  final bool isTablet;

  const _GiftCardItem({
    required this.item,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              item.imageUrl,
              height: isDesktop ? 280 : (isTablet ? 240 : 220),
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: isDesktop ? 280 : (isTablet ? 240 : 220),
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.grey),
                  ),
                );
              },
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: isDesktop ? 280 : (isTablet ? 240 : 220),
                  color: Colors.grey.shade200,
                  child: Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                          : null,
                      color: AppColor.primary,
                    ),
                  ),
                );
              },
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(isDesktop ? 28 : 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                AppText(
                  item.title,
                  style: Ts.bold(
                    size: isDesktop ? 24 : 20,
                    color: Colors.black,
                  ),
                ),

                Hbox(12),

                // Description
                AppText(
                  item.description,
                  style: Ts.regular(
                    size: isDesktop ? 16 : 14,
                    color: Colors.black.withValues(alpha: 0.6),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GiftCardItem {
  final String title;
  final String description;
  final String imageUrl;

  GiftCardItem({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
