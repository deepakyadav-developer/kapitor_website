import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelMemoriesSection extends StatelessWidget {
  const TravelMemoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFE8F9F3), Color(0xFFF0FCF7), Colors.white],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: isMobile
          ? _buildMobileLayout(isDesktop, isTablet, isMobile)
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildContentSection(isDesktop, isTablet),
                ),
                Wbox(isDesktop ? 80 : 40),
                Expanded(
                  flex: 1,
                  child: _buildImagesSection(isDesktop, isTablet, isMobile),
                ),
              ],
            ),
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContentSection(isDesktop, isTablet),
        Hbox(40),
        _buildImagesSection(isDesktop, isTablet, isMobile),
      ],
    );
  }

  Widget _buildContentSection(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Globe icon
        Container(
          width: isDesktop ? 50 : 40,
          height: isDesktop ? 50 : 40,
          decoration: BoxDecoration(
            color: AppColor.primary.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.public,
            color: AppColor.primary,
            size: isDesktop ? 28 : 24,
          ),
        ),

        Hbox(24),

        // Main Heading
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Traveling opens the door to\ncreating ',
                style: Ts.bold(
                  size: isDesktop ? 40 : (isTablet ? 32 : 28),
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'memories',
                style: Ts.bold(
                  size: isDesktop ? 40 : (isTablet ? 32 : 28),
                  color: AppColor.primary,
                ),
              ),
            ],
          ),
        ),

        Hbox(24),

        // Description
        AppText(
          'Experience the world like never before with Kapitor\'s seamless travel booking platform. From breathtaking destinations to unforgettable adventures, we help you create lasting memories while paying with USDT. Book flights, hotels, and experiences all in one place, making your dream vacation a reality with the power of cryptocurrency.',
          style: Ts.regular(
            size: isDesktop ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildImagesSection(bool isDesktop, bool isTablet, bool isMobile) {
    return SizedBox(
      height: isMobile ? 300 : (isTablet ? 350 : 400),
      child: Stack(
        children: [
          // First image (left, tallest)
          Positioned(
            left: 0,
            top: 0,
            bottom: isMobile ? 40 : 60,
            child: _TravelImageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400',
              width: isMobile ? 100 : (isTablet ? 140 : 160),
              borderColor: const Color(0xFF2196F3),
            ),
          ),

          // Second image (center, medium height)
          Positioned(
            left: isMobile ? 90 : (isTablet ? 130 : 180),
            top: isMobile ? 30 : (isTablet ? 40 : 40),
            bottom: 0,
            child: _TravelImageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=400',
              width: isMobile ? 100 : (isTablet ? 140 : 160),
              borderColor: const Color(0xFFFFC107),
              showPlayButton: true,
            ),
          ),

          // Third image (right, medium height)
          Positioned(
            right: 0,
            top: isMobile ? 20 : (isTablet ? 30 : 40),
            bottom: isMobile ? 20 : (isTablet ? 30 : 40),
            child: _TravelImageCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1499856871958-5b9627545d1a?w=400',
              width: isMobile ? 100 : (isTablet ? 140 : 160),
              borderColor: const Color(0xFFFFC107),
            ),
          ),
        ],
      ),
    );
  }
}

class _TravelImageCard extends StatelessWidget {
  final String imageUrl;
  final double width;
  final Color borderColor;
  final bool showPlayButton;

  const _TravelImageCard({
    required this.imageUrl,
    required this.width,
    required this.borderColor,
    this.showPlayButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor, width: 4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey.shade200,
                  child: const Center(
                    child: Icon(Icons.image, size: 60, color: Colors.grey),
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
                      color: AppColor.primary,
                    ),
                  ),
                );
              },
            ),
            if (showPlayButton)
              Center(
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
