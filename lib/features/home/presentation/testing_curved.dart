import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("AnimatedContainer Demo")),
        body: Center(
          child: ClipPath(
            clipper: TopCircularCutClipper(),
            child: Container(
              width: size.width,
              height: size.height * .1,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class TopCircularCutClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double radius = 40.0; // Radius of the cut-out
    final centerX = (size.width + 300) / 2; // Center the curve horizontally

    path.moveTo(0, 0);
    path.lineTo(centerX - radius, 0);

    // // Draw the concave semicircle
    path.arcToPoint(
      Offset(centerX + radius, 0),
      radius: Radius.circular(radius),
      clockwise: false,
    );

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
