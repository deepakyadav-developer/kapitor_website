import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/size.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        return Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF1C1C1C), // Dark charcoal/black background
          ),
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80.0 : (isTablet ? 40.0 : 24.0),
            vertical: isDesktop ? 60.0 : (isTablet ? 40.0 : 32.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section with Logo and Links
              isMobile
                  ? _buildMobileLayout()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Logo Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Kapitor',
                                  style: TextStyle(
                                    fontSize: isDesktop ? 24.0 : 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Wbox(4.0),
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF4CAF50), // Green dot
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const Spacer(),

                        // About Section
                        _buildLinkColumn(
                          title: 'Company',
                          links: [
                            'About Us',
                            'Compliance',
                            'Careers',
                            'Media/Press',
                          ],
                          isDesktop: isDesktop,
                        ),

                        Wbox(isDesktop ? 80.0 : 60.0),

                        // Resources Section
                        _buildLinkColumn(
                          title: 'Resources',
                          links: [
                            'API Documentation',
                            'Proof of Reserves',
                            'Transparency Reports',
                            'Insurance Coverage',
                            'Smart Contract Audits',
                            'Documentation',
                            'System Status',
                            'Guides',
                          ],
                          isDesktop: isDesktop,
                        ),

                        Wbox(isDesktop ? 80.0 : 60.0),

                        // Support Section
                        _buildLinkColumn(
                          title: 'Support',
                          links: [
                            'Help Center',
                            'FAQs',
                            'Live Chat',
                            'Submit a Ticket',
                            'Contact Support',
                          ],
                          isDesktop: isDesktop,
                        ),

                        Wbox(isDesktop ? 80.0 : 60.0),

                        // Legal Section
                        _buildLinkColumn(
                          title: 'Legal',
                          links: [
                            'Terms of Use',
                            'Privacy Policy',
                            'Risk Disclaimer',
                            'PPP Memorandum',
                            'Cookie Policy',
                            'KYC/AML Policy',
                            'Insurance Disclosures',
                          ],
                          isDesktop: isDesktop,
                        ),
                      ],
                    ),

              Hbox(isDesktop ? 60.0 : 40.0),

              // Divider
              Container(height: 1, color: Colors.white.withValues(alpha: 0.15)),

              Hbox(isDesktop ? 32.0 : 24.0),

              // Bottom Section with Copyright and Social Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Copyright
                  Expanded(
                    child: Text(
                      '© 2025 Kapitor. All rights reserved. Unauthorized use is prohibited.',
                      style: TextStyle(
                        fontSize: isDesktop ? 14.0 : 12.0,
                        color: Colors.white.withValues(alpha: 0.7),
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),

                  // Social Media Icons
                  if (!isMobile) ...[
                    _SocialMediaIcon(icon: Icons.work, url: ''), // LinkedIn
                    Wbox(16.0),
                    _SocialMediaIcon(icon: Icons.close, url: ''), // X/Twitter
                    Wbox(16.0),
                    _SocialMediaIcon(
                      icon: Icons.play_arrow,
                      url: '',
                    ), // YouTube
                    Wbox(16.0),
                    _SocialMediaIcon(icon: Icons.telegram, url: ''), // Telegram
                    Wbox(16.0),
                    _SocialMediaIcon(icon: Icons.gamepad, url: ''), // Discord
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLinkColumn({
    required String title,
    required List<String> links,
    required bool isDesktop,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isDesktop ? 17.0 : 15.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        Hbox(isDesktop ? 20.0 : 16.0),
        ...links.map(
          (link) => Padding(
            padding: EdgeInsets.only(bottom: isDesktop ? 12.0 : 10.0),
            child: _FooterLink(text: link),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo
        Row(
          children: [
            const Text(
              'Kapitor',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Wbox(4.0),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF4CAF50),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),

        Hbox(32.0),

        // Company
        _buildLinkColumn(
          title: 'Company',
          links: ['About Us', 'Compliance', 'Careers', 'Media/Press'],
          isDesktop: false,
        ),

        Hbox(24.0),

        // Resources
        _buildLinkColumn(
          title: 'Resources',
          links: [
            'API Documentation',
            'Documentation',
            'System Status',
            'Guides',
          ],
          isDesktop: false,
        ),

        Hbox(24.0),

        // Support
        _buildLinkColumn(
          title: 'Support',
          links: ['Help Center', 'FAQs', 'Live Chat', 'Contact Support'],
          isDesktop: false,
        ),

        Hbox(24.0),

        // Legal
        _buildLinkColumn(
          title: 'Legal',
          links: [
            'Terms of Use',
            'Privacy Policy',
            'Risk Disclaimer',
            'PPP Memorandum',
          ],
          isDesktop: false,
        ),

        Hbox(24.0),

        // Social Media
        Row(
          children: [
            _SocialMediaIcon(icon: Icons.work, url: ''), // LinkedIn
            Wbox(12.0),
            _SocialMediaIcon(icon: Icons.close, url: ''), // X/Twitter
            Wbox(12.0),
            _SocialMediaIcon(icon: Icons.play_arrow, url: ''), // YouTube
            Wbox(12.0),
            _SocialMediaIcon(icon: Icons.telegram, url: ''), // Telegram
            Wbox(12.0),
            _SocialMediaIcon(icon: Icons.gamepad, url: ''), // Discord
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String text;

  const _FooterLink({required this.text});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
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

  void _handleNavigation() {
    final text = widget.text;
    final context = this.context;

    // Navigation mapping
    final routes = {
      'About Us': '/about',
      'API Documentation': '/api',
      'Documentation': '/api',
      'FAQs': '/customer-care',
      'Contact Support': '/customer-care',
      'Live Chat': '/customer-care',
      'Submit a Ticket': '/ticket',
      'Help Center': '/support',
      'Terms of Use': '/terms',
      'Privacy Policy': '/terms',
      'Risk Disclaimer': '/terms',
      'PPP Memorandum': '/ppp',
      'Cookie Policy': '/terms',
      'KYC/AML Policy': '/terms',
      'Insurance Disclosures': '/insurance',
      'Insurance Coverage': '/insurance',
      'System Status': '/support',
      'Guides': '/support',
    };

    if (routes.containsKey(text)) {
      Navigator.pushNamed(context, routes[text]!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: _handleNavigation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            style: TextStyle(
              fontSize: 15.0,
              color: _isHovered
                  ? Colors.white
                  : Colors.white.withValues(alpha: 0.75),
              fontWeight: _isHovered ? FontWeight.w500 : FontWeight.w400,
              letterSpacing: 0.3,
            ),
            child: Text(widget.text),
          ),
        ),
      ),
    );
  }
}

class _SocialMediaIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialMediaIcon({required this.icon, required this.url});

  @override
  State<_SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<_SocialMediaIcon>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _rotateAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
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
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _controller.reverse();
      },
      child: GestureDetector(
        onTap: () {
          // Handle social media link navigation
          if (widget.url.isNotEmpty) {
            // Open URL in browser
          }
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Transform.rotate(
                angle: _rotateAnimation.value,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _isHovered
                        ? const Color(0xFF4CAF50).withValues(alpha: 0.2)
                        : Colors.transparent,
                    border: Border.all(
                      color: _isHovered
                          ? const Color(0xFF4CAF50)
                          : Colors.white.withValues(alpha: 0.6),
                      width: _isHovered ? 2.0 : 1.5,
                    ),
                    boxShadow: _isHovered
                        ? [
                            BoxShadow(
                              color: const Color(
                                0xFF4CAF50,
                              ).withValues(alpha: 0.3),
                              blurRadius: 12,
                              spreadRadius: 2,
                            ),
                          ]
                        : [],
                  ),
                  child: Icon(
                    widget.icon,
                    color: _isHovered
                        ? const Color(0xFF4CAF50)
                        : Colors.white.withValues(alpha: 0.75),
                    size: 20,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
