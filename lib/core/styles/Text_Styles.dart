import "package:flutter/material.dart";
import "app_color.dart";


class TextStyles {

  static TextStyle LargeTitleTextStyle({Color TextStyles = AppColor.gold}){
    return TextStyle(
      color: TextStyles,
      fontSize: 24,
      fontWeight: FontWeight.w900,
      fontFamily: 'janna'
    );
  }

  static TextStyle MediumTitleTextStyle({Color TextStyles = AppColor.gold}){
    return TextStyle(
        color: TextStyles,
        fontSize: 22,
        fontWeight: FontWeight.w900,
        fontFamily: 'janna'
    );
  }

  static TextStyle SmallTitleTextStyle({Color TextStyles = AppColor.gold}){
    return TextStyle(
        color: TextStyles,
        fontSize: 20,
        fontWeight: FontWeight.w900,
        fontFamily: 'janna'
    );
  }


  static TextStyle LargeLabelTextStyle({Color TextStyles = AppColor.gold}){
    return TextStyle(
        color: TextStyles,
        fontSize: 22,
        fontWeight: FontWeight.w900,
        fontFamily: 'janna'
    );
  }

  static TextStyle MediumLabelTextStyle({Color TextStyles = AppColor.gold}){
    return TextStyle(
        color: TextStyles,
        fontSize: 20,
        fontWeight: FontWeight.w900,
        fontFamily: 'janna'
    );
  }

  static TextStyle SmallLabelTextStyle({Color TextStyles = AppColor.gold}){
    return TextStyle(
        color: TextStyles,
        fontSize: 18,
        fontWeight: FontWeight.w900,
        fontFamily: 'janna'
    );
  }

  static TextStyle LargeBodyTextStyle({Color TextStyles = AppColor.white}){
    return TextStyle(
        color: TextStyles,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: 'janna'
    );
  }

  static TextStyle MediumBodyTextStyle({Color TextStyles = AppColor.white}){
    return TextStyle(
        color: TextStyles,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: 'janna'
    );
  }

  static TextStyle SmallBodyTextStyle({Color TextStyles = AppColor.white}){
    return TextStyle(
        color: TextStyles,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'janna'
    );
  }
}