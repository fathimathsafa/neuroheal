import 'package:flutter/material.dart';

// Reusable gradient background widget
class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Upper left free-flowing gradient shade
        const Positioned(
          top: -50,
          left: -50,
          child: SizedBox(
            width: 250,
            height: 250,
            child: CustomPaint(painter: FreeFlowGradientPainter()),
          ),
        ),
        // Bottom right free-flowing gradient shade
        const Positioned(
          bottom: -50,
          right: -50,
          child: SizedBox(
            width: 250,
            height: 250,
            child: CustomPaint(painter: FreeFlowGradientPainter()),
          ),
        ),

        // The main content over the gradient
        child,
      ],
    );
  }
}

class FreeFlowGradientPainter extends CustomPainter {
  const FreeFlowGradientPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color.fromARGB(255, 85, 231, 197).withOpacity(0.2)
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
