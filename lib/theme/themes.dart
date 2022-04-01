import 'package:flutter/material.dart';

class MyThemes {
  static final ThemeData appDarkThemeData = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.white, // 主要部分背景颜色（导航和tabBar等）
      scaffoldBackgroundColor:
          Colors.red, //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
      textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.yellow, fontSize: 15)),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.yellow)));

//创建light ThemeData对象
  static final ThemeData appLightThemeData = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.black, // 主要部分背景颜色（导航和tabBar等）
      scaffoldBackgroundColor:
          Colors.white, //Scaffold的背景颜色。典型Material应用程序或应用程序内页面的背景颜色
      textTheme: const TextTheme(
          headline1: TextStyle(color: Colors.blue, fontSize: 15)),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: Colors.black)));
}
