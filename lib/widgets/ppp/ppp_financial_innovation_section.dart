import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

/// PPP Financial Innovation Section
class PppFinancialInnovationSection extends StatelessWidget {
  const PppFinancialInnovationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= 1024;
    final isTablet = screenWidth >= 768 && screenWidth < 1024;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      color: const Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 70 : 50),
      ),
      child: Column(
        children: [
          // Main Title
          AppText(
            'Unlock a World of Financial Innovation and\nPossibility',
            style: Ts.bold(
              size: isDesktop ? 42 : (isTablet ? 34 : 26),
              color: const Color(0xFF2C3E50),
            ),
            textAlign: TextAlign.center,
          ),
          Hbox(isDesktop ? 60 : (isTablet ? 50 : 40)),
          // Content
          isMobile
              ? _buildMobileLayout()
              : _buildDesktopLayout(isDesktop, isTablet),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: _buildLeftContent(isDesktop)),
        Wbox(isDesktop ? 60 : 40),
        Expanded(flex: 1, child: _buildRightContent(isDesktop)),
      ],
    );
  }

  Widget _buildLeftContent(bool isLarge) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 40 : 32),
      decoration: BoxDecoration(
        color: const Color(0xFFE8E8E8),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          AppText(
            'Starting Today with Our\nAdvanced Platform',
            style: Ts.bold(
              size: isLarge ? 24 : 20,
              color: const Color(0xFF2C3E50),
            ).copyWith(height: 1.3),
          ),
          Hbox(isLarge ? 16 : 12),
          // Description
          AppText(
            'Move beyond the traditional limitations of finance with a platform that empowers you to think bigger, plan smarter, and achieve more.',
            style: Ts.regular(
              size: isLarge ? 14 : 13,
              color: Colors.black.withValues(alpha: 0.6),
            ).copyWith(height: 1.6),
          ),
          Hbox(isLarge ? 40 : 32),
          // Cards Stack
          Center(child: _buildCardsStack(isLarge)),
        ],
      ),
    );
  }

  Widget _buildCardsStack(bool isLarge) {
    return SizedBox(
      width: isLarge ? 350 : 280,
      height: isLarge ? 280 : 220,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Back card (purple) - bottom left
          Positioned(
            left: 0,
            top: isLarge ? 80 : 60,
            child: Transform.rotate(
              angle: -0.15,
              child: _buildCardImage(
                imagePath: AppImage.group40,
                width: isLarge ? 240 : 190,
                height: isLarge ? 150 : 120,
              ),
            ),
          ),
          // Middle card (purple) - middle
          Positioned(
            left: isLarge ? 50 : 40,
            top: isLarge ? 40 : 30,
            child: Transform.rotate(
              angle: -0.08,
              child: _buildCardImage(
                imagePath: AppImage.group40,
                width: isLarge ? 240 : 190,
                height: isLarge ? 150 : 120,
              ),
            ),
          ),
          // Front card (dark) - top right
          Positioned(
            left: isLarge ? 100 : 80,
            top: 0,
            child: Transform.rotate(
              angle: -0.02,
              child: _buildCardImage(
                imagePath: AppImage.group38,
                width: isLarge ? 240 : 190,
                height: isLarge ? 150 : 120,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardImage({
    required String imagePath,
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF7B1FA2), Color(0xFF4A148C)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Icon(Icons.credit_card, color: Colors.white, size: 40),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRightContent(bool isLarge) {
    return Container(
      padding: EdgeInsets.all(isLarge ? 40 : 32),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
      ),
      child: Column(
        children: [
          // Title
          AppText(
            'Personalized Financial\nDashboard',
            style: Ts.bold(size: isLarge ? 28 : 22, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Hbox(isLarge ? 32 : 24),
          // Chart/Graph Image
          Container(
            padding: EdgeInsets.all(isLarge ? 24 : 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                AppImage.graph,
                width: double.infinity,
                height: isLarge ? 220 : 180,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: isLarge ? 220 : 180,
                    color: const Color(0xFF1A1A2E),
                    child: const Center(
                      child: Icon(
                        Icons.bar_chart,
                        size: 80,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Hbox(isLarge ? 24 : 20),
          // Description
          AppText(
            'Provides a customized view tailored\nto user needs',
            style: Ts.regular(
              size: isLarge ? 14 : 13,
              color: Colors.white.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          Hbox(isLarge ? 32 : 24),
          // Button
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: isLarge ? 40 : 32,
                vertical: isLarge ? 16 : 14,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppText(
                'Keep exploring',
                style: Ts.bold(size: isLarge ? 15 : 14, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
