import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Reusable App Store and Play Store download buttons
/// Matches the design from the reference image
class AppDownloadButtons extends StatelessWidget {
  final String? playStoreUrl;
  final String? appStoreUrl;
  final bool isLarge;
  final Axis direction;

  const AppDownloadButtons({
    super.key,
    this.playStoreUrl,
    this.appStoreUrl,
    this.isLarge = true,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    if (playStoreUrl == null && appStoreUrl == null) {
      return const SizedBox.shrink();
    }

    final buttons = [
      if (playStoreUrl != null)
        GooglePlayButton(
          onTap: () {
            // TODO: Open Play Store URL
          },
          isLarge: isLarge,
        ),
      if (appStoreUrl != null)
        AppStoreButton(
          onTap: () {
            // TODO: Open App Store URL
          },
          isLarge: isLarge,
        ),
    ];

    if (direction == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < buttons.length; i++) ...[
            buttons[i],
            if (i < buttons.length - 1) Wbox(16),
          ],
        ],
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < buttons.length; i++) ...[
            buttons[i],
            if (i < buttons.length - 1) Hbox(16),
          ],
        ],
      );
    }
  }
}

/// Google Play Store Download Button
class GooglePlayButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isLarge;

  const GooglePlayButton({super.key, required this.onTap, this.isLarge = true});

  @override
  State<GooglePlayButton> createState() => _GooglePlayButtonState();
}

class _GooglePlayButtonState extends State<GooglePlayButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final height = widget.isLarge ? 56.0 : 48.0;
    final iconSize = widget.isLarge ? 32.0 : 28.0;
    final fontSize1 = widget.isLarge ? 10.0 : 9.0;
    final fontSize2 = widget.isLarge ? 18.0 : 16.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(
              horizontal: widget.isLarge ? 20 : 16,
              vertical: widget.isLarge ? 8 : 6,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Google Play Icon from assets
                    SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: Image.asset(
                        AppImage.playstorelogo,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: iconSize,
                          );
                        },
                      ),
                    ),
                    Wbox(widget.isLarge ? 12 : 10),
                    // Text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'GET IT ON',
                          style: Ts.regular(
                            size: fontSize1,
                            color: Colors.white,
                          ),
                        ),
                        AppText(
                          'Google Play',
                          style: Ts.bold(size: fontSize2, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Apple App Store Download Button
class AppStoreButton extends StatefulWidget {
  final VoidCallback onTap;
  final bool isLarge;

  const AppStoreButton({super.key, required this.onTap, this.isLarge = true});

  @override
  State<AppStoreButton> createState() => _AppStoreButtonState();
}

class _AppStoreButtonState extends State<AppStoreButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final height = widget.isLarge ? 56.0 : 48.0;
    final iconSize = widget.isLarge ? 32.0 : 28.0;
    final fontSize1 = widget.isLarge ? 10.0 : 9.0;
    final fontSize2 = widget.isLarge ? 18.0 : 16.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(
              horizontal: widget.isLarge ? 20 : 16,
              vertical: widget.isLarge ? 8 : 6,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Apple Icon from assets
                    SizedBox(
                      width: iconSize,
                      height: iconSize,
                      child: Image.asset(
                        AppImage.applelogo,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: iconSize,
                          );
                        },
                      ),
                    ),
                    Wbox(widget.isLarge ? 12 : 10),
                    // Text
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'Download on the',
                          style: Ts.regular(
                            size: fontSize1,
                            color: Colors.white,
                          ),
                        ),
                        AppText(
                          'App Store',
                          style: Ts.bold(size: fontSize2, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
