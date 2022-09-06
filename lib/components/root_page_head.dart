import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';

class RootPageHead extends StatelessWidget {
  RootPageHead({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 40,
        ),
        Expanded(
          child: _searchContent(),
        )
      ],
    );
  }

  TextEditingController _keyword = TextEditingController();
  Widget _searchContent() {
    return Container(
      height: 30,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.page,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _keyword,
        textAlignVertical: TextAlignVertical.center,
        //垂直居中
        decoration: InputDecoration(
          isCollapsed: true, //垂直居中 需要开启
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.un3active,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints.tight(Size(38, 30)),
          prefixText: '',
          hintText: '搜索歌曲',
          hintStyle: TextStyle(
            color: AppColor.un3active,
            fontSize: 14,
          ),
          labelStyle: TextStyle(
            color: AppColor.un3active,
            fontSize: 14,
          ),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
