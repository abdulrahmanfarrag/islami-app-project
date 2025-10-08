import 'package:flutter/material.dart';
import 'package:islami_app2/ui/screens/home/models/hadeth.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';

class HadithCard extends StatelessWidget {
  final Hadeth hadeth;
  const HadithCard({super.key, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColor.gold,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(AppImages.HadithCardBackGround),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // ✅ padding داخلي
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                ImageIcon(AssetImage(AppImages.leftCorner),
                    color: AppColor.black, size: 40),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    hadeth.name,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColor.black),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                ImageIcon(AssetImage(AppImages.rightCorner),
                    color: AppColor.black, size: 40),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Text(
                hadeth.content,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColor.black),
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                maxLines: 10,
              ),
            ),
            Image.asset(AppImages.bottomDecoration, color: AppColor.black),
          ],
        ),
      ),
    );
  }
}