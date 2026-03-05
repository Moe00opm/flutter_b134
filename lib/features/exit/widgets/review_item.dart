import 'package:flutter/material.dart';
import 'rating_stars.dart';

class ReviewItem extends StatelessWidget {
  final String name;
  final String review;
  final double rating;
  final String? time;
  final String? imageUrl; // إضافة خاصية الصورة

  const ReviewItem({
    super.key,
    required this.name,
    required this.review,
    required this.rating,
    this.time,
    this.imageUrl, // إضافة parameter جديد
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CircleAvatar معدل لدعم الصور من الإنترنت
          CircleAvatar(
            radius: 24,
            backgroundColor: imageUrl == null ? _getAvatarColor(name) : Colors.grey[200],
            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
            child: imageUrl == null
                ? Text(
              name[0].toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            )
                : null, // إذا كانت الصورة موجودة، لا نعرض النص
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    if (time != null)
                      Text(
                        time!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingStars(rating: rating),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        rating.toStringAsFixed(1),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  review,
                  style: TextStyle(
                    fontSize: time == null ? 13 : 14,
                    color: Colors.grey[time == null ? 700 : 800],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getAvatarColor(String name) {
    List<Color> colors = const [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
    ];
    int index = name.codeUnitAt(0) % colors.length;
    return colors[index];
  }
}