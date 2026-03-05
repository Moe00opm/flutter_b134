import 'package:flutter/material.dart';
import 'my_booking_page.dart';
import 'message_page.dart';
import 'profile_page.dart';

class BookingDetailPage extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const BookingDetailPage({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: _buildAppBar(context), // تمرير context للـ AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHotelImage(),
            _buildHotelInfo(),
            _buildLocationSection(context),
            _buildBookingInfo(),
            _buildBarcodeSection(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // App Bar - مع استقبال context كمعامل
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Booking Detail',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1A1E2B),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1A1E2B), size: 20),
          onPressed: () {
            Navigator.pop(context); // الآن context موجود
          },
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.more_horiz, color: Color(0xFF1A1E2B), size: 20),
            onPressed: () {
              _showOptionsDialog(context); // تمرير context للدالة
            },
          ),
        ),
      ],
    );
  }

  // دالة إظهار قائمة الخيارات
  void _showOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Options'),
          content: const Text('What would you like to do?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // استخدام dialogContext بدلاً من context
                _showSnackBar(context, 'Edit option selected');
              },
              child: const Text('Edit'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // استخدام dialogContext بدلاً من context
                _showSnackBar(context, 'Share option selected');
              },
              child: const Text('Share'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // استخدام dialogContext بدلاً من context
                _showSnackBar(context, 'Cancel option selected');
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // دالة إظهار الـ SnackBar
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // Hotel Image
  Widget _buildHotelImage() {
    return Container(
      height: 200,
      width: double.infinity,
      child: Image.asset(
        hotel['image'] ?? 'images/Images Details.png',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey[300],
            child: const Center(
              child: Icon(Icons.hotel, size: 50, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }

  // Hotel Info Section
  Widget _buildHotelInfo() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Hotel',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1E2B),
            ),
          ),
          const SizedBox(height: 12),

          // Hotel name with star
          Row(
            children: [
              Expanded(
                child: Text(
                  hotel['name'] ?? 'The Aston V Hotel',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1E2B),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha:0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      hotel['rating'].toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1E2B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Location
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.grey, size: 16),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  hotel['location'] ?? 'Vellum Point, Midsomer Norton',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Price
          Text(
            '\$${hotel['price']}/night',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1E2B),
            ),
          ),
        ],
      ),
    );
  }

  // Location Section with Map Image
  Widget _buildLocationSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1E2B),
            ),
          ),
          const SizedBox(height: 12),

          // Map Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'images/Frame 1000004381.png',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.map, color: Colors.grey, size: 40),
                      const SizedBox(height: 8),
                      Text(
                        'Map Preview',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 12),

          // Open Map Button
          GestureDetector(
            onTap: () {
              _showSnackBar(context, 'Opening map...');
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.blue.withValues(alpha:0.3)),
              ),
              child: const Center(
                child: Text(
                  'Open Map',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Booking Information Section
  Widget _buildBookingInfo() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Booking',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1E2B),
            ),
          ),
          const SizedBox(height: 16),

          // Dates
          _buildInfoRow(
            icon: Icons.calendar_today,
            label: 'Dates',
            value: hotel['dates'] ?? '12 - 14 Nov 2024',
          ),
          const SizedBox(height: 12),

          // Guest
          _buildInfoRow(
            icon: Icons.people,
            label: 'Guest',
            value: hotel['guests'] ?? '2 Guests (1 Room)',
          ),
          const SizedBox(height: 12),

          // Room type
          _buildInfoRow(
            icon: Icons.bed,
            label: 'Room type',
            value: 'Queen Room',
          ),
          const SizedBox(height: 12),

          // Phone
          _buildInfoRow(
            icon: Icons.phone,
            label: 'Phone',
            value: '0214345646',
          ),
        ],
      ),
    );
  }

  // Info Row Helper with icon
  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Colors.blue, size: 16),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: [
              Text(
                '$label:',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1A1E2B),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Barcode Section
  Widget _buildBarcodeSection() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Barcode',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1E2B),
            ),
          ),
          const SizedBox(height: 16),

          // Barcode Container
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                // Simulated barcode lines
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(30, (index) {
                    return Container(
                      width: 3,
                      height: index % 3 == 0 ? 60 : (index % 2 == 0 ? 45 : 30),
                      color: Colors.black,
                    );
                  }),
                ),
                const SizedBox(height: 16),

                // Barcode number
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const SelectableText(
                    '04158310-5427-471d-aflf-bd9029b',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1A1E2B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.2),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            isActive: false,
            onTap: () {
            //  Navigator.pushReplacement(
              //  context,
                //MaterialPageRoute(builder: (context) => const HomePage()),
              //);
            },
          ),
          _buildNavItem(
            icon: Icons.calendar_today_outlined,
            activeIcon: Icons.calendar_today,
            label: 'My Booking',
            isActive: true,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyBookingPage()),
              );
            },
          ),
          _buildNavItem(
            icon: Icons.message_outlined,
            activeIcon: Icons.message,
            label: 'Message',
            isActive: false,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MessagePage()),
              );
            },
          ),
          _buildNavItem(
            icon: Icons.person_outline,
            activeIcon: Icons.person,
            label: 'Profile',
            isActive: false,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
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
    required bool isActive,
    required VoidCallback onTap,
  }) {
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
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}