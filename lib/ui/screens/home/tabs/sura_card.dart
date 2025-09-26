import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/Text_Styles.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/ui/screens/sura_details/sura_details.dart';

import '../models/sura.dart';

class SuraCard extends StatelessWidget {

  final Sura sura;

  const SuraCard({super.key, required this.sura});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, SuraDetails.routeName , arguments: sura);
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
              children:[ Image.asset(AppImages.frame , height: 70 , width: 70,),
              Text(sura.id.toString() , style: TextStyles.MediumLabelTextStyle(
                TextStyles : AppColor.white
              ),),
              ],


      ),
           SizedBox(width: 10,),
           Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(sura.nameEn , style: TextStyles.MediumLabelTextStyle(
                      TextStyles : AppColor.white),),
                  Text(sura.ayaNumbers , style: TextStyles.MediumLabelTextStyle(
                      TextStyles : AppColor.white),)
                ],
              ),

            ),
          SizedBox(width: 10,),


          Text(sura.nameAr , style: TextStyles.MediumLabelTextStyle(
              TextStyles : AppColor.white), )
        ],
      ),
    );
  }
  
}  