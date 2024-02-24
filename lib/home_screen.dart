import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Shape'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomPaint(
          painter: MyShape(),
          child: Container(),
        ),
      ),
    );
  }
}

class MyShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final path = Path();

    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    paint.color = Colors.green;

    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.15,
      size.height * 0.7,
      size.width * 0.33,
      size.height * 0.9,
    );

    path.quadraticBezierTo(
      size.width * 0.4,
      size.height * 0.98,
      size.width * 0.5,
      size.height * 0.9,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width * 0.85,
      size.height * 0.6,
    );

    path.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.55,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.8);

    canvas.drawPath(path, paint);

    final paint1 = Paint();
    paint1.style = PaintingStyle.fill;
    paint1.color = Colors.amber;
    canvas.drawPath(path, paint1);

    // Draw a circle
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.2;
    canvas.drawCircle(center, radius, paint);

    // Draw a polygon
    final polygonPath = Path();
    polygonPath.moveTo(size.width * 0.1, size.height * 0.1);
    polygonPath.lineTo(size.width * 0.3, size.height * 0.1);
    polygonPath.lineTo(size.width * 0.4, size.height * 0.3);
    polygonPath.lineTo(size.width * 0.2, size.height * 0.5);
    polygonPath.close();
    canvas.drawPath(polygonPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
