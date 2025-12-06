import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/app_color.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({Key? key}) : super(key: key);

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  int _currentIndex = 0;
  final int _totalTestimonials = 5;

  void _previousTestimonial() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _totalTestimonials;
    });
  }

  void _nextTestimonial() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _totalTestimonials;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final isMobile = constraints.maxWidth < 600;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);
        final verticalPadding = isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0);

        if (isMobile) {
          return _buildMobileLayout(horizontalPadding, verticalPadding);
        }

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImage.about2),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Navigation Arrow
              _buildNavigationButton(
                icon: Icons.arrow_back,
                isActive: false,
                onTap: _previousTestimonial,
                isDesktop: isDesktop,
              ),
              
              Wbox(isDesktop ? 60.0 : 40.0),
              
              // Main Content
              Expanded(
                child: _buildTestimonialContent(isDesktop, isTablet),
              ),
              
              Wbox(isDesktop ? 60.0 : 40.0),
              
              // Right Navigation Arrow
              _buildNavigationButton(
                icon: Icons.arrow_forward,
                isActive: true,
                onTap: _nextTestimonial,
                isDesktop: isDesktop,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTestimonialContent(bool isDesktop, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Quote with stylized quotation marks
        Stack(
          children: [
            // Large quotation marks in background
            Positioned(
              left: -20,
              top: -20,
              child: Text(
                '"',
                style: TextStyle(
                  fontSize: isDesktop ? 120.0 : (isTablet ? 100.0 : 80.0),
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.shade300,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              right: -20,
              bottom: -40,
              child: Text(
                '"',
                style: TextStyle(
                  fontSize: isDesktop ? 120.0 : (isTablet ? 100.0 : 80.0),
                  fontWeight: FontWeight.w300,
                  color: Colors.grey.shade300,
                  height: 1,
                ),
              ),
            ),
            // Quote text
            Padding(
              padding: EdgeInsets.only(
                left: isDesktop ? 40.0 : 30.0,
                right: isDesktop ? 40.0 : 30.0,
                top: isDesktop ? 20.0 : 15.0,
                bottom: isDesktop ? 20.0 : 15.0,
              ),
              child: AppText(
                'They Meticulously Analyze Our Industry And Target Audience, Enabling Them To Craft Tailored Campaigns That Efficiently Reach And Captivate Our Customers. Their Innovative Ideas And Advanced Techniques Have Kept Us Leading The Pack In The Competitive Landscape.',
                style: Ts.regular(
                  size: isDesktop ? 20.0 : (isTablet ? 18.0 : 16.0),
                  color: AppColor.textcolor,
                ),
              ),
            ),
          ],
        ),
        
        Hbox(isDesktop ? 40.0 : 32.0),
        
        // Profile and Attribution
        Row(
          children: [
            // Profile Picture Placeholder
            Container(
              width: isDesktop ? 60.0 : 50.0,
              height: isDesktop ? 60.0 : 50.0,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
            
            Wbox(isDesktop ? 20.0 : 16.0),
            
            // Name and Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Michael Kaizer',
                  style: Ts.bold(
                    size: isDesktop ? 18.0 : 16.0,
                    color: AppColor.textcolor,
                  ),
                ),
                Hbox(4.0),
                AppText(
                  'CEO of Basecamp Corp',
                  style: Ts.regular(
                    size: isDesktop ? 14.0 : 12.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            
            const Spacer(),
            
            // Page Indicator
            Row(
              children: [
                AppText(
                  '${(_currentIndex + 1).toString().padLeft(2, '0')}',
                  style: Ts.bold(
                    size: isDesktop ? 18.0 : 16.0,
                    color: AppColor.textcolor,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
                AppText(
                  '/${_totalTestimonials.toString().padLeft(2, '0')}',
                  style: Ts.regular(
                    size: isDesktop ? 18.0 : 16.0,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNavigationButton({
    required IconData icon,
    required bool isActive,
    required VoidCallback onTap,
    required bool isDesktop,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isDesktop ? 56.0 : 48.0,
        height: isDesktop ? 56.0 : 48.0,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2C2C2C) : Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          color: isActive ? Colors.white : Colors.black,
          size: isDesktop ? 24.0 : 20.0,
        ),
      ),
    );
  }

  Widget _buildMobileLayout(double horizontalPadding, double verticalPadding) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImage.about2),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          // Quote with stylized quotation marks
          Stack(
            children: [
              // Large quotation marks in background
              Positioned(
                left: -10,
                top: -10,
                child: Text(
                  '"',
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                right: -10,
                bottom: -30,
                child: Text(
                  '"',
                  style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade300,
                    height: 1,
                  ),
                ),
              ),
              // Quote text
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  top: 15.0,
                  bottom: 15.0,
                ),
                child: AppText(
                  'They Meticulously Analyze Our Industry And Target Audience, Enabling Them To Craft Tailored Campaigns That Efficiently Reach And Captivate Our Customers. Their Innovative Ideas And Advanced Techniques Have Kept Us Leading The Pack In The Competitive Landscape.',
                  style: Ts.regular(
                    size: 16.0,
                    color: AppColor.textcolor,
                  ),
                ),
              ),
            ],
          ),
          
          Hbox(32.0),
          
          // Profile and Attribution
          Row(
            children: [
              // Profile Picture Placeholder
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
              ),
              
              Wbox(16.0),
              
              // Name and Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Michael Kaizer',
                      style: Ts.bold(
                        size: 16.0,
                        color: AppColor.textcolor,
                      ),
                    ),
                    Hbox(4.0),
                    AppText(
                      'CEO of Basecamp Corp',
                      style: Ts.regular(
                        size: 12.0,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              
              // Page Indicator
              Row(
                children: [
                  AppText(
                    '${(_currentIndex + 1).toString().padLeft(2, '0')}',
                    style: Ts.bold(
                      size: 16.0,
                      color: AppColor.textcolor,
                    ),
                  ),
                  AppText(
                    '/${_totalTestimonials.toString().padLeft(2, '0')}',
                    style: Ts.regular(
                      size: 16.0,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          Hbox(32.0),
          
          // Navigation Arrows
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNavigationButton(
                icon: Icons.arrow_back,
                isActive: false,
                onTap: _previousTestimonial,
                isDesktop: false,
              ),
              Wbox(24.0),
              _buildNavigationButton(
                icon: Icons.arrow_forward,
                isActive: true,
                onTap: _nextTestimonial,
                isDesktop: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

