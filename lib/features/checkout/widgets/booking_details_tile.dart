import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingDetailsTile extends StatelessWidget {
  const BookingDetailsTile({
    super.key,
    this.iconPath,
    required this.leftText,
    required this.rightText,
    required this.isBig,
  });
  final String? iconPath;
  final String leftText;
  final String rightText;
  final bool isBig;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          if (iconPath != null && iconPath!.isNotEmpty)
            SvgPicture.asset(iconPath!),

          if (iconPath != null && iconPath!.isNotEmpty)
            const SizedBox(width: 10),

          Expanded(
            child: Text(
              leftText,
              style: isBig
                  ? TextStyle(fontWeight: FontWeight.w600, fontSize: 14)
                  : TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
          Text(
            rightText,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
