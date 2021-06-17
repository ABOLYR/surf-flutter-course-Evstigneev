import 'package:flutter/material.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/style.dart';

final ChangeNotifier changeNotifier = ChangeNotifier();

final lightTheme = ThemeData(
  primaryColor: white,
  secondaryHeaderColor: whiteSmoke,
  backgroundColor: white,
  scaffoldBackgroundColor: white,
  appBarTheme: AppBarTheme(
    backgroundColor: white,
  ),
  iconTheme: IconThemeData(
    color: white,
  ),
  selectedRowColor: selectedTabColor,
  unselectedWidgetColor: whiteSmoke,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: white,
    selectedItemColor: visitingScreenSelectedColor,
    unselectedItemColor: grey,
  ),
  textTheme: TextTheme(
    headline6: headline6TextStyle,
    headline5: headline5TextStyle,
    headline4: headline4TextStyle, //Sight list appBar
    headline3: headline3TextStyle,
    headline2: headline2TextStyle,
    headline1: headline1TextStyle,
    subtitle1: subtitle1TextStyle, //Sight type
    subtitle2: subtitle2TextStyle,
    bodyText1: bodyText1TextStyle,
  ),
  primaryIconTheme: primaryIconTheme,
  sliderTheme: SliderThemeData(
    activeTrackColor: filterScreenLightColor,
    inactiveTrackColor: grey,
    thumbColor: white,
    trackHeight: 2,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(white),
    trackColor: MaterialStateProperty.all(grey),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: headline2TextStyle.copyWith(color: grey, fontWeight: FontWeight.w400),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: green,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: green,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: visitingScreenSelectedColor,
  ),
);

final darkTheme = ThemeData(
  primaryColor: backgroundDark,
  secondaryHeaderColor: secondaryHeaderColorDark,
  backgroundColor: backgroundDark,
  scaffoldBackgroundColor: backgroundDark,
  appBarTheme: AppBarTheme(
      backgroundColor: backgroundDark,
  ),
  iconTheme: IconThemeData(
    color: white,
  ),
  selectedRowColor: whiteSmoke,
  unselectedWidgetColor: secondaryHeaderColorDark,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: white,
    selectedItemColor: visitingScreenSelectedColor,
    unselectedItemColor: grey,
  ),
  textTheme: TextTheme(
    headline6: headline6TextStyle.copyWith(color: white),
    headline5: headline5TextStyle.copyWith(color: white),
    headline4: headline4TextStyle.copyWith(color: white),
    headline3: headline3TextStyle.copyWith(color: white), //Sight list appBar
    headline2: headline2TextStyle.copyWith(color: white),
    subtitle1: subtitle1TextStyle.copyWith(color: grey), //Sight type
    subtitle2: subtitle2TextStyle,
    bodyText1: bodyText1TextStyle.copyWith(color: white),
  ),
  primaryIconTheme: primaryIconTheme.copyWith(color: white),
  sliderTheme: SliderThemeData(
    activeTrackColor: filterScreenLightColor,
    inactiveTrackColor: grey,
    thumbColor: white,
    trackHeight: 2,
  ),
  dividerColor: grey.withOpacity(0.8),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all(white),
    trackColor: MaterialStateProperty.all(filterScreenLightColor),
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: headline2TextStyle.copyWith(color: white, fontWeight: FontWeight.w400),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: green,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: green,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: visitingScreenSelectedColor,
  ),
);

const IconThemeData
primaryIconTheme = IconThemeData(
    color: visitingScreenSelectedColor,
);