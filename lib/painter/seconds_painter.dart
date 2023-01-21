import 'dart:math';

import 'package:flutter/material.dart';

const int arms = 60;
final int quarters = (arms / 12).floor();

class SecondsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var cx = size.width / 2;
    var cy = size.height / 2;
    var radius = min(size.width / 2, size.height / 2);
    var circleRaidus = radius * .012;

    var paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = circleRaidus * .5
      ..color = Colors.white;

    for (var i = 1; i <= arms; i++) {
      var angle = i * 360 / arms;
      var a = -angle * pi / 180;
      var point = Offset(cx + radius * cos(a), cy + radius * sin(a));

      if (i % quarters == 0) {
        canvas.drawCircle(
          point,
          circleRaidus * 2,
          paint
            ..color = Colors.white
            ..style = PaintingStyle.fill,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
