import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/core/utils/cached_image.dart';

class VideoShowcaseSection extends StatelessWidget {
  const VideoShowcaseSection({super.key});

  // Video thumbnail URLs - using Unsplash images matching the descriptions
  static const List<String> _videoThumbnails = [
    'https://images.unsplash.com/photo-1502680390469-be75c86b636f?auto=format&fit=crop&w=800&q=80', // Beach celebration
    'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?auto=format&fit=crop&w=800&q=80', // Family around table
    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=800&q=80', // Person in car
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: isMobile ? 40 : 64,
      ),
      child: Column(
        children: [
          // Heading
          AppText(
            'Watch how we touch lives!',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isMobile ? 28 : 48,
              color: AppColor.black,
            ),
          ),
          Hbox(isMobile ? 32 : 48),
          // Video thumbnails
          isMobile
              ? Column(
                  children: [
                    for (int i = 0; i < _videoThumbnails.length; i++) ...[
                      _VideoThumbnailCard(
                        imageUrl: _videoThumbnails[i],
                        isMobile: true,
                      ),
                      if (i < _videoThumbnails.length - 1) Hbox(24),
                    ],
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < _videoThumbnails.length; i++) ...[
                      Expanded(
                        child: _VideoThumbnailCard(
                          imageUrl: _videoThumbnails[i],
                          isMobile: false,
                        ),
                      ),
                      if (i < _videoThumbnails.length - 1) const Wbox(24),
                    ],
                  ],
                ),
        ],
      ),
    );
  }
}

class _VideoThumbnailCard extends StatelessWidget {
  const _VideoThumbnailCard({
    required this.imageUrl,
    required this.isMobile,
  });

  final String imageUrl;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle video play action
      },
      child: Container(
        height: isMobile ? 200 : 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColor.gray200.withOpacity(0.5),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Video thumbnail image
              CachedImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
              // Gradient overlay for better play button visibility
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.3),
                    ],
                  ),
                ),
              ),
              // Play button overlay
              Center(
                child: Container(
                  width: isMobile ? 60 : 80,
                  height: isMobile ? 60 : 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.play_arrow,
                    size: isMobile ? 30 : 40,
                    color: AppColor.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

