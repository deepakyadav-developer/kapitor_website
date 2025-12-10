import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Interactive Feature Section with Chart and Selectable Features
/// Matches the design from the reference image
class InteractiveFeatureSection extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<FeatureItem> features;
  final String? chartImage;
  final Color? backgroundColor;

  const InteractiveFeatureSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.features,
    this.chartImage,
    this.backgroundColor,
  });

  @override
  State<InteractiveFeatureSection> createState() =>
      _InteractiveFeatureSectionState();
}

class _InteractiveFeatureSectionState extends State<InteractiveFeatureSection>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.1, 0), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  void _onFeatureSelected(int index) {
    if (_selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
      _fadeController.reset();
      _slideController.reset();
      _fadeController.forward();
      _slideController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      color: widget.backgroundColor ?? Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: isMobile
          ? _buildMobileLayout()
          : _buildDesktopLayout(isDesktop, isTablet),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(false),
        Hbox(40),
        _buildChartSection(false),
        Hbox(40),
        _buildFeaturesSection(false),
      ],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildHeader(isDesktop),
        Hbox(isDesktop ? 60 : 50),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 1, child: _buildChartSection(isDesktop)),
              Wbox(isDesktop ? 80 : 60),
              Expanded(flex: 1, child: _buildFeaturesSection(isDesktop)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(bool isLarge) {
    return AppText(
      widget.title,
      style: Ts.bold(
        size: isLarge ? 44 : 32,
        color: Colors.black,
      ).copyWith(height: 1.2),
    );
  }

  Widget _buildChartSection(bool isLarge) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          padding: EdgeInsets.all(isLarge ? 40 : 30),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              // Dollar Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.attach_money,
                  size: 32,
                  color: Color(0xFF4CAF50),
                ),
              ),
              Hbox(24),
              // Chart Image - Larger Size
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  widget.chartImage ?? AppImage.fChart,
                  height: isLarge ? 450 : 350,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: isLarge ? 450 : 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.bar_chart,
                          size: 80,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Hbox(24),
              // Connection Icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildConnectionIcon(const Color(0xFF4CAF50)),
                  Wbox(12),
                  _buildConnectionIcon(const Color(0xFF4CAF50)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildConnectionIcon(Color color) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.link, size: 20, color: color),
    );
  }

  Widget _buildFeaturesSection(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Subtitle
        AppText(
          widget.subtitle,
          style: Ts.semiBold(size: isLarge ? 14 : 13, color: AppColor.primary),
        ),
        Hbox(16),
        // Scrollable Feature Cards with fixed height
        SizedBox(
          height: 500,
          child: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
              itemCount: widget.features.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: isLarge ? 20 : 16),
                  child: _FeatureCard(
                    feature: widget.features[index],
                    isSelected: _selectedIndex == index,
                    onTap: () => _onFeatureSelected(index),
                    isLarge: isLarge,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final FeatureItem feature;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isLarge;

  const _FeatureCard({
    required this.feature,
    required this.isSelected,
    required this.onTap,
    required this.isLarge,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.isSelected || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: widget.isSelected ? const Color(0xFFE8F5E9) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: widget.isSelected
                  ? const Color(0xFF4CAF50)
                  : (isActive ? Colors.grey.shade300 : Colors.grey.shade200),
              width: widget.isSelected ? 2 : 1,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: widget.isSelected
                          ? const Color(0xFF4CAF50).withValues(alpha: 0.2)
                          : Colors.black.withValues(alpha: 0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Left colored bar
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: widget.isSelected ? 6 : 4,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? const Color(0xFF4CAF50)
                        : Colors.transparent,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                ),
                // Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(widget.isLarge ? 24 : 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        AppText(
                          widget.feature.title,
                          style: Ts.bold(
                            size: widget.isLarge ? 18 : 16,
                            color: Colors.black,
                          ),
                        ),
                        Hbox(12),
                        // Description
                        AppText(
                          widget.feature.description,
                          style: Ts.regular(
                            size: widget.isLarge ? 14 : 13,
                            color: Colors.black.withValues(alpha: 0.6),
                          ).copyWith(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Feature Item Model
class FeatureItem {
  final String title;
  final String description;
  final IconData icon;

  const FeatureItem({
    required this.title,
    required this.description,
    required this.icon,
  });
}
