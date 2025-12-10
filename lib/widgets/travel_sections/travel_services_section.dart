import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TravelServicesSection extends StatelessWidget {
  const TravelServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Services Label
          Text(
            'SERVICES',
            style: Ts.bold(
              size: 14,
              color: AppColor.primary,
            ).copyWith(letterSpacing: 2),
          ),

          Hbox(16),

          // Main Heading
          AppText(
            'FLIGHTS & HOTELS — Global Travel, Paid with USDT',
            style: Ts.bold(
              size: isDesktop ? 40 : (isTablet ? 32 : 24),
              color: Colors.black,
            ),
          ),

          Hbox(isDesktop ? 60 : 40),

          // Service Cards
          isMobile
              ? Column(
                  children: [
                    _ServiceCard(
                      iconPath: AppImage.flight,
                      title: 'Flights',
                      description:
                          'From flights, stays, to sights, just count on our complete products.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(24),
                    _ServiceCard(
                      iconPath: AppImage.hotels,
                      title: 'Hotels',
                      description:
                          'From flights, stays, to sights, just count on our complete products.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                    Hbox(24),
                    _ServiceCard(
                      iconPath: AppImage.securepayment,
                      title: 'Secure Payment',
                      description:
                          'From flights, stays, to sights, just count on our complete products.',
                      isDesktop: isDesktop,
                      isTablet: isTablet,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _ServiceCard(
                        iconPath: AppImage.flight,
                        title: 'Flights',
                        description:
                            'From flights, stays, to sights, just count on our complete products.',
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ),
                    Wbox(24),
                    Expanded(
                      child: _ServiceCard(
                        iconPath: AppImage.hotels,
                        title: 'Hotels',
                        description:
                            '3-star to 7-star hotels, resorts, homestays, apartments with global inventory, instant booking vouchers, and USDT-based payment.',
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ),
                    Wbox(24),
                    Expanded(
                      child: _ServiceCard(
                        iconPath: AppImage.securepayment,
                        title: 'USDT Payment',
                        description:
                            'No international card needed, no bank declines, no foreign exchange fees, no payment delays. Stablecoins as real-world travel currency.',
                        isDesktop: isDesktop,
                        isTablet: isTablet,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String iconPath;
  final String title;
  final String description;
  final bool isDesktop;
  final bool isTablet;

  const _ServiceCard({
    required this.iconPath,
    required this.title,
    required this.description,
    required this.isDesktop,
    required this.isTablet,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(_isHovered ? -0.05 : 0)
          ..translate(0.0, _isHovered ? -10.0 : 0.0, _isHovered ? 20.0 : 0.0),
        padding: EdgeInsets.all(widget.isDesktop ? 40 : 32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? Colors.black.withValues(alpha: 0.15)
                  : Colors.black.withValues(alpha: 0.05),
              blurRadius: _isHovered ? 30 : 10,
              offset: Offset(0, _isHovered ? 15 : 5),
              spreadRadius: _isHovered ? 5 : 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Icon Container
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(widget.isDesktop ? 30 : 24),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F9F3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                widget.iconPath,
                width: widget.isDesktop ? 64 : 56,
                height: widget.isDesktop ? 64 : 56,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image_not_supported,
                    size: widget.isDesktop ? 64 : 56,
                    color: AppColor.primary,
                  );
                },
              ),
            ),

            Hbox(widget.isDesktop ? 32 : 24),

            // Title
            AppText(
              widget.title,
              style: Ts.bold(
                size: widget.isDesktop ? 24 : 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),

            Hbox(16),

            // Description
            AppText(
              widget.description,
              style: Ts.regular(
                size: widget.isDesktop ? 16 : 14,
                color: Colors.black.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
