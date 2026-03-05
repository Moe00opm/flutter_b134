import 'package:flutter/material.dart';
import 'package:flutter_b134/core/widgets/main_button.dart';
import 'package:flutter_b134/features/checkout/screens/checkout_screen.dart';
import 'package:flutter_b134/features/request_to_book/functions/date_range_picker_dialog.dart';
import 'package:flutter_b134/features/request_to_book/widgets/date_container.dart';
import 'package:flutter_b134/features/request_to_book/widgets/guest_counter_section.dart';
import 'package:flutter_b134/features/request_to_book/widgets/payment_details_tile.dart';
import 'package:flutter_b134/features/request_to_book/widgets/payment_method_section.dart';

class RequestToBookScreen extends StatelessWidget {
  const RequestToBookScreen({super.key});
  String _formatDate(DateTime? date) {
    if (date == null) return "Select";
    {
      return "${date.day}/${date.month}/${date.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTimeRange? bookingRange;
    return Scaffold(
      appBar: AppBar(
        title: Text("Request To Book"),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(height: 16),
            StatefulBuilder(
              builder: (context, setState) {
                final chekIn = bookingRange?.start;
                final checkOut = bookingRange?.end;
                Future<void> openCalendar() async {
                  final picked = await showDateRangePickerDialog(
                    context,
                    initialRange: bookingRange,
                  );
                  if (picked != null) {
                    setState(() {
                      bookingRange = picked;
                    });
                  }
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DateContainer(
                      title: "Check in",
                      valueText: _formatDate(chekIn),
                      onTap: openCalendar,
                      width: 158,
                    ),
                    DateContainer(
                      title: "Check Out",
                      valueText: _formatDate(checkOut),
                      onTap: openCalendar,
                      width: 158,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 24),
            GuestCounterSection(),
            SizedBox(height: 24),
            Text(
              "Pay With",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(height: 16),
            PaymentMethodSection(),
            SizedBox(height: 24),
            Text(
              "Payment Details",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(height: 10),
            PaymentDetailsTile(
              leftText: "Total : 2 Night",
              rightText: "\$400",
              isBig: false,
            ),
            SizedBox(height: 10),
            PaymentDetailsTile(
              leftText: "Cleaning Fee",
              rightText: '\$5',
              isBig: false,
            ),
            SizedBox(height: 10),
            PaymentDetailsTile(
              leftText: "Service Fee",
              rightText: '\$5',
              isBig: false,
            ),
            Divider(),
            SizedBox(height: 10),
            PaymentDetailsTile(
              leftText: "Total Payment:",
              rightText: "\$410",
              isBig: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: MainButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CheckoutScreen();
                },
              ),
            );
          },
          text: "Checkout",
        ),
      ),
    );
  }
}
