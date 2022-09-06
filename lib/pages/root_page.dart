import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/components/global_audio_player.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/recommend_song_model.dart';
import 'package:flutter_application_pc_1/pages/my_drawer.dart';
import 'package:flutter_application_pc_1/pages/sub_page/home_page.dart';
import 'package:flutter_application_pc_1/pages/sub_page/song_list_category_page.dart';
import 'package:flutter_application_pc_1/pages/sub_page/profile_page.dart';
import 'package:flutter_application_pc_1/pages/sub_page/tiny_video_page.dart';
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:flutter_application_pc_1/state_model/use_model.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:audioplayers/audioplayers.dart';

class RootPage extends StatefulWidget {
  RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

//页面集合
  final List<Widget> _pages = [
    HomePage(),
    SongListCategoryPage(),
    TinyVideoPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: AppColor.primary,
          boxShadow: [
            BoxShadow(
              color: AppColor.un3active,
              blurRadius: 25,
              offset: Offset(0, -10),
              spreadRadius: -15,
            ),
          ],
        ),
        height: 50,
        child: _currentIndex == 2
            ? SizedBox(
                height: 0,
              )
            : GlobalAudioPlayer(
                controlBack: () {
                  Provider.of<AudioPlayerModel_Provider>(context, listen: false)
                      .stop();
                },
                playing:
                    context.select((AudioPlayerModel_Provider _) => _.playing_),
                name: context.select((AudioPlayerModel_Provider _) => _.name_),
                singer:
                    context.select((AudioPlayerModel_Provider _) => _.singer_),
                pic: context.select((AudioPlayerModel_Provider _) => _.pic_),
              ),
      ),
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        color: AppColor.primary_deep3,
        animationCurve: Curves.easeOutSine,
        height: 50,
        letIndexChange: (value) {
          setState(() {
            _currentIndex = value;
          });
          return true;
        },
        backgroundColor: Colors.white.withOpacity(0.1),
        items: <Widget>[
          Icon(
            Icons.queue_music_outlined,
            size: 26,
            color: AppColor.primary,
          ),
          Icon(
            Icons.cloud,
            size: 26,
            color: AppColor.primary,
          ),
          Icon(
            Icons.local_activity,
            size: 26,
            color: AppColor.primary,
          ),
          Icon(
            Icons.perm_identity,
            size: 26,
            color: AppColor.primary,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: _pages[_currentIndex], //根据底部导航索引 动态更新页面
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // Provider.of<AudioPlayerModel_Provider>(context, listen: false).audioPlayer
  }
}
