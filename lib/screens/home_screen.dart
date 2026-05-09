import 'package:flutter/material.dart';
import 'maps_screen.dart';
import 'profile_screen.dart';

const kPrimary = Color(0xFF1B4DFF);
const kBg = Color(0xFFF7F8FA);
const kInk = Color(0xFF0E1B33);
const kMuted = Color(0xFF8A93A6);

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreen(),
      const WishlistScreen(),
      const MapsScreen(),
      const AwardsScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(bottom: false, child: _screens[_selectedIndex]),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 18,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(0, Icons.home_outlined, Icons.home, 'Нүүр'),
                _navItem(1, Icons.bookmark_outline, Icons.bookmark, 'Хадгалсан'),
                _navItem(2, Icons.map_outlined, Icons.map, 'Маршрут'),
                _navItem(3, Icons.emoji_events_outlined, Icons.emoji_events,
                    'Шагнал'),
                _navItem(4, Icons.person_outline, Icons.person, 'Профайл'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(int index, IconData icon, IconData iconActive, String label) {
    final selected = _selectedIndex == index;
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selected ? kPrimary : Colors.transparent,
            ),
            child: Icon(
              selected ? iconActive : icon,
              color: selected ? Colors.white : const Color(0xFFB7BECB),
              size: 22,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: selected ? kPrimary : const Color(0xFFB7BECB),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kPrimary,
                  ),
                  child: const Icon(Icons.location_on,
                      color: Colors.white, size: 24),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AccessPlan UB',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kInk,
                        ),
                      ),
                      Text(
                        'Саадгүй хотын ухаалаг төлөвлөгөө',
                        style: TextStyle(fontSize: 11, color: kMuted),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F3F7),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.notifications_outlined,
                          color: kInk, size: 22),
                      Positioned(
                        right: 12,
                        top: 12,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Greeting
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Сайн байна уу,',
                    style: TextStyle(fontSize: 14, color: kMuted)),
                SizedBox(height: 2),
                Text('Б. Бат-Эрдэнэ 👋',
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: kInk)),
              ],
            ),
          ),
          // Main card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFEDF0F4)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPrimary,
                        ),
                        child: const Icon(Icons.auto_awesome,
                            color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Өнөөдрийн ажлуудаа оруулна уу',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: kInk,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 90,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F8FA),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      'Жишээ: эмийн сан орох, баримт хүргэх,\nдэлгүүрээс хүнс авах...',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFFB7BECB),
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      _CategoryChip(
                          icon: Icons.medication_outlined,
                          label: 'Эмийн сан',
                          color: kPrimary),
                      _CategoryChip(
                          icon: Icons.description_outlined,
                          label: 'Баримт хүргэлт',
                          color: Color(0xFF22C55E)),
                      _CategoryChip(
                          icon: Icons.shopping_cart_outlined,
                          label: 'Хүнс авах',
                          color: Color(0xFFFF8A1A)),
                      _CategoryChip(
                          icon: Icons.inventory_2_outlined,
                          label: 'Бараа хүргэх',
                          color: Color(0xFF8B5CF6)),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward,
                              color: Colors.white, size: 18),
                          label: const Text('Эхлэх'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.bookmark_outline,
                              color: kInk, size: 18),
                          label: const Text('Хадгалснаас',
                              style: TextStyle(color: kInk)),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFFF7F8FA),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            padding:
                                const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Өнөөдрийн тойм',
                style: TextStyle(
                    fontSize: 17, fontWeight: FontWeight.bold, color: kInk)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: const [
                Expanded(
                  child: _SummaryTile(
                      value: '5',
                      label: 'Нийт ажил',
                      color: kPrimary,
                      bg: Color(0xFFEAF1FF)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _SummaryTile(
                      value: '42',
                      label: 'мин',
                      color: Color(0xFF22C55E),
                      bg: Color(0xFFE6F7EC)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _SummaryTile(
                      value: '3',
                      label: 'ажил',
                      color: Color(0xFFFF8A1A),
                      bg: Color(0xFFFFF1E0)),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _SummaryTile(
                      value: '180',
                      label: 'Оноо',
                      color: Color(0xFF8B5CF6),
                      bg: Color(0xFFF1EAFF)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Байнга хийдэг ажлууд',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: kInk)),
                Row(
                  children: [
                    Text('Бүгд',
                        style: TextStyle(
                            fontSize: 14,
                            color: kPrimary,
                            fontWeight: FontWeight.w600)),
                    Icon(Icons.chevron_right, color: kPrimary, size: 18),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 16),
                _frequentCard(Icons.medication_outlined, kPrimary,
                    const Color(0xFFEAF1FF), 'Эмийн сан', 'Баянзүрх'),
                const SizedBox(width: 10),
                _frequentCard(Icons.description_outlined,
                    const Color(0xFF22C55E), const Color(0xFFE6F7EC),
                    'Банк орох', 'Чингэлтэй'),
                const SizedBox(width: 10),
                _frequentCard(Icons.shopping_cart_outlined,
                    const Color(0xFFFF8A1A), const Color(0xFFFFF1E0),
                    'Хүнс авах', 'Сүхбаатар'),
                const SizedBox(width: 10),
                _frequentCard(Icons.inventory_2_outlined,
                    const Color(0xFF8B5CF6), const Color(0xFFF1EAFF),
                    'Бараа зөөх', 'Хан-Уул'),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _frequentCard(IconData icon, Color color, Color bg, String title,
      String subtitle) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEDF0F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, color: kInk)),
          const SizedBox(height: 2),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: kMuted)),
          const SizedBox(height: 10),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: kPrimary, size: 18),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _CategoryChip(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 6),
          Text(label,
              style: TextStyle(
                  fontSize: 13,
                  color: color,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final Color bg;
  const _SummaryTile({
    required this.value,
    required this.label,
    required this.color,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(14),
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
              style: const TextStyle(fontSize: 12, color: kMuted)),
        ],
      ),
    );
  }
}

