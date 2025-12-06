import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_button.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: 16,
      ),
      decoration: const BoxDecoration(
        color: AppColor.white,
      ),
      child: isMobile ? _buildMobileHeader(context) : _buildDesktopHeader(context),
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Image.asset(
            AppImage.kapitorLogo,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        
        // Navigation Items
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _NavItem(
                text: 'Home',
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              const Wbox(24),
              _NavItem(
                text: 'About us',
                onTap: () {
                  Navigator.pushNamed(context, '/about');
                },
              ),
              const Wbox(24),
              _NavItemWithDropdown(text: 'Features', onTap: () {}),
              const Wbox(24),
              _NavItem(text: 'p2p', onTap: () {}),
              const Wbox(24),
              _NavItem(text: 'Security', onTap: () {}),
              const Wbox(24),
              _NavItem(text: 'Download', onTap: () {}),
              const Wbox(24),
              _NavItemWithDropdown(text: 'Legal', onTap: () {}),
              const Wbox(24),
              _NavItemWithDropdown(text: 'Help', onTap: () {}),
            ],
          ),
        ),
        
        // Download Button
        AppButton(
          text: 'Download the App',
          onPressed: () {},
          textColor: AppColor.primary,
          elevation: 0,
          isFullWidth: false,
          borderColor: AppColor.primary,
          bgColor: AppColor.white,
          borderWidth: 1,
          borderRadius: 40,
          horizontalPadding: 30,
          
          icon: Icons.apple,
          
          textStyle: Ts.semiBold16(color: AppColor.primary),
        ),
      ],
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Image.asset(
            AppImage.kapitorLogo,
            height: 32,
            fit: BoxFit.contain,
          ),
        ),
        
        // Menu Icon
        IconButton(
          icon: Image.asset(AppImage.menu,height: 30,width: 30),
          onPressed: () {
            
          },
        ),
      ],
    );
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({
    required this.text,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _shineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _animationController.reverse();
      },
   child:  GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: AnimatedBuilder(
            animation: _shineAnimation,
            builder: (context, child) {
              return Text(
                widget.text,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _isHovered 
                      ? AppColor.textcolor.withValues(alpha: 0.6)
                      : AppColor.textcolor.withValues(alpha: 1.0),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _NavItemWithDropdown extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItemWithDropdown({
    required this.text,
    required this.onTap,
  });

  @override
  State<_NavItemWithDropdown> createState() => _NavItemWithDropdownState();
}

class _NavItemWithDropdownState extends State<_NavItemWithDropdown> with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _shineAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _shineAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _animationController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _animationController.reverse();
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedBuilder(
                animation: _shineAnimation,
                builder: (context, child) {
                 
                  
                  return Text(
                    widget.text,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: _isHovered ? AppColor.textcolor.withValues(alpha: 0.6) : AppColor.textcolor.withValues(alpha: 1.0) ,
                      shadows: _isHovered
                          ? [
                              Shadow(
                                color: AppColor.textcolor.withValues(alpha: 0.3 * _shineAnimation.value),
                                blurRadius: 4 * _shineAnimation.value,
                              ),
                            ]
                          : null,
                    ),
                  );
                },
              ),
              const Wbox(4),
              AnimatedBuilder(
                animation: _shineAnimation,
                builder: (context, child) {
                  return Icon(
                    Icons.keyboard_arrow_down,
                    size: 16,
                    color: _isHovered
                        ? AppColor.textcolor.withValues(alpha: 0.6 + (_shineAnimation.value * 0.4))
                        : AppColor.textcolor,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

