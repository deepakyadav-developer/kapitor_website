import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';

class FeatureCard extends StatefulWidget {
  final String? iconImage;
  final IconData? iconData;
  final String title;
  final String description;
  final String illustrationImage;
  final Color backgroundColor;
  final Color textColor;
  final bool isHorizontal;

  const FeatureCard({
    Key? key,
    this.iconImage,
    this.iconData,
    required this.title,
    required this.description,
    required this.illustrationImage,
    required this.backgroundColor,
    required this.textColor,
    this.isHorizontal = false,
  }) : super(key: key);

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive sizing based on available width
        final isSmall = constraints.maxWidth < 350;
        final isMedium = constraints.maxWidth >= 350 && constraints.maxWidth < 500;
        final hasBoundedHeight = constraints.maxHeight != double.infinity;
        
        // Responsive values
        final iconSize = isSmall ? 40.0 : 48.0;
        final borderRadius = isSmall ? 16.0 : 24.0;
        final padding = isSmall ? 16.0 : (isMedium ? 20.0 : 24.0);
        final titleSize = isSmall ? 18.0 : (isMedium ? 19.0 : 20.0);
        final descSize = isSmall ? 13.0 : 14.0;
        final spacing1 = isSmall ? 16.0 : 24.0;
        final spacing2 = isSmall ? 12.0 : 16.0;
        final spacing3 = isSmall ? 24.0 : 32.0;
        
        // Always white by default, black on hover
        final hoverBackgroundColor = _isHovered ? AppColor.black : AppColor.white;
        final hoverTextColor = _isHovered ? AppColor.white : AppColor.black;

