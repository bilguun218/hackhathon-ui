import 'package:flutter/material.dart';
import 'login_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF1FF), Color(0xFFDDE8FF)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const Spacer(flex: 3),
                Container(
                  width: 180,
                  height: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: CustomPaint(
                      size: const Size(110, 110),
                      painter: LogoPainter(),
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                const Text(
                  'AccessPlan UB',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0E1B33),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Өдөр тутмын ажлаа ухаалгаар төлөвлөж,\nшаардлагагүй зорчилтыг багасгана.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF6B7280),
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 5),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1B4DFF),
                    minimumSize: const Size(double.infinity, 56),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Эхлэх',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFF1B4DFF), width: 1.5),
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Нэвтрэх',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1B4DFF),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    paint.color = const Color(0xFF1B4DFF);
    paint.style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(size.width * 0.28, size.height * 0.32)
      ..cubicTo(
        size.width * 0.65, size.height * 0.30,
        size.width * 0.30, size.height * 0.65,
        size.width * 0.72, size.height * 0.66,
      );
    canvas.drawPath(path, paint);

    paint.style = PaintingStyle.fill;
    paint.color = const Color(0xFF1B4DFF);
    canvas.drawCircle(
      Offset(size.width * 0.28, size.height * 0.32),
      10,
      paint,
    );

    paint.color = const Color(0xFF22C55E);
    canvas.drawCircle(
      Offset(size.width * 0.72, size.height * 0.66),
      10,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
