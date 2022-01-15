import 'package:Hayah_Clinic/shared/methods.dart';
import 'package:Hayah_Clinic/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: defColor,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      fontFamily: 'Jannah',
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defColor,
    unselectedItemColor: Colors.grey[700],
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  // textTheme: Theme.of(getCurrentContext()).textTheme.apply(
  //   bodyColor: Colors.white,
  // ),
  hintColor: Colors.white,
  primaryTextTheme: Typography(platform: TargetPlatform.android).white,
  textTheme: Typography(platform: TargetPlatform.android).white,
  fontFamily: 'Jannah',
);