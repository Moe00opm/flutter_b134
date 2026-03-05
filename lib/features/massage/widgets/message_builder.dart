import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';

class MessageBuilder extends StatelessWidget {
  final dynamic model;
  const MessageBuilder({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: NetworkImage(model.image)),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        model.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.grayScale100,
                        ),

                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // const SizedBox(width: 20),
                    Text(
                      "${model.weight}",
                      style: const TextStyle(
                        color: AppColors.grayScale60,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "${model.price}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.grayScale60,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
