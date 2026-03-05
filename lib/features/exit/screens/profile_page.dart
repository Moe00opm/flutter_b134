import 'package:flutter/material.dart';
import 'my_booking_page.dart';
import 'message_page.dart';
// import 'home_page.dart'; // أضف هذا إذا كان لديك ملف home_page.dart

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedBottomNavIndex = 3; // 3 for Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // App Bar
  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'Profile',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  // Body
  Widget _buildBody() {
    return Column(
      children: [
        // Profile Info
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            children: [
              // Profile Image
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'images/Images Details.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Name
              const Text(
                'Brooklyn Simmons',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),

              // Username
              const Text(
                '@Broklynn',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),

        // Menu Items
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              _buildMenuItem(
                icon: Icons.settings_outlined,
                label: 'Setting',
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.credit_card_outlined,
                label: 'Your Card',
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.lock_outline,
                label: 'Security',
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.notifications_outlined,
                label: 'Notification',
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.language_outlined,
                label: 'Languages',
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.help_outline,
                label: 'Help and Support',
                onTap: () {},
              ),
              const SizedBox(height: 20),

              // Logout Button
              _buildMenuItem(
                icon: Icons.logout,
                label: 'Logout',
                color: Colors.red,
                onTap: () {
                  _showLogoutDialog();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Menu Item
  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    Color color = Colors.black87,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(label, style: TextStyle(fontSize: 16, color: color)),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  // Logout Dialog
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                // Navigate to login or home
                Navigator.pushReplacementNamed(context, '/');
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  // Bottom Navigation Bar
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
              // إذا كان لديك ملف HomePage، قم بإلغاء تعليق هذه الأسطر
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomePage()),
              // );
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyBookingPage()),
              );
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MessagePage()),
              );
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
              // Already on Profile page
            },
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Item
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
