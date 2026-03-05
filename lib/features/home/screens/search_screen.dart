import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/features/home/data/product_model.dart';
import 'package:flutter_b134/features/home/widgets/row_titel.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text("Search", style: TextStyle(color: Colors.black)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.accentColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .05),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: AppColors.grayScale70),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search...",
                      ),
                    ),
                  ),
                  Icon(Icons.tune, color: AppColors.grayScale70),
                ],
              ),
            ),

            const SizedBox(height: 25),
            RowTitel(text: 'Recent Searches', textbutton: 'Clear All'),

            const SizedBox(height: 15),

            Column(
              children: const [
                _SearchItem("Golden Sands Retreat", "Clearwater, FL"),
                _SearchItem("Crystal Peak Lodge", "Aspen, CO"),
                _SearchItem("Coral Bay Resort", "Miami Beach, FL"),
              ],
            ),

            const SizedBox(height: 25),
            RowTitel(text: 'Recently Viewed', textbutton: 'See All'),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: viewed.length,
                itemBuilder: (context, index) {
                  final model = viewed[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _RecentItem(model),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchItem extends StatelessWidget {
  final String title;
  final String location;

  const _SearchItem(this.title, this.location);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.history, color: AppColors.grayScale70),
      title: Text(title),
      subtitle: Text(location),
    );
  }
}

class _RecentItem extends StatelessWidget {
  final ProductModel model;

  const _RecentItem(this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            model.image,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                model.location,
                style: const TextStyle(color: AppColors.grayScale70),
              ),
              const SizedBox(height: 5),
              Text("\$${model.price}/${model.time}"),
            ],
          ),
        ),
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 5),
        Text(model.num),
      ],
    );
  }
}