        if (widget.isHorizontal) {
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                _isHovered = true;
                _animationController.forward();
              });
            },
            onExit: (_) {
              setState(() {
                _isHovered = false;
                _animationController.reverse();
              });
            },
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: hoverBackgroundColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                      border: Border.all(
                        color: hoverBackgroundColor == Colors.white
                            ? Colors.grey.shade300
                            : Colors.transparent,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.all(padding),
                    child: child,
                  ),
                );
              },
              child: _buildHorizontalContent(
                iconSize,
                spacing1,
                spacing2,
                spacing3,
                titleSize,
                descSize,
                hoverTextColor,
              ),
            ),
          );
        }
        
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHovered = true;
              _animationController.forward();
            });
          },
          onExit: (_) {
            setState(() {
              _isHovered = false;
              _animationController.reverse();
            });
          },
          child: AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  decoration: BoxDecoration(
                    color: hoverBackgroundColor,
                    borderRadius: BorderRadius.circular(borderRadius),
                    border: Border.all(
                      color: hoverBackgroundColor == Colors.white
                          ? Colors.grey.shade300
                          : Colors.transparent,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.all(padding),
                  child: child,
                ),
              );
            },
            child: _buildVerticalContent(
              iconSize,
              spacing1,
              spacing2,
              spacing3,
              titleSize,
              descSize,
              hasBoundedHeight,
              hoverTextColor,
            ),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalContent(
    double iconSize,
    double spacing1,
    double spacing2,
    double spacing3,
    double titleSize,
    double descSize,
    Color textColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: const Color(0xFFFDD835),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(iconSize * 0.25),
                child: widget.iconImage != null
                    ? Image.asset(
                        widget.iconImage!,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        widget.iconData ?? Icons.phone_android,
                        color: Colors.white,
                        size: iconSize * 0.5,
                      ),
              ),
              SizedBox(height: spacing1),
              
              // Title
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: titleSize,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                  height: 1.4,
                ),
              ),
              SizedBox(height: spacing2),
              
              // Description
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: descSize,
                  color: textColor.withOpacity(0.8),
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: spacing3),
        Expanded(
          flex: 1,
          child: Image.asset(
            widget.illustrationImage,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalContent(
    double iconSize,
    double spacing1,
    double spacing2,
    double spacing3,
    double titleSize,
    double descSize,
    bool hasBoundedHeight,
    Color textColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: hasBoundedHeight ? MainAxisSize.max : MainAxisSize.min,
      children: [
        // Icon
        Container(
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            color: const Color(0xFFFDD835),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(iconSize * 0.25),
          child: widget.iconImage != null
              ? Image.asset(
                  widget.iconImage!,
                  fit: BoxFit.contain,
                )
              : Icon(
                  widget.iconData ?? Icons.phone_android,
                  color: Colors.white,
                  size: iconSize * 0.5,
                ),
        ),
        SizedBox(height: spacing1),
        
        // Title
        Text(
          widget.title,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w600,
            color: textColor,
            height: 1.4,
          ),
        ),
        SizedBox(height: spacing2),
        
        // Description
        Text(
          widget.description,
          style: TextStyle(
            fontSize: descSize,
            color: textColor.withOpacity(0.8),
            height: 1.6,
          ),
        ),
        SizedBox(height: spacing3),
        
        // Illustration
        hasBoundedHeight
            ? Expanded(
                child: Center(
                  child: Image.asset(
                    widget.illustrationImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              )
            : Flexible(
                child: Center(
                  child: Image.asset(
                    widget.illustrationImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ),
      ],
    );
  }
}

// Feature Cards Section Widget
class FeatureCardsSection extends StatelessWidget {
  const FeatureCardsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;
        
        // Calculate responsive padding
        final horizontalPadding = isDesktop 
            ? constraints.maxWidth * 0.08 
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 60.0 : (isTablet ? 40.0 : 24.0);
        
        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }
        
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Column(
            children: [
              // Top Row - Two cards side by side
              SizedBox(
                height: isDesktop ? 650.0 : 550.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Card - USDT Card (White)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: isDesktop ? 24.0 : 16.0),
                        child: FeatureCard(
                          iconData: Icons.phone_android,
                          title: 'Powered by USDT - Instant, global, stable.',
                          description:
                              'Create a custom card that reflects your unique style and personality. Choose from a range of colors, patterns, and designs to customize the look of your card.',
                          illustrationImage: AppImage.bitcoin,
                          backgroundColor: AppColor.white,
                          textColor: AppColor.black,
                        ),
                      ),
                    ),
                    
                    // Second Card - Insured & Audited
                    Expanded(
                      child: FeatureCard(
                        iconData: Icons.show_chart,
                        title: 'Insured & Audited - Full transparency with live Proof-of-Reserves.',
                        description:
                            'Track your sending patterns, analyze income or expenses easily, and receive personalized recommendations to optimize your financial habits.',
                        illustrationImage: AppImage.bro,
                        backgroundColor: AppColor.white,
                        textColor: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: isDesktop ? 24.0 : 16.0),
              
              // Bottom Row - Full width card
              SizedBox(
                height: isDesktop ? 400.0 : 350.0,
                child: FeatureCard(
                  iconData: Icons.autorenew,
                  title: 'AI-Driven Wealth - Smarter yields, better trades, safer finance.',
                  description:
                      'Create a custom card that reflects your unique style and personality. Choose from a range of colors, patterns, and designs to customize the look of your card.',
                  illustrationImage: AppImage.people,
                  backgroundColor: AppColor.white,
                  textColor: AppColor.black,
                  isHorizontal: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          // First Card - USDT Card
          SizedBox(
            height: 500.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FeatureCard(
                iconData: Icons.phone_android,
                title: 'Powered by USDT - Instant, global, stable.',
                description:
                    'Create a custom card that reflects your unique style and personality. Choose from a range of colors, patterns, and designs to customize the look of your card.',
                illustrationImage: AppImage.bitcoin,
                backgroundColor: AppColor.white,
                textColor: AppColor.black,
              ),
            ),
          ),
          
          // Second Card - Insured & Audited
          SizedBox(
            height: 500.0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FeatureCard(
                iconData: Icons.show_chart,
                title: 'Insured & Audited - Full transparency with live Proof-of-Reserves.',
                description:
                    'Track your sending patterns, analyze income or expenses easily, and receive personalized recommendations to optimize your financial habits.',
                illustrationImage: AppImage.bro,
                backgroundColor: AppColor.white,
                textColor: AppColor.black,
              ),
            ),
          ),
          
          // Third Card - AI-Driven Wealth
          SizedBox(
            height: 400.0,
            child: FeatureCard(
              iconData: Icons.autorenew,
              title: 'AI-Driven Wealth - Smarter yields, better trades, safer finance.',
              description:
                  'Create a custom card that reflects your unique style and personality. Choose from a range of colors, patterns, and designs to customize the look of your card.',
              illustrationImage: AppImage.bro,
              backgroundColor: AppColor.white,
              textColor: AppColor.black,
              isHorizontal: true,
            ),
          ),
        ],
      ),
    );
  }
}