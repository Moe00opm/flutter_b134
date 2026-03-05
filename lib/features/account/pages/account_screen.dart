import 'package:flutter/material.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/core/styles/app_fonts.dart';
import 'package:flutter_b134/features/account/widgets/profile_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: AppColors.grayScale100,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.poppins,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.5,
      ),
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmvkHIjGvl_SgvLcMHdD9Xh8nNKoRrd0meqg&s',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Esraa Alaa',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 150),

                          Icon(
                            Icons.edit_outlined,
                            color: AppColors.primaryColor,
                            size: 20,
                          ),
                        ],
                      ),
                      const Text(
                        'ea8940011@gmail.com',
                        style: TextStyle(
                          color: AppColors.grayScale70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                SizedBox(width: 20),
                SizedBox(height: 10),
                Text(
                  "Setting",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: AppFonts.poppins,
                    fontWeight: FontWeight.w600,
                    color: AppColors.grayScale70,
                  ),
                ),
              ],
            ),

            // Menu
            profileItem(
              Icons.account_balance_wallet_outlined,
              "Your Card",
              () {},
            ),
            const Divider(thickness: 0, height: 1),
            profileItem(Icons.security, "Security", () {}),
            const Divider(thickness: 0, height: 1),
            profileItem(Icons.notifications_none, "Notifications", () {}),
            const Divider(thickness: 0, height: 1),
            profileItem(Icons.local_offer_outlined, "languages", () {}),
            const Divider(thickness: 0, height: 1),
            profileItem(Icons.help_outline, "Help and Support", () {}),
            const Divider(thickness: 0, height: 1),

            // const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                height: 65,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: AppColors.errorColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: AppFonts.poppins,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
