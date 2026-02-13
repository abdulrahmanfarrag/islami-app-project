import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/ui/screens/home/tabs/hadith_tab.dart';
import 'package:islami_app2/ui/screens/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app2/ui/screens/home/tabs/radio_tab.dart';
import 'package:islami_app2/ui/screens/home/tabs/sebha_tab.dart';
import 'package:islami_app2/ui/screens/home/tabs/time_tab.dart';
import '../../../core/styles/app_color.dart';

class HomeScreen extends StatefulWidget{

  const HomeScreen({super.key});
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
List<Widget> tabs = [
  QuranTab(),
  HadithTab(),
  SebhaTab(),
  RadioTab(),
  TimeTab(),
];

List<String> backgroundImages = [
  AppImages.quranBg
  ,AppImages.hadethBg
  ,AppImages.sebhaBg
  ,AppImages.radioBg
  ,AppImages.timeBg
  ];

  @override
  Widget build(BuildContext context) {
    return

      Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(backgroundImages [selectedIndex]), fit: BoxFit.fill)
        ),
        child : Scaffold(
        backgroundColor: Colors.transparent,
        body: tabs[selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 120,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (newIndex) {
              selectedIndex = newIndex;
              setState(() {});
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.gold,
            unselectedItemColor: AppColor.black,
            selectedItemColor: AppColor.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(icon:
              CustomBottomNavigationBar(
                imagePath: AppImages.icQuran,
                  isSelected: selectedIndex== 0
                   ),
                label: 'Quran'
              ),
              BottomNavigationBarItem(icon: CustomBottomNavigationBar(
                  isSelected: selectedIndex== 1,
                  imagePath:AppImages.moshaf),
                  label: 'Hadith'),

              BottomNavigationBarItem(icon: CustomBottomNavigationBar(
                  isSelected: selectedIndex== 2,
                  imagePath:AppImages.icSebha ),
                  label: 'Sebha'),

              BottomNavigationBarItem(icon: CustomBottomNavigationBar(
                  isSelected: selectedIndex== 3,
                  imagePath:AppImages.icRadio ),
              label: 'Radio'),
              BottomNavigationBarItem(icon: CustomBottomNavigationBar(
                  isSelected: selectedIndex== 4,
                  imagePath:AppImages.icTime ),
                  label: 'Time'),
            ],
          ),
        ),
      ),
      );


  }
}



class CustomBottomNavigationBar extends StatelessWidget {

  final bool isSelected;
  final String imagePath;

  const CustomBottomNavigationBar({super.key, required this.isSelected, required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(duration: Duration(milliseconds: 300 ),
    transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child,),
    child: isSelected? Container(
       padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.black.withAlpha(50),
        borderRadius: BorderRadius.circular(100),

      ),
      child: ImageIcon(AssetImage(imagePath)),


    ): ImageIcon(AssetImage(imagePath))
    );
  }

}