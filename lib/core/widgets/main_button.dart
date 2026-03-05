import 'package:flutter/material.dart';

import '../styles/app_colors.dart';


class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
        ),
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(double.infinity, 65),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
