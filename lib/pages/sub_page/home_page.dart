import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/banner.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/components/root_page_head.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/banner_model.dart';
import 'package:flutter_application_pc_1/pages/my_drawer.dart';
import 'package:flutter_application_pc_1/pages/sub_page/home_tabs_content/hot_mv.dart';
import 'package:flutter_application_pc_1/pages/sub_page/home_tabs_content/hot_singer.dart';
import 'package:flutter_application_pc_1/pages/sub_page/home_tabs_content/new_songs.dart';
import 'package:flutter_application_pc_1/pages/sub_page/home_tabs_content/recommend.dart';
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Banners> _banners = <Banners>[];
  TextEditingController _keyWord = TextEditingController();
  List<Tab> _tabs = [
    Tab(text: '推荐'),
    Tab(text: '新歌'),
    Tab(text: '歌手'),
    Tab(text: 'MV'),
    Tab(text: '文章'),
    Tab(text: '视频'),
    Tab(text: '歌单'),
    Tab(text: '游戏'),
  ];
  List<Widget> _tabsContent = [
    RecommendContent(),
    NewSongs(),
    HotSinger(),
    HotVideo(),
    RecommendContent(),
    NewSongs(),
    HotSinger(),
    HotVideo(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _tabController =
          TabController(initialIndex: 0, length: _tabs.length, vsync: this);
    });
    //tab 切换监听
    _tabController.addListener(() async {});
    _getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MyDrawer(),
      appBar: AppBar(
        elevation: 0,
        title: TextField(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          controller: _keyWord,
          style: TextStyle(color: AppColor.primary_deep3, fontSize: 14),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.primary,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            //内边距设置
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary_deep3)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.primary_deep3)),
            labelText: '搜索歌曲',
            labelStyle: TextStyle(
              color: AppColor.un2active,
              fontSize: 12,
            ),
          ),
        ),
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
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              Icons.search_outlined,
              color: AppColor.primary_deep3,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 140,
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Swiper(
                key: GlobalKey(),
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage.assetNetwork(
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      placeholder: 'assets/images/lazy-1.png',
                      image: _banners[index].pic!);
                },
                itemCount: _banners.length,
                pagination: SwiperPagination(
                  builder: DotSwiperPaginationBuilder(
                      color: Color.fromRGBO(200, 200, 200, 0.5),
                      size: 8.0,
                      activeSize: 10.0),
                ), //
              ),
            ),
          ),
          TabBar(
            indicatorColor: AppColor.primary_deep3,
            labelColor: AppColor.primary_deep3,
            unselectedLabelColor: AppColor.un2active,
            tabs: _tabs,
            controller: _tabController,
            isScrollable: true,
          ),
          Expanded(
            child: TabBarView(
              children: _tabsContent,
              controller: _tabController,
            ),
          )
        ],
      ),
    );
  }

  Future _getBanners() async {
    List<Banners> res = await getBannerList();
    setState(() {
      _banners = res;
    });
  }
}
