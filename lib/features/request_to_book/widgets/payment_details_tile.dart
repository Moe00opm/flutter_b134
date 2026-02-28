import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';

class PaymentDetailsTile extends StatelessWidget {
  const PaymentDetailsTile({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.isBig,
  });
  final String leftText;
  final String rightText;
  final bool isBig;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: isBig
              ? TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColors.grayScale100,
                )
              : TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: AppColors.grayScale80,
                ),
        ),
        Text(
          rightText,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: AppColors.grayScale100,
          ),
        ),
      ],
    );
  }
}
