import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'dart:async';
import 'package:flutter_application_pc_1/pages/root_page.dart';

class TransitPage extends StatefulWidget {
  const TransitPage({Key? key}) : super(key: key);

  @override
  State<TransitPage> createState() => _TransitPageState();
}

class _TransitPageState extends State<TransitPage> {
  int _currentTime = 6;
  late Timer _timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(
      Duration(milliseconds: 1000),
      (timer) {
        setState(
          () {
            _currentTime--;
          },
        );
        if (_currentTime <= 0) {
          _timer.cancel();
          _jumpRootPage();
        }
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

//跳转首页
  void _jumpRootPage() {
    Navigator.pushReplacementNamed(context, '/root');
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: Text(
                '聆听生活,感悟人生',
                style: TextStyle(
                  letterSpacing: 4,
                  fontFamily: 'Titillium',
                  color: AppColor.un2active,
                  fontSize: 18,
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: MediaQuery.of(context).padding.top + 10,
              child: InkWell(
                child: _clipButton(),
                onTap: _jumpRootPage,
              ),
            )
          ],
        ),
      ),
    );
  }

  //跳过按钮
  Widget _clipButton() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
        color: Colors.black54,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '跳过',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
          Text(
            '${_currentTime}s',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          )
        ],
      ),
    );
  }
}
