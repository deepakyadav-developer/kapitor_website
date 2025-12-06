import 'package:flutter/material.dart';
import 'package:kapitor_website/core/utils/size.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
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
                        
                        // Navigation Section
                        _buildLinkColumn(
                          title: 'Navigation',
                          links: ['Home', 'Blog', 'Health benefits', 'FAQs'],
                          isDesktop: isDesktop,
                        ),
                        
                        Wbox(isDesktop ? 60.0 : 40.0),
                        
                        // Explore pumpkins Section
                        _buildLinkColumn(
                          title: 'Explore pumpkins',
                          links: ['Pumpkin visions', 'Pumpkin lore', 'Recipes', 'Retailers'],
                          isDesktop: isDesktop,
                        ),
                        
                        Wbox(isDesktop ? 60.0 : 40.0),
                        
                        // Legal Section
                        _buildLinkColumn(
                          title: 'Legal',
                          links: ['Privacy policy', 'Contact', 'Help', 'Retailers'],
                          isDesktop: isDesktop,
                        ),
                        
                        Wbox(isDesktop ? 60.0 : 40.0),
                        
                        // Follow us Section
                        _buildSocialMediaColumn(isDesktop),
                      ],
                    ),
              
              Hbox(isDesktop ? 60.0 : 40.0),
              
              // Large Kapitor Logo at Bottom
              Center(
                child: Text(
                  'Kapitor',
                  style: TextStyle(
                    fontSize: isDesktop ? 120.0 : (isTablet ? 80.0 : 60.0),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
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
            fontSize: isDesktop ? 16.0 : 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Hbox(isDesktop ? 20.0 : 16.0),
        ...links.map((link) => Padding(
              padding: EdgeInsets.only(bottom: isDesktop ? 12.0 : 10.0),
              child: _FooterLink(text: link),
            )),
      ],
    );
  }

  Widget _buildSocialMediaColumn(bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Follow us on:',
          style: TextStyle(
            fontSize: isDesktop ? 16.0 : 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Hbox(isDesktop ? 20.0 : 16.0),
        Row(
          children: [
            _SocialMediaIcon(icon: Icons.facebook, url: ''),
            Wbox(12.0),
            _SocialMediaIcon(icon: Icons.camera_alt, url: ''), // Instagram
            Wbox(12.0),
            _SocialMediaIcon(icon: Icons.bookmark, url: ''), // Pinterest
            Wbox(12.0),
            _SocialMediaIcon(icon: Icons.work, url: ''), // LinkedIn
          ],
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
            Text(
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
        
        // Navigation
        _buildLinkColumn(
          title: 'Navigation',
          links: ['Home', 'Blog', 'Health benefits', 'FAQs'],
          isDesktop: false,
        ),
        
        Hbox(24.0),
        
        // Explore pumpkins
        _buildLinkColumn(
          title: 'Explore pumpkins',
          links: ['Pumpkin visions', 'Pumpkin lore', 'Recipes', 'Retailers'],
          isDesktop: false,
        ),
        
        Hbox(24.0),
        
        // Legal
        _buildLinkColumn(
          title: 'Legal',
          links: ['Privacy policy', 'Contact', 'Help', 'Retailers'],
          isDesktop: false,
        ),
        
        Hbox(24.0),
        
        // Follow us
        _buildSocialMediaColumn(false),
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

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 14.0,
            color: _isHovered ? const Color(0xFF4CAF50) : Colors.white,
            fontWeight: FontWeight.normal,
          ),
          child: Text(widget.text),
        ),
      ),
    );
  }
}

class _SocialMediaIcon extends StatefulWidget {
  final IconData icon;
  final String url;

  const _SocialMediaIcon({
    required this.icon,
    required this.url,
  });

  @override
  State<_SocialMediaIcon> createState() => _SocialMediaIconState();
}

class _SocialMediaIconState extends State<_SocialMediaIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? const Color(0xFF4CAF50) : Colors.white,
              width: 1.5,
            ),
          ),
          child: Icon(
            widget.icon,
            color: _isHovered ? const Color(0xFF4CAF50) : Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

