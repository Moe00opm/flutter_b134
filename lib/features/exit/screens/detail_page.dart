import 'package:flutter/material.dart';
import 'reviews_page.dart';
import 'my_booking_page.dart';
import '../widgets/facility_chip.dart' hide MyBookingPage;
import '../widgets/review_item.dart';
import '../widgets/recommendation_item.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildBodyContent(context),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  // SliverAppBar with image and hotel info
  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.white,
      elevation: 0,

      // زر الرجوع مع صورة
      leading: IconButton(
        icon: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha:0.5),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            image: const DecorationImage(
              image: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/93/93634.png', // صورة سهم رجوع
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        onPressed: () => Navigator.pop(context),
        padding: EdgeInsets.zero,
        splashRadius: 24,
      ),

      actions: [
        // زر المفضلة مع صورة قلب
        Container(
          margin: const EdgeInsets.only(right: 12),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(alpha:0.5),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
            image: DecorationImage(
              image: NetworkImage(
                _isFavorite
                    ? 'https://cdn-icons-png.flaticon.com/512/833/833472.png' // قلب أحمر
                    : 'https://cdn-icons-png.flaticon.com/512/1077/1077035.png', // قلب فارغ
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        _isFavorite
                            ? 'Added to favorites'
                            : 'Removed from favorites'
                    ),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.all(16),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(), // فارغ لأن الصورة تظهر من خلال DecorationImage
            ),
          ),
        ),
      ],

      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            _buildHotelImage(),
            _buildGradientOverlay(),
            _buildHotelInfoOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelImage() {
    return Image.asset(
      'images/Images Details.png',
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[300],
          child: const Center(
            child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
          ),
        );
      },
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha:0.7),
            Colors.black.withValues(alpha:0.9),
          ],
          stops: const [0.3, 0.7, 1.0],
        ),
      ),
    );
  }

  Widget _buildHotelInfoOverlay() {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'The Aston Vill Hotel',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                    shadows: [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              _buildRatingBadge(4.6),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.white,
                size: 18,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  'Venue Point, Michiiton',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha:0.95),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    shadows: const [
                      Shadow(
                        color: Colors.black26,
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Rating badge for app bar
  Widget _buildRatingBadge(double rating) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 18,
          ),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 2),
          Text(
            '(5.5k)',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  // Body content
  SliverToBoxAdapter _buildBodyContent(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCommonFacilities(),
            const SizedBox(height: 24),
            _buildDescription(),
            const SizedBox(height: 24),
            _buildLocation(context),
            const SizedBox(height: 24),
            _buildReviewsSection(context),
            const SizedBox(height: 24),
            _buildRecommendationsSection(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Common Facilities section
  Widget _buildCommonFacilities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Common Facilities'),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            FacilityChip(icon: Icons.ac_unit, label: 'AC', color: Colors.blue),
            FacilityChip(icon: Icons.restaurant, label: 'Restaurant', color: Colors.orange),
            FacilityChip(icon: Icons.pool, label: 'Swimming Pool', color: Colors.lightBlue),
            FacilityChip(icon: Icons.local_parking, label: 'Free Parking', color: Colors.green),
            FacilityChip(icon: Icons.wifi, label: 'Free WiFi', color: Colors.purple),
            FacilityChip(icon: Icons.local_cafe, label: 'Breakfast', color: Colors.brown),
          ],
        ),
      ],
    );
  }

  // Description section
  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Description'),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey[200]!),
          ),
          child: const Text(
            'The ideal place for those looking for a luxurious and tranquil holiday experience with stunning sea views. Our hotel offers world-class amenities and exceptional service to make your stay unforgettable.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.6,
            ),
          ),
        ),
      ],
    );
  }

  // Location section with map
  Widget _buildLocation(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Location'),
        const SizedBox(height: 16),
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'images/Frame 1000004381.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.map, size: 50, color: Colors.grey),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showMapDialog(context);
                  },
                  icon: const Icon(Icons.map, size: 18),
                  label: const Text('Open Map'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // عرض نافذة الخريطة
  void _showMapDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hotel Location',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'images/Frame 1000004381.png',
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 300,
                        color: Colors.grey[300],
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.map, size: 50, color: Colors.grey),
                              SizedBox(height: 8),
                              Text('Map view not available'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Venue Point, Michiiton',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Opening maps app...'),
                        duration: Duration(seconds: 1),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Open in Maps App'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Reviews section
  Widget _buildReviewsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSectionTitle('Reviews'),
            _buildReviewsSummary(),
          ],
        ),
        const SizedBox(height: 12),
        const ReviewItem(
          name: 'Kim Borrdy',
          review: 'Amazing! The room is better than the pictures. Thanks for amazing experience!',
          rating: 4.5,
        ),
        const Divider(),
        const ReviewItem(
          name: 'Mirai Kamasuzki',
          review: 'The service is on point, and I really like the facilities. Good job!',
          rating: 5.0,
        ),
        const Divider(),
        const ReviewItem(
          name: 'Jzenklen',
          review: 'The service is on point, and I really like the facilities. Good job!',
          rating: 5.0,
        ),
        const SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReviewsPage(),
                ),
              );
            },
            child: const Text(
              'View All 532 Reviews',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsSummary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha:0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 16),
          const SizedBox(width: 4),
          const Text(
            '4.4',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '(5,532)',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Recommendations section
  Widget _buildRecommendationsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Recommendations'),
        const SizedBox(height: 12),
        const RecommendationItem(),
      ],
    );
  }

  // Section title helper
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Bottom navigation bar
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha:0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        '\$120.00',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          '/night',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyBookingPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Booking Now',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}