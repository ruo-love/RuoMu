import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: MediaQuery.of(context).size.width / 1.5,
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      child: Column(
        children: [
          SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.un3active.withOpacity(0.5),
                    foregroundImage: NetworkImage(
                        'https://tse3-mm.cn.bing.net/th/id/OIP-C.4vAGQPlNzINOZTxDQeM00AAAAA?pid=ImgDet&rs=1'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      '若若Music',
                      style: TextStyle(
                        color: AppColor.un2active,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.fullscreen_exit_outlined,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(14),
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.email,
                    size: 20,
                  ),
                  title: Text(
                    '我的消息',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.merge_type_outlined,
                    size: 20,
                  ),
                  title: Text(
                    '云贝中心',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.mic_none,
                    size: 20,
                  ),
                  title: Text(
                    '创作者中心',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(14),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.email,
                      size: 20,
                    ),
                    title: Text(
                      '云村有票',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.local_grocery_store,
                      size: 20,
                    ),
                    title: Text(
                      '商城',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.games_outlined,
                      size: 20,
                    ),
                    title: Text(
                      '游戏专区',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.grade_outlined,
                      size: 20,
                    ),
                    title: Text(
                      '个人中心',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.cloud_circle_outlined,
                      size: 20,
                    ),
                    title: Text(
                      '动态',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
