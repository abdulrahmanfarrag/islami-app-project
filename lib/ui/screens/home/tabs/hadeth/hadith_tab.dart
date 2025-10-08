import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami_app2/core/styles/app_images.dart';
import 'package:islami_app2/ui/screens/home/models/hadeth.dart';
import '../base_Tab_widget/base_tab_widget.dart';
import 'hadeth_details_screen.dart';
import 'hadith_card.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<Hadeth> ahadeth = [];

  @override
  void initState() {
    super.initState();
    getHadethList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTabWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ahadeth.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CarouselSlider(
          items: ahadeth.map((hadeth) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HadithDetailsScreen(hadeth: hadeth),
                  ),
                );
              },
              child: HadithCard(hadeth: hadeth),
            );
          }).toList(),
          options: CarouselOptions(
            height: double.infinity,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            enlargeFactor: 0.25,
          ),
        ),
      ),
    );
  }

  Future<void> getHadethList() async {
    var data = await rootBundle.loadString('lib/assets/files/ahadeth.txt');
    var ahadethData = data.split('#');

    ahadeth = ahadethData.map((hadethText) {
      hadethText = hadethText.trim();
      if (hadethText.isEmpty) return null;

      var lines = hadethText.split('\n');
      var title = lines.first.trim();
      var content = lines.skip(1).join('\n').trim();

      return Hadeth(name: title, content: content);
    }).whereType<Hadeth>().toList();

    setState(() {});
  }
}