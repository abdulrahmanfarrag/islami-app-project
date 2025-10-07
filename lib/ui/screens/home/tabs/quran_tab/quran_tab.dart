import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/Text_Styles.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/ui/screens/home/models/sura.dart';
import 'package:islami_app2/ui/screens/home/tabs/quran_tab/most_recent_card.dart';
import 'package:islami_app2/ui/screens/home/tabs/quran_tab/sura_card.dart';
import 'package:islami_app2/ui/screens/sura_details/sura_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../base_Tab_widget/base_tab_widget.dart';

class QuranTab extends StatefulWidget{
  const QuranTab ({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<Sura> fullList = [];
  List<Sura> searchList = [];
  List<Sura> mostRecent = [];

  @override
  void initState() {
    super.initState();
    Sura.generateSurasList();
    //three dots adds another list on my list (cascade operator)
    fullList = [...Sura.suras];
    searchList = [...Sura.suras];
    readMostRecentSura();
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
                onChanged: (value) {
                  searchInList(value);
                },
                style: TextStyles.SmallLabelTextStyle(
                    TextStyles: AppColor.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.black.withAlpha(80),
                  prefixIcon: ImageIcon(AssetImage(
                    AppImages.searchIcon,
                  ), color: AppColor.gold,),
                  hintText: 'Search by sura name',
                  hintStyle: TextStyles.SmallLabelTextStyle(
                      TextStyles: AppColor.white),
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
            if(mostRecent.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Most Recent', style: TextStyles.LargeBodyTextStyle(),),
            ),
            if(mostRecent.isNotEmpty)
            SizedBox(
              height: 172,
              child: ListView.separated(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal ,
                separatorBuilder: (_ , _)=> SizedBox(width: 16,),
                itemBuilder: ( _ , index) => MostRecentCard(sura: mostRecent[index], onSuraClick: onSuraClick) ,
              itemCount: mostRecent.length ,),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Suras List', style: TextStyles.LargeBodyTextStyle(),),
            ),
            Expanded(
              child: ListView.separated(itemBuilder: (context, index) =>
                  SuraCard(sura: Sura.suras[index], onSuraClick: onSuraClick,),
                  padding: EdgeInsets.all(16),
                  separatorBuilder: (_, _) =>
                      Divider(indent: 40, color: AppColor.white,),
                  itemCount: searchList.length),)
          ],
        )
    );
  }

  void searchInList(String value) {
    var searchResult = fullList.where((element) =>
        element.nameEn.toLowerCase().contains(value.toLowerCase())).toList();
    if (searchResult.isEmpty) {
      searchResult =
          fullList.where((element) => element.nameAr.contains(value)).toList();
    }
    searchList = searchResult;
    setState(() {

    });
  }

  Future <void> onSuraClick(Sura sura) async {
    Navigator.pushNamed(context, SuraDetails.routeName , arguments: sura);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? surasIds = preferences.getStringList('mostRecent') ?? [];
    if (surasIds.contains(sura.id.toString())) {
      surasIds.removeWhere((id) => id == sura.id.toString());
    }
    surasIds = [sura.id.toString(), ...surasIds];
    await preferences.setStringList("mostRecent", surasIds);
    readMostRecentSura();
  }
  Future <void> readMostRecentSura () async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? surasIds = preferences.getStringList('mostRecent') ?? [];

    mostRecent = [];

    for (var value in surasIds) {
      mostRecent.add(
        fullList.firstWhere((element) => element.id.toString() == value),
      );
    }
    print(mostRecent);
    setState(() {

    });
  }
    }

