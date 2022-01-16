import 'package:Hayah_Clinic/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defColor,
  dividerTheme: DividerThemeData(
    color: defColor,
    thickness: 1,
  ),
  scaffoldBackgroundColor: HexColor('232526'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('232526'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('232526'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    actionsIconTheme: IconThemeData(color: defColor),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defColor,
    unselectedItemColor: Colors.grey[700],
    elevation: 20.0,
    backgroundColor: HexColor('232526'),
  ),
  hintColor: Colors.white,
  primaryTextTheme: Typography(platform: TargetPlatform.android).white,
  //textTheme: Typography(platform: TargetPlatform.android).white,
  textTheme: TextTheme(
    bodyText1: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
    subtitle1: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    subtitle2: TextStyle(
      color: Colors.white,
      fontSize: 16,
    ),
  ),
  fontFamily: 'Jannah',
);


ThemeData lightTheme = ThemeData(
    fontFamily: 'Jannah',
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
    dividerTheme: DividerThemeData(
      color: defColor,
      thickness: 1,
    ),
    primarySwatch: defColor,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: defColor,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        elevation: 20,
        backgroundColor: Colors.white));