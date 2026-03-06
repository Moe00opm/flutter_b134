import 'package:flutter/material.dart';
import 'package:flutter_b134/core/constants/app_images.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/features/home/screens/home_screen.dart';
import 'package:flutter_b134/features/account/pages/account_screen.dart';
import 'package:flutter_b134/features/main/my_booking/page/my_booking_screen.dart';
import 'package:flutter_b134/features/massage/page/message_screen.dart';
import 'package:flutter_b134/features/massage/widgets/custom_svg.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  int currentIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    MyBookingScreen(),
    MessageScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: AppColors.whiteColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: navBar(),
    );
  }

  Container navBar() {
    return Container(
      padding: const EdgeInsets.only(top: 20),

      decoration: BoxDecoration(
        color: AppColors.whiteColor,

        borderRadius: BorderRadius.only(),
        boxShadow: [
          BoxShadow(
            color: AppColors.grayScale60.withValues(alpha: .1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImage.homeSvg),

            backgroundColor: AppColors.whiteColor,
            activeIcon: CustomSvgPicture(
              path: AppImage.homeSvg,
              color: AppColors.primaryColor,
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImage.documentSvg),

            backgroundColor: AppColors.whiteColor,
            label: 'My Booking',
            activeIcon: CustomSvgPicture(
              path: AppImage.documentSvg,
              color: AppColors.primaryColor,
            ),
          ),
          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImage.chatSvg),

            backgroundColor: AppColors.whiteColor,
            activeIcon: CustomSvgPicture(
              path: AppImage.chatSvg,

              color: AppColors.primaryColor,
            ),
            label: 'Message',
          ),

          BottomNavigationBarItem(
            icon: CustomSvgPicture(path: AppImage.userSvg),

            backgroundColor: AppColors.whiteColor,
            activeIcon: CustomSvgPicture(
              path: AppImage.userSvg,
              color: AppColors.primaryColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
