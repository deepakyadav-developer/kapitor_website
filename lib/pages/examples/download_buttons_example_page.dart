import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/widgets/common/app_download_buttons.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

/// Example page showcasing the App Download Buttons
class DownloadButtonsExamplePage extends StatelessWidget {
  const DownloadButtonsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            _buildContent(context),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          AppText(
            'App Download Buttons',
            style: Ts.bold(size: isDesktop ? 48 : 32, color: Colors.black),
          ),
          Hbox(16),
          AppText(
            'Reusable download buttons for Google Play and App Store',
            style: Ts.regular(
              size: isDesktop ? 18 : 16,
              color: Colors.black.withValues(alpha: 0.7),
            ),
          ),
          Hbox(isDesktop ? 60 : 40),

          // Example 1: Both Buttons (Large, Horizontal)
          _buildExample(
            title: '1. Both Buttons - Large - Horizontal',
            description: 'Default configuration with both buttons',
            child: const AppDownloadButtons(
              playStoreUrl: 'https://play.google.com',
              appStoreUrl: 'https://apps.apple.com',
              isLarge: true,
              direction: Axis.horizontal,
            ),
          ),

          Hbox(40),

          // Example 2: Both Buttons (Small, Horizontal)
          _buildExample(
            title: '2. Both Buttons - Small - Horizontal',
            description: 'Smaller size for compact layouts',
            child: const AppDownloadButtons(
              playStoreUrl: 'https://play.google.com',
              appStoreUrl: 'https://apps.apple.com',
              isLarge: false,
              direction: Axis.horizontal,
            ),
          ),

          Hbox(40),

          // Example 3: Both Buttons (Large, Vertical)
          _buildExample(
            title: '3. Both Buttons - Large - Vertical',
            description: 'Vertical layout for mobile or sidebar',
            child: const AppDownloadButtons(
              playStoreUrl: 'https://play.google.com',
              appStoreUrl: 'https://apps.apple.com',
              isLarge: true,
              direction: Axis.vertical,
            ),
          ),

          Hbox(40),

          // Example 4: Only Google Play
          _buildExample(
            title: '4. Google Play Only',
            description: 'Show only Google Play button',
            child: const AppDownloadButtons(
              playStoreUrl: 'https://play.google.com',
              isLarge: true,
            ),
          ),

          Hbox(40),

          // Example 5: Only App Store
          _buildExample(
            title: '5. App Store Only',
            description: 'Show only App Store button',
            child: const AppDownloadButtons(
              appStoreUrl: 'https://apps.apple.com',
              isLarge: true,
            ),
          ),

          Hbox(40),

          // Example 6: Individual Buttons
          _buildExample(
            title: '6. Individual Button Components',
            description: 'Use GooglePlayButton and AppStoreButton directly',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GooglePlayButton(
                  onTap: () {
                    debugPrint('Google Play tapped');
                  },
                  isLarge: true,
                ),
                Wbox(16),
                AppStoreButton(
                  onTap: () {
                    debugPrint('App Store tapped');
                  },
                  isLarge: true,
                ),
              ],
            ),
          ),

          Hbox(40),

          // Example 7: On Dark Background
          _buildExample(
            title: '7. On Dark Background',
            description: 'Buttons work well on dark backgrounds',
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const AppDownloadButtons(
                playStoreUrl: 'https://play.google.com',
                appStoreUrl: 'https://apps.apple.com',
                isLarge: true,
              ),
            ),
          ),

          Hbox(40),

          // Example 8: On Colored Background
          _buildExample(
            title: '8. On Colored Background',
            description: 'Buttons adapt to any background color',
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const AppDownloadButtons(
                playStoreUrl: 'https://play.google.com',
                appStoreUrl: 'https://apps.apple.com',
                isLarge: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExample({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(title, style: Ts.bold(size: 20, color: Colors.black)),
          Hbox(8),
          AppText(
            description,
            style: Ts.regular(
              size: 14,
              color: Colors.black.withValues(alpha: 0.6),
            ),
          ),
          Hbox(24),
          child,
        ],
      ),
    );
  }
}
