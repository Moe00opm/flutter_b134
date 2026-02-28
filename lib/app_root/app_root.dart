import 'package:flutter/material.dart';
import 'package:flutter_b134/features/request_to_book/screens/request_to_book_screen.dart';

class GrandHotel extends StatelessWidget {
  const GrandHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RequestToBookScreen(),
    );
  }
}
