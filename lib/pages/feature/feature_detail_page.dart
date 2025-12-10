import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';
import 'package:kapitor_website/widgets/footer/footer_widget.dart';
import 'package:kapitor_website/widgets/header/header_widget.dart';

class FeatureDetailPage extends StatefulWidget {
  final String title;
  final String description;
  final String imagePath;

  const FeatureDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  State<FeatureDetailPage> createState() => _FeatureDetailPageState();
}

class _FeatureDetailPageState extends State<FeatureDetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            _buildHeroSection(),
            _buildDetailsSection(),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
            vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColor.primary.withOpacity(0.05), Colors.white],
            ),
          ),
          child: Column(
            children: [
              AppText(
                widget.title,
                textAlign: TextAlign.center,
                style: Ts.bold(
                  size: isDesktop ? 56 : (isTablet ? 44 : 32),
                  color: Colors.black,
                ).copyWith(height: 1.2),
              ),
              Hbox(24),
              SizedBox(
                width: isDesktop ? 700 : double.infinity,
                child: AppText(
                  widget.description,
                  textAlign: TextAlign.center,
                  style: Ts.regular(
                    size: isDesktop ? 18 : 16,
                    color: Colors.black.withOpacity(0.7),
                  ).copyWith(height: 1.6),
                ),
              ),
              Hbox(isDesktop ? 60 : 40),
              Image.asset(
                widget.imagePath,
                height: isDesktop ? 500 : (isTablet ? 400 : 300),
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          AppText(
            'Key Features',
            style: Ts.bold(size: isDesktop ? 40 : 32, color: Colors.black),
          ),
          Hbox(isDesktop ? 60 : 40),
          _buildFeatureGrid(isDesktop, isTablet),
        ],
      ),
    );
  }

  Widget _buildFeatureGrid(bool isDesktop, bool isTablet) {
    final features = [
      {
        'icon': Icons.security,
        'title': 'Secure & Safe',
        'description': 'Bank-level security to protect your data',
      },
      {
        'icon': Icons.speed,
        'title': 'Fast Processing',
        'description': 'Lightning-fast transactions and transfers',
      },
      {
        'icon': Icons.support_agent,
        'title': '24/7 Support',
        'description': 'Round-the-clock customer support',
      },
      {
        'icon': Icons.phone_android,
        'title': 'Mobile First',
        'description': 'Optimized for mobile experience',
      },
    ];

    if (isDesktop || isTablet) {
      return Wrap(
        spacing: 24,
        runSpacing: 24,
        children: features
            .map(
              (feature) => SizedBox(
                width: isDesktop
                    ? (MediaQuery.of(context).size.width - 160 - 48) / 2
                    : (MediaQuery.of(context).size.width - 80 - 24) / 2,
                child: _FeatureCard(
                  icon: feature['icon'] as IconData,
                  title: feature['title'] as String,
                  description: feature['description'] as String,
                  isLarge: isDesktop,
                ),
              ),
            )
            .toList(),
      );
    }

    return Column(
      children: features
          .map(
            (feature) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _FeatureCard(
                icon: feature['icon'] as IconData,
                title: feature['title'] as String,
                description: feature['description'] as String,
                isLarge: false,
              ),
            ),
          )
          .toList(),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isLarge;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isLarge,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(widget.isLarge ? 32 : 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? AppColor.primary.withOpacity(0.5)
                : Colors.grey.shade200,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppColor.primary.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: Offset(0, _isHovered ? 10 : 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(widget.isLarge ? 16 : 14),
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                widget.icon,
                size: widget.isLarge ? 32 : 28,
                color: AppColor.primary,
              ),
            ),
            Hbox(20),
            AppText(
              widget.title,
              style: Ts.bold(
                size: widget.isLarge ? 22 : 20,
                color: Colors.black,
              ),
            ),
            Hbox(12),
            AppText(
              widget.description,
              style: Ts.regular(
                size: widget.isLarge ? 15 : 14,
                color: Colors.black.withOpacity(0.6),
              ).copyWith(height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
