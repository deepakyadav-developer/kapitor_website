import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _floatAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _floatAnimation = Tween<double>(
      begin: -15,
      end: 15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF5F5F5), Color(0xFFFFFFFF), Color(0xFFF0F9FF)],
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0),
          ),
          child: isMobile
              ? _buildMobileLayout(isDesktop, isTablet, isMobile)
              : Row(
                  children: [
                    // Left content
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Badge
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: isDesktop ? 20.0 : 16.0,
                              vertical: isDesktop ? 10.0 : 8.0,
                            ),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(
                                color: AppColor.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: AppText(
                              'WHERE CRYPTO MEETS COMMODITIES',
                              style: Ts.bold(
                                size: isDesktop ? 12.0 : 11.0,
                                color: AppColor.black,
                              ),
                            ),
                          ),

                          Hbox(isDesktop ? 32.0 : 24.0),

                          // Main headline
                          AppText(
                            'Your Money. Smarter.\nFaster. Borderless.',
                            style: Ts.bold(
                              size: isDesktop ? 56.0 : (isTablet ? 44.0 : 36.0),
                              color: AppColor.black,
                            ),
                          ),

                          Hbox(isDesktop ? 24.0 : 20.0),

                          // Description
                          AppText(
                            'Kapitor is the world\'s first USDT-powered global financial super-app that merges crypto freedom with private institutional discipline.',
                            style: Ts.regular(
                              size: isDesktop ? 16.0 : (isTablet ? 15.0 : 14.0),
                              color: AppColor.textcolor,
                            ),
                          ),

                          Hbox(isDesktop ? 40.0 : 32.0),

                          // Buttons
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.black,
                                  foregroundColor: AppColor.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isDesktop
                                        ? 40.0
                                        : (isTablet ? 32.0 : 28.0),
                                    vertical: isDesktop
                                        ? 18.0
                                        : (isTablet ? 16.0 : 14.0),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                  elevation: 0,
                                ),
                                child: AppText(
                                  'Download App',
                                  style: Ts.semiBold(
                                    size: isDesktop
                                        ? 16.0
                                        : (isTablet ? 15.0 : 14.0),
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                              Wbox(16.0),
                              OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColor.black,
                                  side: BorderSide(
                                    color: AppColor.black,
                                    width: 1.5,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isDesktop
                                        ? 40.0
                                        : (isTablet ? 32.0 : 28.0),
                                    vertical: isDesktop
                                        ? 18.0
                                        : (isTablet ? 16.0 : 14.0),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                                child: AppText(
                                  'Watch Demo',
                                  style: Ts.semiBold(
                                    size: isDesktop
                                        ? 16.0
                                        : (isTablet ? 15.0 : 14.0),
                                    color: AppColor.black,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Hbox(isDesktop ? 40.0 : 32.0),

                          // Trust badge
                          Row(
                            children: [
                              // User avatars
                              SizedBox(
                                width: 100,
                                height: 40,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 0,
                                      child: _buildAvatar(
                                        'https://randomuser.me/api/portraits/women/44.jpg',
                                        AppImage.user2,
                                      ),
                                    ),
                                    Positioned(
                                      left: 30,
                                      child: _buildAvatar(
                                        'https://randomuser.me/api/portraits/men/32.jpg',
                                        AppImage.people,
                                      ),
                                    ),
                                    Positioned(
                                      left: 60,
                                      child: _buildAvatar(
                                        'https://randomuser.me/api/portraits/women/65.jpg',
                                        AppImage.peoples,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Wbox(16.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    '15 Million+',
                                    style: Ts.bold(
                                      size: isDesktop ? 18.0 : 16.0,
                                      color: AppColor.black,
                                    ),
                                  ),
                                  AppText(
                                    'Trusted by millions',
                                    style: Ts.regular(
                                      size: isDesktop ? 13.0 : 12.0,
                                      color: AppColor.textcolor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    Wbox(isDesktop ? 80.0 : 60.0),

                    // Right side - Animated app mockup in container
                    Expanded(
                      flex: 1,
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, _floatAnimation.value),
                            child: Transform.scale(
                              scale: _scaleAnimation.value,
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            isDesktop ? 40.0 : (isTablet ? 32.0 : 24.0),
                          ),

                          child: Image.asset(
                            AppImage.blurPhone,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                height: 400,
                                decoration: BoxDecoration(
                                  color: Colors.white.withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.phone_iphone,
                                    size: 100,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildMobileLayout(bool isDesktop, bool isTablet, bool isMobile) {
    return Column(
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: AppColor.black, width: 1.5),
            borderRadius: BorderRadius.circular(40),
          ),
          child: AppText(
            'WHERE CRYPTO MEETS COMMODITIES',
            style: Ts.bold(size: 10.0, color: AppColor.black),
          ),
        ),

        Hbox(24.0),

        // Main headline
        AppText(
          'Your Money. Smarter.\nFaster. Borderless.',
          textAlign: TextAlign.center,
          style: Ts.bold(size: 32.0, color: AppColor.black),
        ),

        Hbox(20.0),

        // Description
        AppText(
          'Kapitor is the world\'s first USDT-powered global financial super-app that merges crypto freedom with private institutional discipline.',
          textAlign: TextAlign.center,
          style: Ts.regular(size: 14.0, color: AppColor.textcolor),
        ),

        Hbox(32.0),

        // Animated app mockup in container
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatAnimation.value),
              child: Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              ),
            );
          },
          child: Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF26CE92), Color(0xFF1DB87A)],
              ),
              borderRadius: BorderRadius.circular(24.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF26CE92).withValues(alpha: 0.3),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Image.asset(
              AppImage.app,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.phone_iphone,
                      size: 80,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        Hbox(32.0),

        // Buttons - Full width on mobile
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.black,
                foregroundColor: AppColor.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                elevation: 4,
              ),
              child: AppText(
                'Download App',
                style: Ts.semiBold(size: 15.0, color: AppColor.white),
              ),
            ),
            Hbox(16.0),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColor.black,
                side: BorderSide(color: AppColor.black, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              child: AppText(
                'Watch Demo',
                style: Ts.semiBold(size: 15.0, color: AppColor.black),
              ),
            ),
            Hbox(16.0),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/feature-showcase');
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColor.black,
                side: BorderSide(color: AppColor.black, width: 1.5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
              child: AppText(
                'Explore Features',
                style: Ts.semiBold(size: 15.0, color: AppColor.black),
              ),
            ),
          ],
        ),

        Hbox(32.0),

        // Trust badge
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User avatars
            SizedBox(
              width: 100,
              height: 40,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: _buildAvatar(
                      'https://randomuser.me/api/portraits/women/44.jpg',
                      AppImage.user2,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    child: _buildAvatar(
                      'https://randomuser.me/api/portraits/men/32.jpg',
                      AppImage.people,
                    ),
                  ),
                  Positioned(
                    left: 60,
                    child: _buildAvatar(
                      'https://randomuser.me/api/portraits/women/65.jpg',
                      AppImage.peoples,
                    ),
                  ),
                ],
              ),
            ),
            Wbox(16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  '15 Million+',
                  style: Ts.bold(size: 16.0, color: AppColor.black),
                ),
                AppText(
                  'Trusted by millions',
                  style: Ts.regular(size: 12.0, color: AppColor.textcolor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(String networkUrl, String assetFallback) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        image: DecorationImage(
          image: NetworkImage(networkUrl),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            // Will use asset fallback on error
          },
        ),
      ),
      child: ClipOval(
        child: Image.network(
          networkUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              assetFallback,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFF26CE92),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 20,
                  ),
                );
              },
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
                  strokeWidth: 2,
                  color: const Color(0xFF26CE92),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