// =============== WISHLIST ==================

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Хадгалсан ажлууд',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: kInk)),
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF1FF),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.bookmark, color: kPrimary, size: 22),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 4, 20, 0),
            child: Text('5 ажил хадгалагдсан',
                style: TextStyle(fontSize: 13, color: kMuted)),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F7),
                borderRadius: BorderRadius.circular(28),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Хадгалсан ажлаас хайх...',
                  hintStyle: const TextStyle(color: Color(0xFFB7BECB)),
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.search,
                      color: Color(0xFFB7BECB), size: 22),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                _filter('Бүгд', true),
                const SizedBox(width: 8),
                _filter('Сүүлд хадгалсан', false),
                const SizedBox(width: 8),
                _filter('Ойрхон', false),
                const SizedBox(width: 8),
                _filter('Өндөр оноо', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _wishItem(
                  Icons.medication_outlined,
                  kPrimary,
                  const Color(0xFFEAF1FF),
                  'Эмийн сангаас эм авах',
                  'Баянзүрх, 3-р эмийн санд очиж жорын эм авах',
                  'Тусламж',
                  '15 мин',
                  '+25',
                ),
                const SizedBox(height: 12),
                _wishItem(
                  Icons.description_outlined,
                  const Color(0xFF22C55E),
                  const Color(0xFFE6F7EC),
                  'Баримт бичиг хүргэх',
                  'Чингэлтэй дүүргийн оффист баримт хүргэх',
                  'Хүргэлт',
                  '20 мин',
                  '+30',
                ),
                const SizedBox(height: 12),
                _wishItem(
                  Icons.shopping_cart_outlined,
                  const Color(0xFFFF8A1A),
                  const Color(0xFFFFF1E0),
                  'Дэлгүүрээс хүнс авах',
                  'Ойролцоох супермаркетаас долоо хоногийн хүнс авах',
                  'Худалдан авалт',
                  '30 мин',
                  '+20',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _filter(String label, bool selected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? kPrimary : const Color(0xFFF1F3F7),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: selected ? Colors.white : const Color(0xFF6B7280),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _wishItem(
    IconData icon,
    Color color,
    Color bg,
    String title,
    String desc,
    String tag,
    String time,
    String points,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDF0F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, color: color, size: 24),
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
                                  color: kInk)),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F3F7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.edit_outlined,
                              size: 16, color: kMuted),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAF1FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.bookmark,
                              size: 16, color: kPrimary),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(desc,
                        style: const TextStyle(fontSize: 13, color: kMuted),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(tag,
                    style: TextStyle(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.access_time, size: 14, color: kMuted),
              const SizedBox(width: 4),
              Text(time,
                  style: const TextStyle(fontSize: 12, color: kMuted)),
              const SizedBox(width: 10),
              const Icon(Icons.star, size: 14, color: Color(0xFFF5B400)),
              const SizedBox(width: 4),
              Text(points,
                  style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFFF5B400),
                      fontWeight: FontWeight.w700)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.white, size: 18),
              label: const Text('Маршрут руу нэмэх'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimary,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
                textStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============== AWARDS ==================

class AwardsScreen extends StatelessWidget {
  const AwardsScreen({super.key});

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
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFB800),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.emoji_events,
                      color: Colors.white, size: 28),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Шагнал',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: kInk)),
                      Text('Таны хийсэн ажлуудын үр дүн, оноо, урамшуулал',
                          style: TextStyle(fontSize: 12, color: kMuted)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _statCard(const Color(0xFFFFB800),
                          const Color(0xFFFFF6E0), Icons.star,
                          'Нийт оноо', '1,240'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _statCard(const Color(0xFF22C55E),
                          const Color(0xFFE6F7EC), Icons.trending_up,
                          'Энэ долоо хоног', '+180'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _statCard(kPrimary, const Color(0xFFEAF1FF),
                          Icons.check_circle, 'Дуусгасан ажил', '48'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _statCard(const Color(0xFF8B5CF6),
                          const Color(0xFFF1EAFF), Icons.card_giftcard,
                          'Нээгдсэн шагнал', '7'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F3F7),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                          )
                        ],
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.emoji_events,
                              color: kInk, size: 18),
                          SizedBox(width: 6),
                          Text('Амжилт',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: kInk,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.card_giftcard,
                              color: kMuted, size: 18),
                          SizedBox(width: 6),
                          Text('Шагналууд',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: kMuted,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _achievement(
                  const Color(0xFFFF8A1A),
                  const Color(0xFFFFF1E0),
                  Icons.track_changes,
                  'Анхны 20 ажил',
                  'Ажлыг умалзуулагч',
                  '+50 оноо',
                ),
                const SizedBox(height: 12),
                _achievement(
                  const Color(0xFFFF8A1A),
                  const Color(0xFFFFF1E0),
                  Icons.access_time,
                  'Цаг баримтлагч',
                  'Цагийн юмыг цагт нь шдээ...',
                  '+75 оноо',
                ),
                const SizedBox(height: 12),
                _achievement(
                  const Color(0xFFFF8A1A),
                  const Color(0xFFFFF1E0),
                  Icons.apartment,
                  'Хотод саад учруулаагүй',
                  'Соён гэгээрүүлэгч',
                  '+100 оноо',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _statCard(
      Color color, Color bg, IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 13,
                        color: kInk,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(value,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: color)),
        ],
      ),
    );
  }

  Widget _achievement(Color color, Color bg, IconData icon, String title,
      String subtitle, String pts) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFEDF0F4)),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(title,
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: kInk)),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.check_circle,
                        color: Color(0xFF22C55E), size: 18),
                  ],
                ),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(fontSize: 13, color: kMuted)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star,
                        color: Color(0xFFF5B400), size: 16),
                    const SizedBox(width: 4),
                    Text(pts,
                        style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFFF5B400),
                            fontWeight: FontWeight.w700)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
