import 'package:flutter/material.dart';
import 'package:flutter_b134/core/constants/app_images.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class HotelDetailsSection extends StatelessWidget {
  const HotelDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(14),
          child: Image.asset(AppImage.theAstonVill, height: 84),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "The Aston Vill Hotel",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppImage.locationIconSvg),
                  SizedBox(width: 10),
                  Text(
                    "Veum Point, Michikoton",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: AppColors.grayScale60,
                    ),
                  ),
                ],
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "\$120",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: "/night",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.star, color: Colors.amber),
        Text("4.7"),
      ],
    );
  }
}
