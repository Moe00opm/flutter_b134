import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/features/checkout/widgets/check_box.dart';
import 'package:flutter_svg/svg.dart';

class ButtomSheetTile extends StatelessWidget {
  const ButtomSheetTile({super.key, required this.picPath, required this.text});
  final String picPath;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 80,
            offset: Offset(0, 4),
            color: Color(0xffA7AEC1),
            spreadRadius: 0,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            SvgPicture.asset(picPath),
            SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            CheckBox(),
          ],
        ),
      ),
    );
  }
}
