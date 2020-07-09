import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          color: Color(0xff615AAB),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
            bottomRight: Radius.circular(70),
          )),
    );
  }
}

// class HeaderWave extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       child: CustomPaint(
//         painter: _HeaderWavePainter(),
//       ),
//     );
//   }
// }

class HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = new Paint();

    lapiz.color = Color(0xFF90CAF9);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;

    final path = new Path();

    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.85, size.width * 0.60, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.80, size.height * 0.70, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
