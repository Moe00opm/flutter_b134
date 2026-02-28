import 'package:flutter/material.dart';
import 'package:flutter_b134/core/constants/app_images.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/features/checkout/widgets/booking_details_tile.dart';

class BookingAndPriceDetailsSection extends StatelessWidget {
  const BookingAndPriceDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.linsColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Booking",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            BookingDetailsTile(
              isBig: false,
              iconPath: AppImage.calendarIconSvg,
              leftText: "Dates",
              rightText: "12 - 14 Nov 2024",
            ),
            BookingDetailsTile(
              isBig: false,
              iconPath: AppImage.userSvg,
              leftText: "Guest",
              rightText: "2 Guests (1 Room)",
            ),
            BookingDetailsTile(
              isBig: false,
              iconPath: AppImage.roomTypeIconSvg,
              leftText: "Room type",
              rightText: "Queen Room",
            ),
            BookingDetailsTile(
              isBig: false,
              iconPath: AppImage.phoneIconSvg,
              leftText: "Phone",
              rightText: "0214345646",
            ),
            Divider(),
            SizedBox(height: 16),
            Text(
              "Price Details",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 10),
            BookingDetailsTile(
              isBig: false,
              leftText: "Price",
              rightText: "\$139.00",
            ),
            BookingDetailsTile(
              isBig: false,
              leftText: "Admin Fee",
              rightText: "\$2.5",
            ),
            BookingDetailsTile(
              isBig: true,
              leftText: "Total Price",
              rightText: "\$141.50",
            ),
          ],
        ),
      ),
    );
  }
}
