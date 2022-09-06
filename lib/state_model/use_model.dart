import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/mode/login_model.dart';
import 'package:flutter_application_pc_1/util/util.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Obtain shared preferences.

class UserModel_Provider with ChangeNotifier, DiagnosticableTreeMixin {
  int? _userId;
  Profile? _userProfile;
  String _cookie = '';
  bool _is_login = false;
  int? get userId => _userId;
  Profile? get userProfile => _userProfile;
  String get cookie => _cookie;
  bool get is_login => _is_login;
  UserModel_Provider() {
    _init();
  }
  _init() async {
    // _cookie = LocalStorage.getValue('mu_cookie') ?? '';

    // notifyListeners();
  }

  void set_userId(int id) {
    _userId = id;
    notifyListeners();
  }

  void set_islogin(bool v) {
    _is_login = v;
    notifyListeners();
  }

  void set_userProfile(Profile value) async {
    _userProfile = value;
    LocalStorage.saveValue<String>('mu_profile', json.encode(value));
  }

  void set_cookie(String value) async {
    _cookie = value;
    LocalStorage.saveValue<String>('mu_cookie', value);
    notifyListeners();
  }
}
