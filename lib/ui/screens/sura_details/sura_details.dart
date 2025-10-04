import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app2/core/styles/Text_Styles.dart';
import 'package:islami_app2/core/styles/app_color.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/ui/screens/home/models/sura.dart';

class SuraDetails extends StatefulWidget {

  static const String routeName = 'sura_details';
final Sura sura;

  SuraDetails({super.key, required this.sura});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {

 String? suraContent;

  @override
  Widget build(BuildContext context) {
    if(suraContent == null) {
      loadSuraDetails();
    }
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: AppBar(
        backgroundColor: AppColor.black,
        foregroundColor: AppColor.gold ,
        title: Text(widget.sura.nameEn),
        surfaceTintColor: Colors.transparent,
      ),
      body: suraContent == null? Center(child: CircularProgressIndicator(),):

      Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Image.asset(AppImages.leftCorner),
                Expanded(child:
                Text(widget.sura.nameAr, style: TextStyles.LargeLabelTextStyle(TextStyles: AppColor.gold),
                  textAlign: TextAlign.center,) ),
                Image.asset(AppImages.rightCorner),
              ],
            ),
          ),
          Expanded(child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child:Text(suraContent!, style: TextStyles.LargeBodyTextStyle(TextStyles: AppColor.gold),
            textAlign: TextAlign.center,) ,)),
          Image.asset(AppImages.bottomDecoration),
        ],
      )
    );
  }

  Future <void> loadSuraDetails() async {
   var sura = await rootBundle.loadString('lib/assets/files/${widget.sura.id}.txt');
 var ayas = sura.split('\n');

 String formatedSura = '';

 for( int i = 0; i<ayas.length ; i++){
   formatedSura = "$formatedSura{${i+1}}${ayas[i].trim() } ";
 }
suraContent = formatedSura;
 setState(() {

 });
  }
}