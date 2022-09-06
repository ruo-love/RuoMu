import 'package:flutter/material.dart';

// 颜色配置
class AppColor {
  static const Color primary = Color(0xffffffff);
  static const Color primary_deep1 = Color(0xff1e1e62);
  static const Color primary_deep2 = Color(0xff222222);
  static const Color primary_deep3 = Colors.amber;
  static const Color border_gray = Color(0xffe1e1e1);
  static const Color success = Color(0xff07c160);

  static const Color danger = Color(0xffee0a24);

  static const Color warning = Color(0xffffba00);

  static const Color info = Color(0xff00a1d6);

  static const Color active = Color(0xff464646);

  static const Color unactive = Color(0xff7b7b7b);

  static const Color un2active = Color(0xff8d8d8d);

  static const Color un3active = Color(0xffb1b1b1);

  static const Color page = Color.fromRGBO(255, 255, 255, 1);

  static const Color nav = Color(0xfffbfbfb);

  static const Color border = Color(0xfff5f5f5);

  static const Color font = Color(0xff292d3e);

  // 颜色值转换
  static Color string2Color(String colorString) {
    int value = 0x00000000;
    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }
      value = int.tryParse(colorString, radix: 16) ?? 0;
      if (value != null) {
        if (value < 0xFF000000) {
          value += 0xFF000000;
        }
      }
    }
    return Color(value);
  }
}
