import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pc_1/api/login.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/login_model.dart';
import 'package:flutter_application_pc_1/state_model/use_model.dart';
import 'package:flutter_application_pc_1/util/util.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _form_key = GlobalKey<FormState>();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primary,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            LoginFormBody(context),
            Expanded(
              child: Column(
                children: [
                  Divider(
                    height: 20.0,
                    indent: 90.0,
                    endIndent: 90.0,
                    color: AppColor.un2active,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.tablet_android,
                                color: AppColor.primary_deep3,
                                size: 26,
                              ),
                            ),
                            Text(
                              '短信验证',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColor.un3active,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            try {
                              TouristLoginModel res = await loginByTourist();
                              context.read<UserModel_Provider>()
                                ..set_cookie(res.cookie!)
                                ..set_userId(res.userId!)
                                ..set_islogin(true);
                              Navigator.pushReplacementNamed(context, '/root');
                            } catch (err) {
                              print(err);
                            }
                          },
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: AppColor.primary_deep3,
                                  size: 26,
                                ),
                              ),
                              Text(
                                '游客登录',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColor.un3active,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget LoginFormBody(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: toRpx(context, 40),
        ),
        child: Form(
          key: _form_key,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,
                style: TextStyle(color: AppColor.primary_deep3),
                controller: _phone,
                decoration: InputDecoration(
                  filled: true,

                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10.0), //内边距设置

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColor.border_gray,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColor.border_gray,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  fillColor: AppColor.primary,
                  counter: Text('${_phone.text.length}/11'),

                  labelText: '请输入手机号',
                  labelStyle: TextStyle(
                    color: AppColor.un2active,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.people,
                    color: AppColor.primary_deep3,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(
                height: toRpx(context, 18),
              ),
              TextFormField(
                controller: _password,
                maxLength: 16,
                style: TextStyle(color: AppColor.primary_deep3),
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 10.0), //内边距设置

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColor.border_gray,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: AppColor.border_gray,
                    ),
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  fillColor: AppColor.primary,
                  labelText: '请输入验证码',
                  labelStyle: TextStyle(
                    color: AppColor.un2active,
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.password_sharp,
                    color: AppColor.primary_deep3,
                    size: 24,
                  ),
                ),
              ),
              Spacer(),
              SignInButtonWarp(context),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget SignInButtonWarp(BuildContext context) => Container(
      height: 38,
      margin: EdgeInsets.symmetric(horizontal: 40),
      padding: EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary_deep2,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColor.un2active,
            blurRadius: 104,
            offset: Offset(0, 0),
            spreadRadius: 10,
            blurStyle: BlurStyle.inner,
          )
        ],
      ),
      child: MaterialButton(
        padding: EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColor.primary_deep3,
                ),
              ),
            ),
            Icon(
              Icons.login_rounded,
              color: AppColor.primary_deep3,
              size: 30,
            ),
          ],
        ),
        onPressed: () async {
          try {
            TouristLoginModel res = await loginByTourist();
            context.read<UserModel_Provider>()
              ..set_cookie(res.cookie!)
              ..set_userId(res.userId!)
              ..set_islogin(true);
            Navigator.pushReplacementNamed(context, '/root');
          } catch (err) {
            print(err);
          }
        },
      ));
}
