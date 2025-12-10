import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/widgets/common/app_download_buttons.dart';

class FeatureHeroSection extends StatefulWidget {
  final String badge;
  final String title;
  final String description;
  final String imagePath;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final VoidCallback? onFeatureTap;
  final List<Widget>? floatingIcons;
  final Color? backgroundColor;

  const FeatureHeroSection({
    super.key,
    required this.badge,
    required this.title,
    required this.description,
    required this.imagePath,
    this.playStoreUrl,
    this.appStoreUrl,
    this.onFeatureTap,
    this.floatingIcons,
    this.backgroundColor,
  });

  @override
  State<FeatureHeroSection> createState() => _FeatureHeroSectionState();
}

class _FeatureHeroSectionState extends State<FeatureHeroSection>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _floatController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _floatController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _floatAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    return GestureDetector(
      onTap: widget.onFeatureTap,
      child: Container(
        width: double.infinity,
        color: widget.backgroundColor ?? Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
          vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
        ),
        child: isMobile
            ? _buildMobileLayout()
            : _buildDesktopLayout(isDesktop, isTablet),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBadge(false),
            Hbox(24),
            _buildTitle(false),
            Hbox(16),
            _buildDescription(false),
            Hbox(32),
            _buildAppButtons(false),
            Hbox(40),
            _buildImageSection(false),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBadge(isDesktop),
                  Hbox(isDesktop ? 32 : 24),
                  _buildTitle(isDesktop),
                  Hbox(isDesktop ? 24 : 20),
                  _buildDescription(isDesktop),
                  Hbox(isDesktop ? 40 : 32),
                  _buildAppButtons(isDesktop),
                ],
              ),
            ),
            Wbox(isDesktop ? 80 : 60),
            Expanded(flex: 1, child: _buildImageSection(isDesktop)),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(bool isLarge) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 24 : 20,
        vertical: isLarge ? 12 : 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, size: isLarge ? 18 : 16, color: Colors.black54),
          Wbox(8),
          AppText(
            widget.badge,
            style: Ts.medium(size: isLarge ? 14 : 13, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(bool isLarge) {
    return AppText(
      widget.title,
      style: Ts.bold(
        size: isLarge ? 48 : 32,
        color: Colors.black,
      ).copyWith(height: 1.2),
    );
  }

  Widget _buildDescription(bool isLarge) {
    return SizedBox(
      width: isLarge ? 550 : double.infinity,
      child: AppText(
        widget.description,
        style: Ts.regular(
          size: isLarge ? 16 : 14,
          color: Colors.black.withValues(alpha: 0.7),
        ).copyWith(height: 1.6),
      ),
    );
  }

  Widget _buildAppButtons(bool isLarge) {
    if (widget.playStoreUrl == null && widget.appStoreUrl == null) {
      return const SizedBox.shrink();
    }

    return AppDownloadButtons(
      playStoreUrl: widget.playStoreUrl,
      appStoreUrl: widget.appStoreUrl,
      isLarge: isLarge,
      direction: Axis.horizontal,
    );
  }

  Widget _buildImageSection(bool isLarge) {
    return AnimatedBuilder(
      animation: _floatAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatAnimation.value),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Main image
              Center(
                child: Image.asset(
                  widget.imagePath,
                  height: isLarge ? 500 : 350,
                  fit: BoxFit.contain,
                ),
              ),
              // Floating icons
              if (widget.floatingIcons != null) ...widget.floatingIcons!,
            ],
          ),
        );
      },
    );
  }
}

// Floating icon widget for decorative elements
class FloatingIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  final double top;
  final double? left;
  final double? right;
  final double? bottom;

  const FloatingIcon({
    super.key,
    required this.icon,
    required this.color,
    this.size = 40,
    this.top = 0,
    this.left,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: size, color: color),
      ),
    );
  }
}
