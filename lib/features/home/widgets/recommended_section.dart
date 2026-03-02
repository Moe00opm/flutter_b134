import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/features/home/data/product_model.dart';
import 'package:flutter_b134/features/home/widgets/row_titel.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RowTitel(text: 'Recommended for you', textbutton: 'See All'),
        const SizedBox(height: 15),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              FilterChipUI(title: "All", selected: true),
              SizedBox(width: 10),
              FilterChipUI(title: "Villas"),
              SizedBox(width: 10),
              FilterChipUI(title: "Hotels"),
              SizedBox(width: 10),
              FilterChipUI(title: "Apartments"),
            ],
          ),
        ),

        const SizedBox(height: 20),

        Column(
          children: List.generate(
            foryou.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: RecommendedItem(model: foryou[index]),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterChipUI extends StatelessWidget {
  final String title;
  final bool selected;

  const FilterChipUI({super.key, required this.title, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryColor : AppColors.accentColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: .05), blurRadius: 5),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? AppColors.accentColor : AppColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  final ProductModel model;

  const RecommendedItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            child: Image.asset(
              model.image,
              width: 110,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 15),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    model.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '\$${model.price}/${model.time}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        const SizedBox(width: 4),
                        Text(model.num),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
