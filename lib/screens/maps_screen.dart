import 'package:flutter/material.dart';

const _kPrimary = Color(0xFF1B4DFF);
const _kInk = Color(0xFF0E1B33);
const _kMuted = Color(0xFF8A93A6);

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Map (background)
        Positioned.fill(
          child: CustomPaint(painter: _MapPainter()),
        ),
        // Search bar
        Positioned(
          top: 12,
          left: 16,
          right: 16,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.06),
                        blurRadius: 12,
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Газар эсвэл ажил хайх...',
                      hintStyle: const TextStyle(color: Color(0xFFB7BECB)),
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search,
                          color: Color(0xFFB7BECB)),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: _kPrimary,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 26),
              ),
            ],
          ),
        ),
        // Bottom sheet
        DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.25,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(28)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 20,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: ListView(
                controller: scrollController,
                padding: EdgeInsets.zero,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 14),
                      width: 44,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Өнөөдрийн маршрут',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _kInk)),
                        Icon(Icons.keyboard_arrow_up,
                            color: _kMuted, size: 24),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 16),
                    child: Text('4 ажил  ·  42 мин  ·  5.8',
                        style: TextStyle(fontSize: 13, color: _kMuted)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _completedRow('Кофе авах'),
                  ),
                  const SizedBox(height: 12),
                  _stopCard(
                    2,
                    const Color(0xFFFF8A1A),
                    Icons.medication_outlined,
                    'Эмийн сан орох',
                    'Баянзүрх дүүрэг, 3-р хороо',
                    '1.2 км',
                    '8 мин',
                  ),
                  const SizedBox(height: 12),
                  _stopCard(
                    3,
                    const Color(0xFF8A93A6),
                    Icons.description_outlined,
                    'Баримт бичиг хүргэх',
                    'Чингэлтэй дүүрэг, 2-р хороо',
                    '2.1 км',
                    '12 мин',
                  ),
                  const SizedBox(height: 12),
                  _stopCard(
                    4,
                    const Color(0xFF8A93A6),
                    Icons.shopping_cart_outlined,
                    'Супермаркетаас хүнс',
                    'Баянгол дүүрэг, 6-р хороо',
                    '3.0 км',
                    '15 мин',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _completedRow(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDF0F4)),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE6F7EC),
            ),
            child: const Icon(Icons.check_circle,
                color: Color(0xFF22C55E), size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(title,
                style: const TextStyle(
                    fontSize: 15,
                    color: _kMuted,
                    fontWeight: FontWeight.w500)),
          ),
          const Text('Дууссан',
              style: TextStyle(fontSize: 13, color: _kMuted)),
        ],
      ),
    );
  }

  Widget _stopCard(
    int n,
    Color numColor,
    IconData icon,
    String title,
    String address,
    String distance,
    String time,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEDF0F4)),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: numColor,
                  ),
                  child: Center(
                    child: Text('$n',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F3F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: _kMuted, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(title,
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: _kInk)),
                          ),
                          const Icon(Icons.edit_outlined,
                              color: _kMuted, size: 16),
                          const SizedBox(width: 8),
                          const Icon(Icons.bookmark_outline,
                              color: _kMuted, size: 18),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.location_on,
                              color: _kMuted, size: 14),
                          const SizedBox(width: 4),
                          Text(address,
                              style: const TextStyle(
                                  fontSize: 12, color: _kMuted)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 84),
                Text('$distance · $time',
                    style: const TextStyle(fontSize: 12, color: _kMuted)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: const Text('Дуусгах',
                      style: TextStyle(
                          fontSize: 13,
                          color: _kInk,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFF1F3F7);
    canvas.drawRect(Offset.zero & size, paint);

    // Grid
    paint.color = const Color(0xFFE5E7EB);
    paint.strokeWidth = 1;
    for (double x = 0; x < size.width; x += 80) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += 80) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Route
    final routePaint = Paint()
      ..color = const Color(0xFF8FB3FF)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final p1 = Offset(size.width * 0.32, size.height * 0.18);
    final p2 = Offset(size.width * 0.78, size.height * 0.22);
    final p3 = Offset(size.width * 0.18, size.height * 0.5);
    final p4 = Offset(size.width * 0.55, size.height * 0.58);
    final p5 = Offset(size.width * 0.82, size.height * 0.7);

    canvas.drawLine(p1, p2, routePaint);
    canvas.drawLine(p1, p3, routePaint);
    canvas.drawLine(p3, p4, routePaint);
    canvas.drawLine(p4, p5, routePaint);

    _marker(canvas, p1, '1', const Color(0xFF22C55E));
    _smallDot(canvas, p2, const Color(0xFF1B4DFF));
    _marker(canvas, p3, '2', const Color(0xFFFF8A1A));
    _marker(canvas, p4, '3', const Color(0xFF8A93A6));
    _marker(canvas, p5, '4', const Color(0xFF8A93A6));

    // user marker
    final userPaint = Paint()..color = const Color(0xFF1B4DFF);
    canvas.drawCircle(
        Offset(size.width * 0.26, size.height * 0.32), 14, userPaint);
    final innerPaint = Paint()..color = Colors.white;
    canvas.drawCircle(
        Offset(size.width * 0.26, size.height * 0.32), 5, innerPaint);
  }

  void _marker(Canvas canvas, Offset c, String label, Color color) {
    final p = Paint()..color = Colors.white;
    canvas.drawCircle(c, 22, p);
    p.color = color;
    canvas.drawCircle(c, 18, p);
    final tp = TextPainter(
      text: TextSpan(
        text: label,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(c.dx - tp.width / 2, c.dy - tp.height / 2));
  }

  void _smallDot(Canvas canvas, Offset c, Color color) {
    final p = Paint()..color = Colors.white;
    canvas.drawCircle(c, 8, p);
    p.color = color;
    canvas.drawCircle(c, 6, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
