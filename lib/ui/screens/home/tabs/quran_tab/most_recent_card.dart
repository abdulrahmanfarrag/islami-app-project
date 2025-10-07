import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/Text_Styles.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/ui/screens/home/models/sura.dart';

class MostRecentCard extends StatelessWidget {
  final Sura sura;
  final Function (Sura) onSuraClick;

  const MostRecentCard({super.key, required this.sura, required this.onSuraClick});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: (){
        onSuraClick(sura);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColor.gold ,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text(sura.nameEn , style: TextStyles.LargeLabelTextStyle(TextStyles:AppColor.black ),),
                Text(sura.nameAr , style: TextStyles.LargeLabelTextStyle(TextStyles:AppColor.black ),),
                Text(sura.ayaNumbers+ " : الآيات" , style: TextStyles.LargeBodyTextStyle(TextStyles:AppColor.black ),)
              ],
            ),

            Image.asset(AppImages.mostRecent)
          ],
        ),
      ),
    );
  }
}