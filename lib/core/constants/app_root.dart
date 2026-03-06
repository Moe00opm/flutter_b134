import 'package:flutter/material.dart';
import 'package:flutter_b134/features/auth/screens/splash_screen.dart';

class GrandHotel extends StatelessWidget {
  const GrandHotel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grand Hotel',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
    );
  }
}
