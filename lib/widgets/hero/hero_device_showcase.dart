import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/cached_image.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class HeroDeviceShowcase extends StatelessWidget {
  const HeroDeviceShowcase({super.key});

  static const List<String> _avatarUrls = [
    'https://images.unsplash.com/photo-1502685104226-ee32379fefbe?auto=format&fit=crop&w=200&q=60',
    'https://images.unsplash.com/photo-1504593811423-6dd665756598?auto=format&fit=crop&w=200&q=60',
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=200&q=60',
    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?auto=format&fit=crop&w=200&q=60',
  ];



  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 900;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 80,
        vertical: isMobile ? 32 : 64,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 48,
          vertical: isMobile ? 32 : 48,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: AppColor.gray200.withOpacity(0.6),
              blurRadius: 40,
              spreadRadius: 4,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: isMobile
            ? _buildMobileLayout(screenHeight)
            : _buildDesktopLayout(screenHeight),
      ),
    );
  }

  Widget _buildDesktopLayout(double screenHeight) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _buildCharacterColumn(false, screenHeight)),
        const Wbox(40),
        Expanded(child: _buildDeviceColumn(false)),
        const Wbox(40),
        // Expanded(child: _buildStatsColumn(false)),
      ],
    );
  }

  Widget _buildMobileLayout(double screenHeight) {
    return Column(
      children: [
        _buildDeviceColumn(true),
        const Hbox(32),
        _buildCharacterColumn(true, screenHeight),
        const Hbox(32),
       _buildAvatarStack(),
      ],
    );
  }

  Widget _buildCharacterColumn(bool isMobile, double screenHeight) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Align(
          alignment: isMobile ? Alignment.center : Alignment.centerLeft,
          child: Image.asset(
            AppImage.trust,
            height: isMobile ? 120: 281,
            width: isMobile ? 120 : 432,
            fit: BoxFit.contain,
          ),
        ),
      
      ],
    );
  }

  Widget _buildDeviceColumn(bool isMobile) {
    final phoneWidth = isMobile ? 200.0 : 280.0;
    return SizedBox(
      height: isMobile ? 320 : 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: isMobile ? 30 : 20,
            child: SvgPicture.asset(
              AppImage.mobileBlur,
              width: phoneWidth + 100,
              fit: BoxFit.cover,
            ),
          ),
          Image.asset(
            AppImage.heroPhone,
            width: phoneWidth,
            fit: BoxFit.contain,
          ),
          Positioned(
            top: isMobile ? 10 : 20,
            right: isMobile ? 20 : 40,
            child: _UserBadge(imagePath: AppImage.user2),
          ),
          
        ],
      ),
    );
  }

 
  Widget _buildAvatarStack() {
    const double size = 48;
    const double overlap = 24;
    return SizedBox(
      height: size,
      child: Stack(
        children: [
          for (int i = 0; i < _avatarUrls.length; i++)
            Positioned(
              left: i * overlap,
              child: _AvatarBubble(url: _avatarUrls[i]),
            ),
        ],
      ),
    );
  }
}

class _AvatarBubble extends StatelessWidget {
  const _AvatarBubble({required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipOval(
        child: CachedImage(
          imageUrl: url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _UserBadge extends StatelessWidget {
  const _UserBadge({required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
    );
  }
}

class _IconBadge extends StatelessWidget {
  const _IconBadge({required this.icon, required this.color});
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: color,
        size: 24,
      ),
    );
  }
}