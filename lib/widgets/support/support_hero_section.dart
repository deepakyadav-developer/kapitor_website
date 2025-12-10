import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// Support Hero Section
/// Shows "How can we help you?" with support illustration and contact options
class SupportHeroSection extends StatefulWidget {
  const SupportHeroSection({super.key});

  @override
  State<SupportHeroSection> createState() => _SupportHeroSectionState();
}

class _SupportHeroSectionState extends State<SupportHeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: Column(
        children: [
          // Top Section with title and images
          Container(
            width: double.infinity,
            color: const Color(0xFFE8F5F0),
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
              vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
            ),
            child: isMobile
                ? _buildMobileLayout()
                : _buildDesktopLayout(isDesktop, isTablet),
          ),
          // Bottom Contact Bar
          _buildContactBar(isDesktop, isTablet, isMobile),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [_buildLeftContent(false), Hbox(40), _buildRightContent(false)],
    );
  }

  Widget _buildDesktopLayout(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: _buildLeftContent(isDesktop)),
        Wbox(isDesktop ? 100 : 60),
        Expanded(flex: 1, child: _buildRightContent(isDesktop)),
      ],
    );
  }

  Widget _buildLeftContent(bool isLarge) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        AppText(
          'KAPITOR HELP CENTER',
          style: Ts.regular(
            size: isLarge ? 16 : 14,
            color: Colors.black.withValues(alpha: 0.6),
          ),
        ),
        Hbox(16),
        // Main Title
        AppText(
          'Your 24/7 Support\n& Guidance Hub',
          style: Ts.bold(
            size: isLarge ? 72 : 48,
            color: Colors.black,
          ).copyWith(height: 1.1),
        ),
        Hbox(16),
        // Subtitle
        AppText(
          'Reliable assistance, expert guidance, and intelligent support for every Kapitor user',
          style: Ts.regular(
            size: isLarge ? 18 : 16,
            color: Colors.black.withValues(alpha: 0.6),
          ).copyWith(height: 1.6),
        ),
      ],
    );
  }

  Widget _buildRightContent(bool isLarge) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Support illustration (laptop with person)
        Center(
          child: Image.asset(
            AppImage.support,
            height: isLarge ? 350 : 280,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: isLarge ? 350 : 280,
                width: isLarge ? 400 : 320,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.laptop_mac,
                      size: isLarge ? 100 : 80,
                      color: Colors.grey.shade400,
                    ),
                    Hbox(16),
                    Icon(
                      Icons.support_agent,
                      size: isLarge ? 60 : 50,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // Boost card on top right
        if (isLarge)
          Positioned(
            top: -20,
            right: -40,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeOut,
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, -10 * (1 - value)),
                  child: Transform.rotate(
                    angle: 0.1,
                    child: Image.asset(
                      AppImage.boostCard,
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.green.shade300,
                                Colors.green.shade600,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.green.withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.card_giftcard,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildContactBar(bool isDesktop, bool isTablet, bool isMobile) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 0 : 0,
      ),
      transform: Matrix4.translationValues(0, -40, 0),
      padding: EdgeInsets.all(isDesktop ? 40 : (isTablet ? 32 : 24)),
      decoration: BoxDecoration(
        color: const Color(0xFF4DB8A4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: isMobile
          ? _buildContactBarMobile()
          : _buildContactBarDesktop(isDesktop),
    );
  }

  Widget _buildContactBarDesktop(bool isLarge) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Still have questions?',
                style: Ts.bold(size: isLarge ? 20 : 18, color: Colors.white),
              ),
              Hbox(4),
              AppText(
                'We are here to help.',
                style: Ts.regular(
                  size: isLarge ? 14 : 13,
                  color: Colors.white.withValues(alpha: 0.8),
                ),
              ),
            ],
          ),
        ),
        Wbox(40),
        Expanded(
          flex: 2,
          child: _ContactItem(
            icon: FontAwesomeIcons.phone,
            title: '24/7 Live Chat',
            subtitle: 'Instant Support',
            isLarge: isLarge,
          ),
        ),
        Wbox(40),
        Expanded(
          flex: 2,
          child: _ContactItem(
            icon: FontAwesomeIcons.envelope,
            title: 'support@kapitor.com',
            subtitle: 'Email Support',
            isLarge: isLarge,
          ),
        ),
        Wbox(40),
        _ChatButton(isLarge: isLarge),
      ],
    );
  }

  Widget _buildContactBarMobile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Still have questions?',
          style: Ts.bold(size: 18, color: Colors.white),
        ),
        Hbox(4),
        AppText(
          'We are here to help.',
          style: Ts.regular(
            size: 13,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        Hbox(24),
        _ContactItem(
          icon: FontAwesomeIcons.phone,
          title: '24/7 Live Chat',
          subtitle: 'Instant Support',
          isLarge: false,
        ),
        Hbox(16),
        _ContactItem(
          icon: FontAwesomeIcons.envelope,
          title: 'support@kapitor.com',
          subtitle: 'Email Support',
          isLarge: false,
        ),
        Hbox(24),
        Center(child: _ChatButton(isLarge: false)),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isLarge;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isLarge,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(isLarge ? 12 : 10),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            shape: BoxShape.circle,
          ),
          child: FaIcon(icon, size: isLarge ? 20 : 18, color: Colors.white),
        ),
        Wbox(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title,
                style: Ts.bold(size: isLarge ? 16 : 14, color: Colors.white),
              ),
              Hbox(2),
              AppText(
                subtitle,
                style: Ts.regular(
                  size: isLarge ? 13 : 12,
                  color: Colors.white.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatButton extends StatefulWidget {
  final bool isLarge;

  const _ChatButton({required this.isLarge});

  @override
  State<_ChatButton> createState() => _ChatButtonState();
}

class _ChatButtonState extends State<_ChatButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          // TODO: Open chat
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isLarge ? 32 : 28,
            vertical: widget.isLarge ? 16 : 14,
          ),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.white : Colors.black,
            borderRadius: BorderRadius.circular(8),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: AppText(
            'Chat with KapAI',
            style: Ts.bold(
              size: widget.isLarge ? 15 : 14,
              color: _isHovered ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
