import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../../core/styles/Text_Styles.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.black,


      pages: [
        PageViewModel(
           titleWidget: const SizedBox.shrink(),
          bodyWidget: Column(
            children: [
              Image(image: AssetImage('lib/assets/images/ImageHeader.png')),
               SizedBox(height: 20),
              Image(image: AssetImage('lib/assets/images/Frame 3.png')),
              SizedBox(height: 20,),
              Text('Welcome To Islmi App' , style: TextStyles.LargeTitleTextStyle(),)
            ],
          ),

        ),
        
        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Column(
            children: [
              Image(image: AssetImage('lib/assets/images/ImageHeader.png')),
              SizedBox(height: 20,),
              Image(image: AssetImage('lib/assets/images/Frame 3 (1).png'), height: 300,),
              SizedBox(height: 20,),
              Text('Welcome To Islmi', style: TextStyles.LargeTitleTextStyle()),
              SizedBox(height: 20,),
              Text('We Are Very Excited To Have You In Our Community' , style: TextStyles.LargeTitleTextStyle())
            ],
          ),
        ),
        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Column(
            children: [
              Image(image: AssetImage('lib/assets/images/ImageHeader.png')),
              SizedBox(height: 20,),
              Image(image: AssetImage('lib/assets/images/Frame 3 (2).png'), height: 320,),
              SizedBox(height: 20,),
              Text('Reading the Quran', style: TextStyles.LargeTitleTextStyle()),
              SizedBox(height: 20,),
              Text('Read, and your Lord is the Most Generous' , style: TextStyles.LargeTitleTextStyle())
            ],
          ),
        ),

        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Column(
            children: [
              Image(image: AssetImage('lib/assets/images/ImageHeader.png')),
              SizedBox(height: 20,),
              Image(image: AssetImage('lib/assets/images/Frame 3 (3).png'), height: 320,),
              SizedBox(height: 20,),
              Text('Bearish', style: TextStyles.LargeTitleTextStyle()),
              SizedBox(height: 20,),
              Text('Praise the name of your Lord, the Most High' , style: TextStyles.LargeTitleTextStyle())
            ],
          ),
        ),

        PageViewModel(
          titleWidget: SizedBox.shrink(),
          bodyWidget: Column(
            children: [
              Image(image: AssetImage('lib/assets/images/ImageHeader.png')),
              SizedBox(height: 20,),
              Image(image: AssetImage('lib/assets/images/Frame 3 (4).png'), height: 280,),
              SizedBox(height: 20,),
              Text('Holy Quran Radio', style: TextStyles.LargeTitleTextStyle()),
              SizedBox(height: 20,),
              Text('You can listen to the Holy Quran Radio through the application for free and easily' , style: TextStyles.LargeTitleTextStyle())
            ],
          ),
        ),
      ],

      showSkipButton: true,
      skip: const Text("Skip"),

      showBackButton: true,
      back: const Text('Back'),

      showNextButton: true,
      next: const Text('Next'),

      showDoneButton: true,
      done: const Text('Done', ),

      onDone: () {
        Navigator.of(context).pushReplacementNamed("home");
      },

      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xff707070),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xffFFD482),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
