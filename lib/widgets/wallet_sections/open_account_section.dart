import 'package:flutter/material.dart';
import 'package:kapitor_website/core/constants/image_constants.dart';
import 'package:kapitor_website/core/utils/app_text.dart';
import 'package:kapitor_website/core/utils/size.dart';
import 'package:kapitor_website/core/utils/ts.dart';

class OpenAccountSection extends StatelessWidget {
  const OpenAccountSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 900;
        final isTablet = constraints.maxWidth >= 600 && constraints.maxWidth < 900;

        final horizontalPadding = isDesktop
            ? constraints.maxWidth * 0.08
            : (isTablet ? 24.0 : 16.0);

        return Stack(
          children: [
            // Main Content
            Container(
              width: double.infinity,
              color: const Color(0xFF26CE92),
              padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding,
                top: isDesktop ? 80.0 : (isTablet ? 60.0 : 40.0),
                bottom: isDesktop ? 120.0 : (isTablet ? 100.0 : 80.0),
              ),
              child: Column(
                children: [
                  // Title
                  AppText(
                    'Open Kapitor Account',
                    textAlign: TextAlign.center,
                    style: Ts.bold(
                      size: isDesktop ? 40.0 : (isTablet ? 32.0 : 28.0),
                      color: Colors.white,
                    ),
                  ),
                  
                  Hbox(isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0)),
                  
                  // Steps Image
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isDesktop ? 900.0 : (isTablet ? 700.0 : double.infinity),
                      ),
                      child: Image.asset(
                        AppImage.openaccount,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: isDesktop ? 300 : (isTablet ? 250 : 200),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: const Center(
                              child: Icon(Icons.account_circle, size: 80, color: Colors.white),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Decorative Circles
            Positioned(
              top: isDesktop ? 100 : (isTablet ? 80 : 60),
              right: isDesktop ? 50 : (isTablet ? 30 : 20),
              child: _DecorativeCircle(
                size: isDesktop ? 150.0 : (isTablet ? 120.0 : 100.0),
                opacity: 0.15,
              ),
            ),
            Positioned(
              top: isDesktop ? 200 : (isTablet ? 160 : 120),
              right: isDesktop ? 150 : (isTablet ? 100 : 60),
              child: _DecorativeCircle(
                size: isDesktop ? 80.0 : (isTablet ? 60.0 : 50.0),
                opacity: 0.2,
              ),
            ),
            Positioned(
              bottom: isDesktop ? 150 : (isTablet ? 120 : 100),
              left: isDesktop ? 40 : (isTablet ? 30 : 20),
              child: _DecorativeCircle(
                size: isDesktop ? 120.0 : (isTablet ? 100.0 : 80.0),
                opacity: 0.15,
              ),
            ),
            Positioned(
              bottom: isDesktop ? 200 : (isTablet ? 160 : 130),
              left: isDesktop ? 150 : (isTablet ? 120 : 80),
              child: _DecorativeCircle(
                size: isDesktop ? 60.0 : (isTablet ? 50.0 : 40.0),
                opacity: 0.25,
              ),
            ),
            
            // Wave Pattern at Bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: isDesktop ? 100.0 : (isTablet ? 80.0 : 60.0),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _DecorativeCircle extends StatelessWidget {
  final double size;
  final double opacity;

  const _DecorativeCircle({
    required this.size,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    
    // Start from bottom left
    path.lineTo(0, size.height);
    
    // Draw wave pattern
    var firstControlPoint = Offset(size.width / 4, size.height - 40);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );
    
    var secondControlPoint = Offset(size.width * 3 / 4, size.height);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );
    
    // Complete the path
    path.lineTo(size.width, 0);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
