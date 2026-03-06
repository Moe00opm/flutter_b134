import 'package:flutter/material.dart' hide BottomSheet;
import 'package:flutter_b134/core/widgets/main_button.dart';
import 'package:flutter_b134/features/checkout/widgets/booking_and_price_details_section.dart';
import 'package:flutter_b134/features/checkout/widgets/bottom_sheet.dart';
import 'package:flutter_b134/features/checkout/widgets/hotel_details_section.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            HotelDetailsSection(),
            SizedBox(height: 30),
            BookingAndPriceDetailsSection(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: MainButton(
          text: "Select Payment",
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0xffFEFEFE),
              context: context,
              builder: (context) {
                return BottomSheet();
              },
            );
          },
        ),
      ),
    );
  }
}
