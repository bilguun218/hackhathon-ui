import 'package:flutter/material.dart';

const _kPrimary = Color(0xFF1B4DFF);
const _kInk = Color(0xFF0E1B33);
const _kMuted = Color(0xFF8A93A6);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Профайл',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: _kInk)),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F3F7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.edit_outlined,
                      color: _kInk, size: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF1B4DFF), Color(0xFF4D7CFF)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.person,
                            color: Colors.white, size: 48),
                      ),
                      Positioned(
                        right: -2,
                        bottom: -2,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xFF22C55E),
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Icon(Icons.check,
                              color: Colors.white, size: 14),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Б. Бат-Эрдэнэ',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: _kInk)),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(Icons.location_on, size: 14, color: _kMuted),
                          SizedBox(width: 4),
                          Text('Улаанбаатар хот, Баянзүрх дүүрэг',
                              style:
                                  TextStyle(fontSize: 12, color: _kMuted)),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: const [
                          Icon(Icons.star,
                              size: 16, color: Color(0xFFF5B400)),
                          SizedBox(width: 4),
                          Text('4.9',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF5B400))),
                          SizedBox(width: 6),
                          Text('• Үнэлгээ',
                              style:
                                  TextStyle(fontSize: 13, color: _kMuted)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _statTile(_kPrimary, const Color(0xFFEAF1FF), '48',
                      'Дуусгасан'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _statTile(const Color(0xFFFF8A1A),
                      const Color(0xFFFFF1E0), '1,240', 'Нийт оноо'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _statTile(const Color(0xFF22C55E),
                      const Color(0xFFE6F7EC), '12', 'Хадгалсан'),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _statTile(const Color(0xFF8B5CF6),
                      const Color(0xFFF1EAFF), '7', 'Шагнал'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('МИНИЙ',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: _kMuted,
                    letterSpacing: 1.2)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEDF0F4)),
              ),
              child: Column(
                children: [
                  _menuItem(Icons.person_outline, 'Миний мэдээлэл', null,
                      isFirst: true),
                  _divider(),
                  _menuItem(Icons.alt_route, 'Миний маршрут', '3'),
                  _divider(),
                  _menuItem(Icons.history, 'Ажлын түүх', null),
                  _divider(),
                  _menuItem(
                      Icons.emoji_events_outlined, 'Шагнал, урамшуулал', '7',
                      isLast: true),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('ТОХИРГОО',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: _kMuted,
                    letterSpacing: 1.2)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEDF0F4)),
              ),
              child: Column(
                children: [
                  _menuItem(Icons.notifications_outlined,
                      'Мэдэгдэл тохиргоо', null,
                      isFirst: true),
                  _divider(),
                  _menuItem(
                      Icons.shield_outlined, 'Нууцлал, аюулгүй байдал', null),
                  _divider(),
                  _menuItem(Icons.settings_outlined, 'Тохиргоо', null,
                      isLast: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statTile(Color color, Color bg, String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: color)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(fontSize: 12, color: _kMuted)),
        ],
      ),
    );
  }

  Widget _divider() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Divider(height: 1, color: Color(0xFFEDF0F4)),
      );

  Widget _menuItem(IconData icon, String title, String? badge,
      {bool isFirst = false, bool isLast = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFEAF1FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: _kPrimary, size: 20),
        ),
        title: Text(title,
            style: const TextStyle(
                fontSize: 15,
                color: _kInk,
                fontWeight: FontWeight.w600)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badge != null) ...[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(badge,
                    style: const TextStyle(
                        fontSize: 12,
                        color: _kPrimary,
                        fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 8),
            ],
            const Icon(Icons.chevron_right,
                color: Color(0xFFB7BECB), size: 22),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
