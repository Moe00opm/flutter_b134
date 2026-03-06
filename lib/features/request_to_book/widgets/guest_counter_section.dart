import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';

class GuestCounterSection extends StatefulWidget {
  const GuestCounterSection({super.key});

  @override
  State<GuestCounterSection> createState() => _GuestCounterSectionState();
}

class _GuestCounterSectionState extends State<GuestCounterSection> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            "Guest",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (counter > 0) {
                counter--;
              }
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              color: AppColors.linsColor,
            ),
            child: Center(
              child: Text(
                "-",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16),
        Text("$counter", style: TextStyle(fontSize: 20)),
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            setState(() {
              counter++;
            });
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              color: AppColors.primaryColor,
            ),
            child: Center(
              child: Text(
                "+",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
