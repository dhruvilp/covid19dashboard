import 'package:flutter/material.dart';

var blue = Colors.blueAccent[700];
var blueLight = Colors.blueAccent;
var blueDark = Colors.blue[900];
const pink = const Color(0xFFF45B69);

const red = const Color(0xFFcc0000);
const red_light = const Color(0xFFdb4c4c);
const yellow = const Color(0xFFf2b022);
const yellow_light = const Color(0xFFf5c152);
const green = const Color(0xFF359935);
const green_light = const Color(0xFF3caf3c);

/// Black & White
const white = Colors.white;
const grey_light = const Color(0xFFe1e6e8);
const grey = const Color(0xFF898c8c);
const charcoal_light = const Color(0xFF4a4a4a);
const charcoal = const Color(0xFF292929);
const charcoal_dark = const Color(0xFF1A1A1A);
const black = Colors.black;
const semi_transparent = Colors.black87;
const transparent = const Color(0x00ffffff);
const box_shadow = const Color(0x0d000000);
const overlay = const Color.fromRGBO(0, 0, 0, 80);

/*
NAME       SIZE   WEIGHT   SPACING  2018 NAME
display4   112.0  thin     0.0      headline1
display3   56.0   normal   0.0      headline2
display2   45.0   normal   0.0      headline3
display1   34.0   normal   0.0      headline4
headline   24.0   normal   0.0      headline5
title      20.0   medium   0.0      headline6
subhead    16.0   normal   0.0      subtitle1
body2      14.0   medium   0.0      body1
body1      14.0   normal   0.0      body2
caption    12.0   normal   0.0      caption
button     14.0   medium   0.0      button
subtitle   14.0   medium   0.0      subtitle2
overline   10.0   normal   0.0      overline
*/

/// Themes
final kLightTheme = _buildLightTheme();
final kDarkTheme = _buildDarkTheme();

///---------------------------------------
///             LIGHT THEME
///---------------------------------------
ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    primaryColor: blue,
    primaryColorLight: white,
    primaryColorDark: blueDark,
    accentColor: pink,
    backgroundColor: white,
    scaffoldBackgroundColor: white,
    canvasColor: transparent,
    textTheme: TextTheme(
      display4: TextStyle(fontSize: 100.0, color: blue, fontWeight: FontWeight.w600,),
      display3: TextStyle(fontSize: 90.0, color: blue, fontWeight: FontWeight.bold,),
      display2: TextStyle(fontSize: 45.0, color: blue,),
      display1: TextStyle(fontSize: 35.0, color: blue,),
      headline: TextStyle(fontSize: 25.0, color: charcoal_light, fontWeight: FontWeight.w700,),
      title: TextStyle(fontSize: 20.0, color: blue, fontWeight: FontWeight.w700,),
      subhead: TextStyle(fontSize: 18.0, color: charcoal_light, fontWeight: FontWeight.w700,),
      body2: TextStyle(color: blue, fontWeight: FontWeight.w700,),
      body1: TextStyle(fontSize: 16.0, color: charcoal_light, fontWeight: FontWeight.w700,),
    ),
  );

  return base;
}

///---------------------------------------
///             DARK THEME
///---------------------------------------
ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    primaryColor: blueLight,
    primaryColorLight: grey,
    primaryColorDark: blue,
    accentColor: pink,
    backgroundColor: charcoal,
    scaffoldBackgroundColor: charcoal,
    canvasColor: transparent,
    textTheme: TextTheme(
      display4: TextStyle(fontSize: 100.0, color: blueLight, fontWeight: FontWeight.w200,),
      display3: TextStyle(fontSize: 90.0, color: blueLight, fontWeight: FontWeight.bold,),
      display2: TextStyle(fontSize: 45.0, color: blueLight,),
      display1: TextStyle(fontSize: 35.0, color: blueLight,),
      headline: TextStyle(fontSize: 25.0, color: white, fontWeight: FontWeight.w200,),
      title: TextStyle(fontSize: 20.0, color: blueLight, fontWeight: FontWeight.w200,),
      subhead: TextStyle(fontSize: 18.0, color: white,),
      body2: TextStyle(color: blueLight, fontWeight: FontWeight.w700,),
      body1: TextStyle(color: white, fontWeight: FontWeight.w700,),
    ),
  );

  return base;
}