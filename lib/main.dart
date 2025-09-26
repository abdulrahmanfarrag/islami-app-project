import 'package:flutter/material.dart';
import 'package:islami_app2/ui/screens/home/home_screen.dart';
import 'package:islami_app2/ui/screens/onboarding_screen.dart';

import 'ui/screens/home/models/sura.dart';
import 'ui/screens/sura_details/sura_details.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/OnBoarding',
      routes: {
        '/OnBoarding': (context) => OnboardingScreen(),
        'home': (context) => (HomeScreen()),
        'sura_details' : (context) {
          var   sura = ModalRoute.of(context)?.settings.arguments as Sura;
          return SuraDetails(sura: sura,);

        }

      },
    );
  }

}