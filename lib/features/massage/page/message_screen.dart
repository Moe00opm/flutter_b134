import 'package:flutter/material.dart';
import 'package:flutter_b134/core/constants/app_images.dart';
import 'package:flutter_b134/core/styles/app_colors.dart';
import 'package:flutter_b134/features/massage/data/item_product.dart';
import 'package:flutter_b134/features/massage/widgets/message_builder.dart';
import 'package:flutter_svg/svg.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final focusNode = FocusNode();
  String searchKey = ' ';
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(AppImage.west, color: AppColors.grayScale100),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Message",
          style: TextStyle(
            color: AppColors.grayScale100,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        elevation: 0.5,
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.grayScale60),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Search...",
                      style: TextStyle(color: AppColors.grayScale60),
                    ),
                  ),
                  SvgPicture.asset(
                    AppImage.filter,
                    colorFilter: ColorFilter.mode(
                      AppColors.grayScale100,
                      BlendMode.srcIn,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.separated(
                itemCount: messages.length,

                padding: const EdgeInsets.symmetric(vertical: 10),
                separatorBuilder: (context, index) =>
                    const Divider(color: AppColors.whiteColor, height: 1),
                itemBuilder: (context, index) {
                  return MessageBuilder(model: messages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
