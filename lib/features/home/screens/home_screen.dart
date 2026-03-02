import 'package:flutter/material.dart';
import 'package:flutter_b134/core/functions/navigations.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/features/home/data/product_model.dart';
import 'package:flutter_b134/features/home/screens/favorite_screen.dart';
import 'package:flutter_b134/features/home/screens/search_screen.dart';
import 'package:flutter_b134/features/home/widgets/home_extra_section.dart';
import 'package:flutter_b134/features/home/widgets/most_popular.dart';
import 'package:flutter_b134/features/home/widgets/recommended_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/mart.png'),
            ),
            SizedBox(width: 12),
            Column(
              children: [
                Text(
                  'mart kohler',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'San diego, CA',
                  style: TextStyle(fontSize: 14, color: AppColors.grayScale80),
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                pushTo(context, SearchScreen());
              },
              icon: Icon(Icons.search, color: AppColors.grayScale80),
            ),
            IconButton(
              onPressed: () {
                pushTo(context, FavoriteScreen());
              },
              icon: Icon(Icons.favorite, color: AppColors.errorColor),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MostPopular(model: pepular[0]),

              const SizedBox(height: 25),
              RecommendedSection(),
              const SizedBox(height: 25),
              HomeExtraSection(),
            ],
          ),
        ),
      ),
    );
  }
}
