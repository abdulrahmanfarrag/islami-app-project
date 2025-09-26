import 'package:flutter/material.dart';
import 'package:islami_app2/core/styles/app_images.dart';

class BaseTabWidget extends StatelessWidget{
  final Widget child ;

  const BaseTabWidget({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              Image.asset(AppImages.imageHeader, width: 300,),
            ],
          ),
          Expanded(child: child)
        ],
      ),
    );
  }

}