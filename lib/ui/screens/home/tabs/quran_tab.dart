import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/Text_Styles.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/ui/screens/home/models/sura.dart';
import 'package:islami_app2/ui/screens/home/tabs/sura_card.dart';

import 'base_Tab_widget/base_tab_widget.dart';

class QuranTab extends StatefulWidget{
  const QuranTab ({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {

  @override
  void initState() {
    super.initState();
    Sura.generateSurasList();
  }

  @override
  Widget build(BuildContext context) {
   return BaseTabWidget(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: Text('Suras List' , style: TextStyles.LargeBodyTextStyle(),),
         ),
         Expanded(
             child: ListView.separated(itemBuilder: (context , index) => SuraCard(sura: Sura.suras[index]),
                 padding: EdgeInsets.all(16),
                 separatorBuilder: (_ , _ )=> Divider(indent: 40 , color:AppColor.white,),
                 itemCount: Sura.suras.length ),)
       ],
     )
   );
  }
}