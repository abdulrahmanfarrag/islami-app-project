import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/core/styles/text_styles.dart';
import 'package:islami_app2/ui/screens/home/models/hadeth.dart';

class HadithDetailsScreen extends StatelessWidget {
  final Hadeth hadeth;

  const HadithDetailsScreen({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        foregroundColor: AppColor.gold,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Image.asset(AppImages.leftCorner),
                Expanded(
                  child: Text(
                    hadeth.name,
                    style: TextStyles.LargeLabelTextStyle(
                      TextStyles: AppColor.gold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppImages.rightCorner),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(
                hadeth.content,
                style: TextStyles.LargeBodyTextStyle(
                  TextStyles: AppColor.gold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Image.asset(AppImages.bottomDecoration),
        ],
      ),
    );
  }
}