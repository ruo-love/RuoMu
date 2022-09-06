import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/pages/my_drawer.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(),
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: AppColor.primary_deep3,
            size: 30,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 40, bottom: 20),
            padding: EdgeInsets.all(10),
            height: 100,
            color: AppColor.primary,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                    top: -40,
                    left: (MediaQuery.of(context).size.width - 40) / 2 - 40,
                    child: CircleAvatar(
                      radius: 36,
                      foregroundImage: NetworkImage(
                          'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F88f7509f2d45a7f15108eee7c681182ee39e36c829475-k2VyDs_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1663147360&t=92bace8e6d5114ba61ac967e451ab6e4'),
                    )),
                Positioned(
                  left: (MediaQuery.of(context).size.width - 40) / 2 - 60,
                  bottom: 0,
                  child: Column(
                    children: [
                      Text(
                        '若若',
                        style: TextStyle(
                            fontSize: 18, color: AppColor.primary_deep2),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text('24 关注'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text('2 粉丝'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text('Lv 7'),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            color: AppColor.primary,
            height: 150,
            child: GridView.count(
              crossAxisCount: 4,
              children: [
                InfoIcon(
                  icon: Icons.play_circle_fill,
                  text: '播放',
                ),
                InfoIcon(
                  icon: Icons.queue_music,
                  text: '音乐',
                ),
                InfoIcon(
                  icon: Icons.cloud_circle,
                  text: '云盘',
                ),
                InfoIcon(
                  icon: Icons.work,
                  text: '购物',
                ),
                InfoIcon(
                  icon: Icons.face,
                  text: '好友',
                ),
                InfoIcon(
                  icon: Icons.star,
                  text: '播放',
                ),
                InfoIcon(
                  icon: Icons.hearing,
                  text: '播客',
                ),
                InfoIcon(
                  icon: Icons.apps,
                  text: '其他',
                ),
              ],
            ),
          ),
          Container(
              height: 200,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              color: AppColor.primary,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '个人Flutter 学习项目',
                    style: TextStyle(
                      fontSize: 16,
                      // overflow: TextOverflow.ellipsis,
                      color: AppColor.un3active,
                    ),
                  ),
                  Text(
                    '不涉及任何商业 切勿传播',
                    style: TextStyle(
                      fontSize: 16,
                      // overflow: TextOverflow.ellipsis,
                      color: AppColor.un3active,
                    ),
                  ),
                  Text(
                    '联系邮箱:1103661612@qq.com',
                    style: TextStyle(
                      fontSize: 16,
                      // overflow: TextOverflow.ellipsis,
                      color: AppColor.un3active,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class InfoIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const InfoIcon({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.red,
          size: 30,
        ),
        Text(
          text,
          maxLines: 1,
          style: TextStyle(
            // overflow: TextOverflow.ellipsis,
            color: AppColor.primary_deep2,
          ),
        )
      ],
    );
  }
}
