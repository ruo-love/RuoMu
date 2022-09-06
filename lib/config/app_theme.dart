import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';

final ThemeData themeData = ThemeData(
  primaryColor: AppColor.primary, //系统主题色
  scaffoldBackgroundColor: AppColor.page, //背景色
  indicatorColor: AppColor.active, //选项卡激活色
  highlightColor: Colors.transparent, //取消水波纹
  splashColor: Colors.transparent, //取消水波纹
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: AppColor.active, fontSize: 16),
    bodyText2: TextStyle(color: AppColor.un3active, fontSize: 12),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColor.primary_deep3,
      statusBarIconBrightness: Brightness.light,
    ),
    color: AppColor.primary,
    titleTextStyle: TextStyle(
      color: AppColor.font,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColor.nav,
    selectedItemColor: AppColor.active,
    unselectedItemColor: AppColor.unactive,
    selectedLabelStyle: TextStyle(fontSize: 12),
  ),
);
