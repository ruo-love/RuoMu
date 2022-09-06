import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

//px to rpx
double toRpx(BuildContext context, double size) {
  double rpx = MediaQuery.of(context).size.width / 412;
  return rpx * size;
}

String timeFormate(int time) {
  DateTime dataTime = DateTime.fromMillisecondsSinceEpoch(time);
  return "${dataTime.year}-${dataTime.month.toString().padLeft(2, '0')}-${dataTime.day.toString().padLeft(2, '0')}";
}

class LocalStorage {
  LocalStorage();
  static saveValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    print(T.toString());
    switch (T.toString()) {
      case 'String':
        break;
      case 'int':
        prefs.setInt(key, value as int);
        break;
      case 'bool':
        prefs.setBool(key, value as bool);
        break;
      case 'List<String>':
        prefs.setStringList(key, value as List<String>);
        break;
      default:
        print('ddddddddddddddddddd');
        break;
    }
  }

  static getValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static removeValue(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
