import 'package:flutter/material.dart';

// هذا هو الـ Widget الخاص بك
class FacilityChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const FacilityChip({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}

// ✅ هذا هو الكود الإضافي اللي طلبته - شريط التنقل السفلي
// (يجب وضعه في ملف MyBookingPage وليس هنا)
class MyBookingPage extends StatefulWidget {
  const MyBookingPage({super.key});

  @override
  State<MyBookingPage> createState() => _MyBookingPageState();
}

class _MyBookingPageState extends State<MyBookingPage> {
  int _selectedBottomNavIndex = 1; // 1 for My Booking

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Booking')),
      body: const Center(
        child: FacilityChip(
          icon: Icons.wifi,
          label: 'WiFi',
          color: Colors.blue,
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Bottom Navigation Bar - الأزرار الأربعة في الأسفل
  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Home Button
          _buildNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            index: 0,
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 0;
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),

          // My Booking Button
          _buildNavItem(
            icon: Icons.calendar_today_outlined,
            activeIcon: Icons.calendar_today,
            label: 'My Booking',
            index: 1,
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 1;
              });
            },
          ),

          // Message Button
          _buildNavItem(
            icon: Icons.message_outlined,
            activeIcon: Icons.message,
            label: 'Message',
            index: 2,
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 2;
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage()));
            },
          ),

          // Profile Button
          _buildNavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
            index: 3,
            onTap: () {
              setState(() {
                _selectedBottomNavIndex = 3;
              });
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
    );
  }

  // عنصر التنقل السفلي
  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    bool isActive = _selectedBottomNavIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive ? Colors.blue : Colors.grey,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isActive ? Colors.blue : Colors.grey,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}