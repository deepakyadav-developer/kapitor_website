import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class KapAiToolsSection extends StatelessWidget {
  const KapAiToolsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 900;
    final isTablet = screenWidth >= 600 && screenWidth < 900;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            const Color(0xFFE8F9F3).withValues(alpha: 0.3),
            const Color(0xFFFFFBE6).withValues(alpha: 0.3),
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          // Heading
          AppText(
            'Discover the Tools that Drive Success',
            textAlign: TextAlign.center,
            style: Ts.bold(
              size: isDesktop ? 44 : (isTablet ? 36 : 28),
              color: Colors.black,
            ),
          ),

          Hbox(isDesktop ? 20 : 16),

          // Description
          SizedBox(
            width: isDesktop ? 650 : (isTablet ? 500 : double.infinity),
            child: AppText(
              'Unleash innovation and accelerate growth with our dynamic product.',
              textAlign: TextAlign.center,
              style: Ts.regular(
                size: isDesktop ? 16 : 15,
                color: Colors.black.withValues(alpha: 0.6),
              ),
            ),
          ),

          Hbox(isDesktop ? 60 : 40),

          // Dark container with cards
          Container(
            constraints: BoxConstraints(
              maxWidth: isDesktop ? 1200 : double.infinity,
            ),
            padding: EdgeInsets.all(isDesktop ? 60 : (isTablet ? 40 : 24)),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A1A),
              borderRadius: BorderRadius.circular(24),
            ),
            child: isMobile
                ? _buildMobileCards()
                : _buildDesktopCards(isDesktop, isTablet),
          ),

          Hbox(isDesktop ? 50 : 40),

          // Contact Us button
          _AnimatedContactButton(isDesktop: isDesktop),
        ],
      ),
    );
  }

  Widget _buildMobileCards() {
    return Column(
      children: [
        _ToolCard(
          icon: Icons.auto_awesome,
          title: 'Cutting-Edge\nInnovation',
          description:
              'Experience groundbreaking technological advancements that push the boundaries of what\'s possible, revolutionizing industries and transforming the way we live and work.',
          isMobile: true,
        ),
        Hbox(32),
        _ToolCard(
          icon: Icons.cloud_outlined,
          title: 'Seamless Connectivity',
          description:
              'Stay connected anytime, anywhere with our robust and reliable network infrastructure, ensuring uninterrupted communication and effortless access to the digital world.',
          isMobile: true,
        ),
        Hbox(32),
        _ToolCard(
          icon: Icons.dashboard_outlined,
          title: 'Intuitive User Interface',
          description:
              'Enjoy a seamless and intuitive user experience with our sleek and user-friendly interface, designed to simplify complex tasks and enhance productivity.',
          isMobile: true,
        ),
      ],
    );
  }

  Widget _buildDesktopCards(bool isDesktop, bool isTablet) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _ToolCard(
            icon: Icons.auto_awesome,
            title: 'Cutting-Edge\nInnovation',
            description:
                'Experience groundbreaking technological advancements that push the boundaries of what\'s possible, revolutionizing industries and transforming the way we live and work.',
            isMobile: false,
          ),
        ),
        // Divider
        Container(
          width: 1,
          height: isDesktop ? 280 : 240,
          margin: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 24),
          color: Colors.white.withValues(alpha: 0.1),
        ),
        Expanded(
          child: _ToolCard(
            icon: Icons.cloud_outlined,
            title: 'Seamless Connectivity',
            description:
                'Stay connected anytime, anywhere with our robust and reliable network infrastructure, ensuring uninterrupted communication and effortless access to the digital world.',
            isMobile: false,
          ),
        ),
        // Divider
        Container(
          width: 1,
          height: isDesktop ? 280 : 240,
          margin: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 24),
          color: Colors.white.withValues(alpha: 0.1),
        ),
        Expanded(
          child: _ToolCard(
            icon: Icons.dashboard_outlined,
            title: 'Intuitive User Interface',
            description:
                'Enjoy a seamless and intuitive user experience with our sleek and user-friendly interface, designed to simplify complex tasks and enhance productivity.',
            isMobile: false,
          ),
        ),
      ],
    );
  }
}

class _ToolCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isMobile;

  const _ToolCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  @override
  State<_ToolCard> createState() => _ToolCardState();
}

class _ToolCardState extends State<_ToolCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
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
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.all(widget.isMobile ? 16 : 20),
                  decoration: BoxDecoration(
                    color: _isHovered
                        ? const Color(0xFF7C4DFF)
                        : const Color(0xFF7C4DFF).withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: const Color(
                                0xFF7C4DFF,
                              ).withValues(alpha: 0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ]
                        : [],
                  ),
                  child: Icon(
                    widget.icon,
                    size: widget.isMobile ? 32 : 40,
                    color: Colors.white,
                  ),
                ),

                Hbox(widget.isMobile ? 24 : 32),

                // Title
                AppText(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: Ts.bold(
                    size: widget.isMobile ? 20 : 22,
                    color: Colors.white,
                  ),
                ),

                Hbox(16),

                // Description
                AppText(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: widget.isMobile ? 13 : 14,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _AnimatedContactButton extends StatefulWidget {
  final bool isDesktop;

  const _AnimatedContactButton({required this.isDesktop});

  @override
  State<_AnimatedContactButton> createState() => _AnimatedContactButtonState();
}

class _AnimatedContactButtonState extends State<_AnimatedContactButton>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.08,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 25,
                          offset: const Offset(0, 12),
                        ),
                      ]
                    : [],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.isDesktop ? 48 : 40,
                    vertical: widget.isDesktop ? 20 : 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 0,
                ),
                child: AppText(
                  'Contact Us',
                  style: Ts.bold(
                    size: widget.isDesktop ? 16 : 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
