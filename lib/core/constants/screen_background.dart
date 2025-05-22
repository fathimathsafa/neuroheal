import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;

        return Stack(
          children: [
            // Top-left gradient (floating)
            Positioned(
              top: -screenHeight * 0.08,
              left: -screenWidth * 0.1,
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenWidth * 0.6,
                child: const CustomPaint(painter: FreeFlowGradientPainter()),
              ),
            ),

            // Bottom-right gradient (floating)
            Positioned(
              bottom: -screenHeight * 0.08,
              right: -screenWidth * 0.1,
              child: SizedBox(
                width: screenWidth * 0.6,
                height: screenWidth * 0.6,
                child: const CustomPaint(painter: FreeFlowGradientPainter()),
              ),
            ),

            // Main content
            Positioned.fill(child: child),
          ],
        );
      },
    );
  }
}

class FreeFlowGradientPainter extends CustomPainter {
  const FreeFlowGradientPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFF61CEFF).withOpacity(0.2)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    // Draw multiple blurred circles scattered in the canvas
    canvas.drawCircle(Offset(size.width * 0.3, size.height * 0.3), 60, paint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.5), 50, paint);
    canvas.drawCircle(Offset(size.width * 0.7, size.height * 0.2), 40, paint);
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.7), 70, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
