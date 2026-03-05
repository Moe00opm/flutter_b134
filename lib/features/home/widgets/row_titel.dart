import 'package:flutter/material.dart';
import 'package:flutter_b134/core/functions/navigations.dart';
import 'package:flutter_b134/features/request_to_book/screens/request_to_book_screen.dart';

class RowTitel extends StatelessWidget {
  const RowTitel({super.key, required this.text, required this.textbutton});
  final String text;
  final String textbutton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

        TextButton(
          onPressed: () {
            pushTo(context, RequestToBookScreen());
          },
          child: Text(textbutton),
        ),
      ],
    );
  }
}
