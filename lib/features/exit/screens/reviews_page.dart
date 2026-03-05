import 'package:flutter/material.dart';
import '../widgets/review_item.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          _buildSummarySection(),
          _buildRatingBars(),
          const Divider(),
          _buildReviewsHeader(),
          Expanded(
            child: _buildReviewsList(),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Reviews',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {},
        ),
      ],
    );
  }

  // Summary section
  Widget _buildSummarySection() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '4.4',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                Text(
                  'of 5',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Excellent',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Based on 5,532 reviews',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Rating bars
  Widget _buildRatingBars() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _buildRatingBar('Cleanliness', 4.6),
          const SizedBox(height: 12),
          _buildRatingBar('Service', 4.8),
          const SizedBox(height: 12),
          _buildRatingBar('Facilities', 4.5),
          const SizedBox(height: 12),
          _buildRatingBar('Location', 4.3),
          const SizedBox(height: 12),
          _buildRatingBar('Value for Money', 4.2),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, double rating) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: rating / 5,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.amber),
              minHeight: 8,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Reviews header
  Widget _buildReviewsHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '532 Reviews',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Text(
                  'Most Recent',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.arrow_drop_down, color: Colors.grey[700], size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reviews list with images from the internet
  Widget _buildReviewsList() {
    final List<Map<String, dynamic>> reviews = [
      {
        'name': 'Kim Borrdy',
        'review': 'Amazing! The room is better than the pictures. Thanks for amazing experience!',
        'rating': 4.5,
        'time': '2 days ago',
        'imageUrl': 'https://randomuser.me/api/portraits/women/44.jpg',
      },
      {
        'name': 'Mirai Kamasuzki',
        'review': 'The service is on point, and I really like the facilities. Good job!',
        'rating': 5.0,
        'time': '3 days ago',
        'imageUrl': 'https://randomuser.me/api/portraits/women/68.jpg',
      },
      {
        'name': 'Jzenklen',
        'review': 'The service is on point, and I really like the facilities. Good job!',
        'rating': 5.0,
        'time': '4 days ago',
        'imageUrl': 'https://randomuser.me/api/portraits/men/32.jpg',
      },
      {
        'name': 'Rezikan Akay',
        'review': 'The service is on point, and I really like the facilities. Good job!',
        'rating': 5.0,
        'time': '5 days ago',
        'imageUrl': 'https://randomuser.me/api/portraits/women/52.jpg',
      },
      {
        'name': 'Rezingkalay',
        'review': 'The service is on point, and I really like the facilities. Good job!',
        'rating': 5.0,
        'time': '1 week ago',
        'imageUrl': 'https://randomuser.me/api/portraits/men/75.jpg',
      },
      {
        'name': 'Andiziky',
        'review': 'The service is on point, and I really like the facilities. Good job!',
        'rating': 5.0,
        'time': '1 week ago',
        'imageUrl': 'https://randomuser.me/api/portraits/women/17.jpg',
      },
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: reviews.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final review = reviews[index];
        return ReviewItem(
          name: review['name'] as String,
          review: review['review'] as String,
          rating: review['rating'] as double,
          time: review['time'] as String,
          imageUrl: review['imageUrl'] as String, // إضافة رابط الصورة
        );
      },
    );
  }
}