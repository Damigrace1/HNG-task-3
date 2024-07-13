import 'package:flutter/material.dart';
import 'package:timbu_shop2/utils/colors.dart';


class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color =AppColors.black.withOpacity(0.5)
      ..strokeWidth = 1.0;

    double dashWidth = 5.0;
    double dashSpace = 5.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
