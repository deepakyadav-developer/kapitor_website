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
      decoration: const BoxDecoration(color: AppColor.white),
      child: isMobile
          ? _buildMobileHeader(context)
          : _buildDesktopHeader(context),
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
              _NavItemWithDropdown(
                text: 'Features',
                onTextTap: () {
                  Navigator.pushNamed(context, '/feature-showcase');
                },
                items: const [
                  DropdownItemData(title: 'Wallet', route: '/wallet'),
                  DropdownItemData(title: 'Payments', route: '/payment'),
                  DropdownItemData(title: 'Trading', route: '/trading'),
                  DropdownItemData(title: 'Kap vault', route: '/'),
                  DropdownItemData(title: 'kap trade', route: '/'),
                  DropdownItemData(
                    title: 'Tokenized asset',
                    route: '/tokenized',
                  ),
                  DropdownItemData(title: 'Kapsure', route: '/insurance'),
                  DropdownItemData(
                    title: 'Travel & recharge',
                    route: '/travel',
                  ),
                  DropdownItemData(title: 'Kap Ai', route: '/kapai'),
                ],
              ),
              const Wbox(24),
              _NavItem(
                text: 'PPP',
                onTap: () {
                  Navigator.pushNamed(context, '/ppp');
                },
              ),
              const Wbox(24),
              _NavItem(
                text: 'Security',
                onTap: () {
                  Navigator.pushNamed(context, '/security');
                },
              ),
              const Wbox(24),
              _NavItem(text: 'Download', onTap: () {}),
              const Wbox(24),
              _NavItemWithDropdown(
                text: 'Legal',
                items: const [
                  DropdownItemData(title: 'Terms of use', route: '/'),
                  DropdownItemData(title: 'privacy policy', route: '/'),
                  DropdownItemData(title: 'risk disclaimer', route: '/'),
                  DropdownItemData(title: 'PPP memorandum', route: '/ppp'),
                  DropdownItemData(title: 'KYC AML', route: '/'),
                  DropdownItemData(title: 'Cookie policy', route: '/'),
                  DropdownItemData(title: 'Insurance disclosure', route: '/'),
                ],
              ),
              const Wbox(24),
              _NavItemWithDropdown(
                text: 'Help',
                items: const [
                  DropdownItemData(title: 'Support', route: '/support'),
                  DropdownItemData(
                    title: 'Customer Care & FAQ',
                    route: '/customer-care',
                  ),
                  DropdownItemData(title: 'API Documentation', route: '/api'),
                  DropdownItemData(title: 'AI chat', route: '/'),
                  DropdownItemData(title: 'Tickets', route: '/'),
                  DropdownItemData(title: 'Guides', route: '/'),
                  DropdownItemData(title: 'System status', route: '/'),
                ],
              ),
            ],
          ),
        ),

        // Download Button
        AppButton(
          text: 'Download the App',
          onPressed: () {
            Navigator.pushNamed(context, '/payment');
          },
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
          icon: Image.asset(AppImage.menu, height: 30, width: 30),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  static Widget buildMobileDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: AppColor.white,
          child: Column(
            children: [
              // Drawer Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImage.kapitorLogo,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 28),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),

              // Navigation Items
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _DrawerItem(
                      text: 'Home',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                    _DrawerItem(
                      text: 'About us',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/about');
                      },
                    ),
                    _DrawerExpansionItem(
                      text: 'Features',
                      onTitleTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/feature-showcase');
                      },
                      items: const [
                        DropdownItemData(title: 'Wallet', route: '/wallet'),
                        DropdownItemData(title: 'Payments', route: '/payment'),
                        DropdownItemData(title: 'Trading', route: '/trading'),
                        DropdownItemData(title: 'Kap vault', route: '/'),
                        DropdownItemData(title: 'kap trade', route: '/'),
                        DropdownItemData(
                          title: 'Tokenized asset',
                          route: '/tokenized',
                        ),
                        DropdownItemData(title: 'Kapsure', route: '/insurance'),
                        DropdownItemData(
                          title: 'Travel & recharge',
                          route: '/travel',
                        ),
                        DropdownItemData(title: 'Kap Ai', route: '/kapai'),
                      ],
                    ),
                    _DrawerItem(
                      text: 'Wallet',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/wallet');
                      },
                    ),
                    _DrawerItem(
                      text: 'Security',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/security');
                      },
                    ),
                    _DrawerItem(
                      text: 'PPP',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/ppp');
                      },
                    ),
                    _DrawerItem(
                      text: 'Download',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    _DrawerExpansionItem(
                      text: 'Legal',
                      items: const [
                        DropdownItemData(title: 'Terms of use', route: '/'),
                        DropdownItemData(title: 'privacy policy', route: '/'),
                        DropdownItemData(title: 'risk disclaimer', route: '/'),
                        DropdownItemData(
                          title: 'PPP memorandum',
                          route: '/ppp',
                        ),
                        DropdownItemData(title: 'KYC AML', route: '/'),
                        DropdownItemData(title: 'Cookie policy', route: '/'),
                        DropdownItemData(
                          title: 'Insurance disclosure',
                          route: '/',
                        ),
                      ],
                    ),
                    _DrawerExpansionItem(
                      text: 'Help',
                      items: const [
                        DropdownItemData(title: 'Support', route: '/support'),
                        DropdownItemData(
                          title: 'Customer Care & FAQ',
                          route: '/customer-care',
                        ),
                        DropdownItemData(title: 'AI chat', route: '/'),
                        DropdownItemData(title: 'Tickets', route: '/'),
                        DropdownItemData(title: 'Guides', route: '/'),
                        DropdownItemData(title: 'System status', route: '/'),
                      ],
                    ),
                  ],
                ),
              ),

              // Download Button at Bottom
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade200, width: 1),
                  ),
                ),
                child: AppButton(
                  text: 'Download the App',
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/payment');
                  },
                  textColor: AppColor.primary,
                  elevation: 0,
                  isFullWidth: true,
                  borderColor: AppColor.primary,
                  bgColor: AppColor.white,
                  borderWidth: 1,
                  borderRadius: 40,
                  horizontalPadding: 30,
                  icon: Icons.apple,
                  textStyle: Ts.semiBold16(color: AppColor.primary),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _DrawerItem({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.textcolor,
          ),
        ),
      ),
    );
  }
}

