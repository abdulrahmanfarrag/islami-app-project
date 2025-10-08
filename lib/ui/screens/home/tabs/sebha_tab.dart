import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/Text_Styles.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';

import 'base_Tab_widget/base_tab_widget.dart';

class SebhaTab extends StatefulWidget{
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {

  int counter = 1;
  int index = 0;
  double angle = 10;

  List<String> azkarList = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "سبحان الله وبحمده",
    "أستغفر الله العظيم وأتوب إليه",
    "اللهم صلِّ وسلم على نبينا محمد"
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    double screenWith = MediaQuery
        .of(context)
        .size
        .width;
    return BaseTabWidget(
      child: Column(
        children: [
          const Row(),
          Text('سَبِّحِ اسْمَ رَبِّكَ الأعلى',
            style: TextStyles.LargeTitleTextStyle(TextStyles: AppColor.white),
          ),
          SizedBox(height: screenHeight * .06,),
          Expanded(child: Stack(
            alignment: Alignment.center,
            children: [
            Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Transform.rotate(
                angle: angle,
                child: Image.asset(AppImages.sebhaBody,
                  width: screenWith * .9,
                  height: screenHeight * .6,),
              ),
              Positioned(
                top: -screenHeight * .08,
                child: Image.asset(AppImages.sebhaHead,
                  width: screenWith * .4,
                  height: screenHeight * .15,),)

            ],
          ),
            GestureDetector(
                onTap: () => _onClick (),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text( azkarList[index], style: TextStyles.MediumLabelTextStyle(
                    TextStyles: AppColor.white),),
                Text('$counter', style: TextStyles.MediumLabelTextStyle(
                    TextStyles: AppColor.white),),
              ],
            ),
          )
        ],
      ),)

    ])
    );
  }
void _onClick() {
    setState(() {
      angle-=10;
      counter++;
      if(counter == 5){

        counter =0;

        if (index == azkarList.length -1){
          index =0;
        }else {
          index++;
        }
      }

    });
}
  }
