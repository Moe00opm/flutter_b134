import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter_b134/features/main/my_booking/widgets/prooduct_model.dart';

class BookingDetailScreen extends StatelessWidget {
  final ProoductModel product;

  const BookingDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Booking Detail")),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey.shade300),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Hotel Info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      product.image,
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 16,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                product.location,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "\$${product.price}/night",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Map
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/mask_group.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Booking Info
              bookingRow(Icons.calendar_month, "Dates", product.date),

              bookingRow(Icons.person, "Guest", product.guest),

              bookingRow(Icons.hotel, "Room", "Queen Room"),

              bookingRow(Icons.phone, "Phone", "+201234567890"),

              const SizedBox(height: 30),

              /// Barcode
              Center(
                child: BarcodeWidget(
                  barcode: Barcode.code128(),
                  data: "06158310-5427-471d-af1f-bd9029b",
                  width: 250,
                  height: 80,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookingRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),

      child: Row(
        children: [
          Icon(icon),

          const SizedBox(width: 10),

          Text(title),

          const Spacer(),

          Text(value),
        ],
      ),
    );
  }
}