class _DrawerExpansionItem extends StatelessWidget {
  final String text;
  final List<DropdownItemData> items;
  final VoidCallback? onTitleTap;

  const _DrawerExpansionItem({
    required this.text,
    required this.items,
    this.onTitleTap,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      childrenPadding: EdgeInsets.zero,
      title: GestureDetector(
        onTap: onTitleTap,
        child: Text(
          text,
          style: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.textcolor,
          ),
        ),
      ),
      children: items.map((item) {
        return InkWell(
          onTap: () {
            Navigator.pop(context);
            if (item.route.isNotEmpty) {
              Navigator.pushNamed(context, item.route);
            }
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
            child: Text(
              item.title,
              style: GoogleFonts.nunito(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.textcolor.withValues(alpha: 0.8),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const _NavItem({required this.text, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem>
    with SingleTickerProviderStateMixin {
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
          child: AnimatedBuilder(
            animation: _shineAnimation,
            builder: (context, child) {
              return Text(
                widget.text,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.lerp(
                    AppColor.textcolor,
                    AppColor.primary,
                    _shineAnimation.value * 0.7,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Professional dropdown menu item with hover effect
class _DropdownMenuItem extends StatefulWidget {
  final String title;
  final bool isLast;
  final VoidCallback onTap;

  const _DropdownMenuItem({
    required this.title,
    required this.isLast,
    required this.onTap,
  });

  @override
  State<_DropdownMenuItem> createState() => _DropdownMenuItemState();
}

class _DropdownMenuItemState extends State<_DropdownMenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColor.primary.withValues(alpha: 0.08)
                : Colors.transparent,
            border: widget.isLast
                ? null
                : Border(
                    bottom: BorderSide(color: Colors.grey.shade100, width: 1),
                  ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
                    color: _isHovered
                        ? AppColor.primary
                        : AppColor.textcolor.withValues(alpha: 0.85),
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              if (_isHovered)
                Icon(Icons.arrow_forward, size: 16, color: AppColor.primary),
            ],
          ),
        ),
      ),
    );
  }
}

class DropdownItemData {
  final String title;
  final String route;

  const DropdownItemData({required this.title, required this.route});
}

class _NavItemWithDropdown extends StatefulWidget {
  final String text;
  final List<DropdownItemData> items;
  final VoidCallback? onTextTap;

  const _NavItemWithDropdown({
    required this.text,
    required this.items,
    this.onTextTap,
  });

  @override
  State<_NavItemWithDropdown> createState() => _NavItemWithDropdownState();
}

class _NavItemWithDropdownState extends State<_NavItemWithDropdown>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isDropdownOpen = false;
  late AnimationController _animationController;
  late Animation<double> _shineAnimation;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

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
    _removeOverlay();
    _animationController.dispose();
    super.dispose();
  }

  void _showDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isDropdownOpen = true);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() => _isDropdownOpen = false);
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => Positioned(
        width: 220,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: const Offset(-10, 45),
          child: MouseRegion(
            onEnter: (_) {
              // Keep dropdown open when mouse enters
            },
            onExit: (_) {
              // Close dropdown when mouse exits
              _removeOverlay();
              setState(() => _isHovered = false);
              _animationController.reverse();
            },
            child: Material(
              elevation: 0,
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: widget.items.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final isLast = index == widget.items.length - 1;

                      return _DropdownMenuItem(
                        title: item.title,
                        isLast: isLast,
                        onTap: () {
                          _removeOverlay();
                          if (item.route.isNotEmpty) {
                            Navigator.pushNamed(context, item.route);
                          }
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        onEnter: (_) {
          setState(() => _isHovered = true);
          _animationController.forward();
          if (!_isDropdownOpen) {
            _showDropdown();
          }
        },
        onExit: (_) {
          // Don't close immediately, let the dropdown's MouseRegion handle it
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: widget.onTextTap,
                child: AnimatedBuilder(
                  animation: _shineAnimation,
                  builder: (context, child) {
                    return Text(
                      widget.text,
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.lerp(
                          AppColor.textcolor,
                          AppColor.primary,
                          _shineAnimation.value * 0.7,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Wbox(4),
              GestureDetector(
                onTap: () {
                  if (_isDropdownOpen) {
                    _removeOverlay();
                  } else {
                    _showDropdown();
                  }
                },
                child: AnimatedBuilder(
                  animation: _shineAnimation,
                  builder: (context, child) {
                    return Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: _isHovered
                          ? AppColor.textcolor.withValues(
                              alpha: 0.6 + (_shineAnimation.value * 0.4),
                            )
                          : AppColor.textcolor,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
