import 'package:flutter/material.dart';
import 'package:flutter_b134/core/constants/app_images.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/core/widgets/main_button.dart';
import 'package:flutter_b134/features/booking_complete/screens/booking_complete_screen.dart';
import 'package:flutter_b134/features/checkout/widgets/buttom_sheet_tile.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Payment Method",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 30),
            ButtomSheetTile(
              picPath: AppImage.masterCardIconSVg,
              text: "Master Card",
            ),
            SizedBox(height: 15),
            ButtomSheetTile(picPath: AppImage.visaIconSvg, text: "Visa"),
            SizedBox(height: 15),
            Container(
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.accentColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.add_circle,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        "Add Debit Card",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            MainButton(
              text: "Confirm and Pay",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingCompleteScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
