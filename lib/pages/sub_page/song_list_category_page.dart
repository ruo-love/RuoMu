import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/components/song_list_card.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/category_song_list.dart';
import 'package:flutter_application_pc_1/pages/my_drawer.dart';

class SongListCategoryPage extends StatefulWidget {
  SongListCategoryPage({Key? key}) : super(key: key);

  @override
  State<SongListCategoryPage> createState() => _SongListCategoryPageState();
}

class _SongListCategoryPageState extends State<SongListCategoryPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> _tabs = [];
  List<Widget> _tabsContent = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _tabController = TabController(initialIndex: 0, length: 10, vsync: this);
    });
    //tab 切换监听
    _tabController.addListener(() async {});
    _init();
  }

  _init() async {
    List<Tags> res = await getSongListCategory();
    setState(() {
      for (int i = 0; res.length > i; i++) {
        print(i);
        _tabs.add(Tab(text: res[i].name));
        _tabsContent.add(TabContent(cat: res[i].name!));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _tabs.isEmpty
        ? Container()
        : Scaffold(
            drawer: MyDrawer(),
            appBar: AppBar(
              bottom: TabBar(
                indicatorColor: AppColor.primary_deep3,
                labelColor: AppColor.primary_deep3,
                unselectedLabelColor: AppColor.un2active,
                tabs: _tabs,
                controller: _tabController,
                isScrollable: true,
              ),
              title: Text(
                '歌单广场',
                style: TextStyle(
                  color: AppColor.primary_deep3,
                  fontSize: 16,
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
              elevation: 0,
            ),
            body:
                TabBarView(controller: _tabController, children: _tabsContent));
  }
}

class TabContent extends StatefulWidget {
  String cat;
  TabContent({Key? key, required this.cat}) : super(key: key);

  @override
  State<TabContent> createState() => _TabContentState();
}

class _TabContentState extends State<TabContent>
    with AutomaticKeepAliveClientMixin {
  late List<Playlists> _songList = <Playlists>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init(widget.cat);
  }

  _init(String cat) async {
    List<Playlists> res = await getSongListCategoryDetail(cat);
    setState(() {
      _songList = res;
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GridView.builder(
      padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
      itemCount: _songList.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: MediaQuery.of(context).size.width / 2.2,
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (_, index) => SongListCard(
        id: _songList[index].id!,
        playCount: _songList[index].playCount!,
        cover: _songList[index].coverImgUrl!,
        desc: _songList[index].description!,
        onTap: (id) {
          Navigator.pushNamed(context, '/songlist', arguments: {
            'id': id,
            'cover': _songList[index].coverImgUrl!,
          });
        },
      ),
    );
  }
}
