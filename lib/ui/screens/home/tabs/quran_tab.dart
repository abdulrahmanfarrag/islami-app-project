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
  List<Sura> fullList = [];
  List<Sura> searchList = [];
  @override
  void initState() {
    super.initState();
    Sura.generateSurasList();
    //three dots adds another list on my list (cascade operator)
    fullList = [...Sura.suras  ];
    searchList = [...Sura.suras  ];

  }

  @override
  Widget build(BuildContext context) {
   return BaseTabWidget(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Padding(
           padding: const EdgeInsets.all(16.0),
           child: TextFormField(
             onChanged: (value){
               searchInList(value);

             } ,
             style: TextStyles.SmallLabelTextStyle(TextStyles: AppColor.white),
             decoration:  InputDecoration(
               filled: true,
               fillColor: AppColor.black.withAlpha(80),
               prefixIcon: ImageIcon(AssetImage(
                 AppImages.searchIcon,
               ), color: AppColor.gold,),
               hintText: 'Search by sura name',
               hintStyle: TextStyles.SmallLabelTextStyle(TextStyles: AppColor.white),
               enabledBorder: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(10),
                 borderSide: BorderSide(
                   color: AppColor.gold
                 )
               ),
               focusedBorder: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(10),
                   borderSide: BorderSide(
                       color: AppColor.gold
                   )
               ),
             ),

           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16.0),
           child: Text('Suras List' , style: TextStyles.LargeBodyTextStyle(),),
         ),
         Expanded(
             child: ListView.separated(itemBuilder: (context , index) => SuraCard(sura: searchList[index]),
                 padding: EdgeInsets.all(16),
                 separatorBuilder: (_ , _ )=> Divider(indent: 40 , color:AppColor.white,),
                 itemCount: searchList.length ),)
       ],
     )
   );
  }

  void searchInList(String value) {
    var searchResult = fullList.where((element)=> element.nameEn.toLowerCase().contains(value.toLowerCase())).toList();
    if(searchResult.isEmpty){
      searchResult = fullList.where((element)=> element.nameAr.contains(value)).toList();
    }
      searchList = searchResult;
    setState(() {

    });
    }
  }
