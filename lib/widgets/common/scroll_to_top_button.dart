import 'package:flutter/material.dart';
import 'dart:math' as math;

/// Floating Scroll to Top Button with Circular Progress Indicator
///
/// Features:
/// - Appears after scrolling down
/// - Shows circular progress based on scroll position
/// - Smooth scroll to top on tap
/// - Stays at bottom-right corner
/// - Animated and responsive
///
/// Usage:
/// ```dart
/// ScrollToTopButton(
///   scrollController: _scrollController,
/// )
/// ```
class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;
  final double showAfterScroll;
  final Color? progressColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double bottomOffset;
  final double rightOffset;

  const ScrollToTopButton({
    super.key,
    required this.scrollController,
    this.showAfterScroll = 200,
    this.progressColor,
    this.backgroundColor,
    this.iconColor,
    this.size = 56,
    this.bottomOffset = 24,
    this.rightOffset = 24,
  });

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  double _scrollProgress = 0.0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    _animationController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    final maxScroll = widget.scrollController.position.maxScrollExtent;

    // Calculate scroll progress (0.0 to 1.0)
    final progress = maxScroll > 0
        ? (scrollOffset / maxScroll).clamp(0.0, 1.0)
        : 0.0;

    // Show button after scrolling past threshold
    final shouldShow = scrollOffset > widget.showAfterScroll;

    if (shouldShow != _isVisible) {
      setState(() {
        _isVisible = shouldShow;
      });

      if (shouldShow) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }

    if (_scrollProgress != progress) {
      setState(() {
        _scrollProgress = progress;
      });
    }
  }

  void _scrollToTop() {
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressColor = widget.progressColor ?? theme.primaryColor;
    final backgroundColor = widget.backgroundColor ?? Colors.white;
    final iconColor = widget.iconColor ?? theme.primaryColor;

    return Positioned(
      bottom: widget.bottomOffset,
      right: widget.rightOffset,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTap: _scrollToTop,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular Progress Indicator
                  CustomPaint(
                    size: Size(widget.size, widget.size),
                    painter: _CircularProgressPainter(
                      progress: _scrollProgress,
                      progressColor: progressColor,
                      strokeWidth: 3.5,
                    ),
                  ),

                  // Arrow Up Icon
                  Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: iconColor,
                    size: widget.size * 0.5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom Painter for Circular Progress Indicator
class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final double strokeWidth;

  _CircularProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle (light gray)
    final backgroundPaint = Paint()
      ..color = Colors.grey.withValues(alpha: 0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress circle
    if (progress > 0) {
      final progressPaint = Paint()
        ..color = progressColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      // Draw arc from top (-90 degrees) clockwise
      final sweepAngle = 2 * math.pi * progress;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2, // Start from top
        sweepAngle,
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.progressColor != progressColor;
  }
}
