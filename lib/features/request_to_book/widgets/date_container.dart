import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    super.key,
    required this.title,
    required this.valueText,
    required this.onTap,
    this.width,
  });
  final String title;
  final String valueText;
  final VoidCallback onTap;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: width,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.accentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.calendar_month),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              valueText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColors.grayScale80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
