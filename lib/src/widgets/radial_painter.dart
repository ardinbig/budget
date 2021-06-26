import 'dart:math';

import 'package:flutter/material.dart';

class RadialPainter extends CustomPainter {
  RadialPainter({
    required this.backgroundColor,
    required this.lineColor,
    required this.percent,
    required this.width,
  });

  final Color? backgroundColor;
  final Color lineColor;
  final double percent;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundLine = Paint()
      ..color = backgroundColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Paint completeLine = Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double sweepAngle = 2 * pi * percent;

    canvas.drawCircle(center, radius, backgroundLine);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      completeLine,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
