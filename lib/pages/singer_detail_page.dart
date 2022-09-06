import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_pc_1/api/singer_list.dart';
import 'package:flutter_application_pc_1/components/global_audio_player.dart';
import 'package:flutter_application_pc_1/components/lable_text.dart';
import 'package:flutter_application_pc_1/components/singer_album_card.dart';
import 'package:flutter_application_pc_1/components/song_line.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/singer_album_model.dart';
import 'package:flutter_application_pc_1/mode/singer_info_model.dart';
import 'package:flutter_application_pc_1/mode/singer_song_model.dart';
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:flutter_application_pc_1/util/util.dart';
import 'package:provider/provider.dart';

class SingerDetailPage extends StatefulWidget {
  final arguments;
  SingerDetailPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<SingerDetailPage> createState() => _SingerDetailPageState();
}

class _SingerDetailPageState extends State<SingerDetailPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> _tabs = [
    Tab(text: '主页'),
    Tab(text: '歌曲'),
    Tab(text: '专辑'),
  ];
  late List<Widget> _tabsContent = <Widget>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _tabController =
          TabController(initialIndex: 0, length: _tabs.length, vsync: this);
    });
    print(widget.arguments);
    _tabsContent.addAll([
      SingerInfo(id: widget.arguments['id']),
      SingerSongs(
        id: widget.arguments['id'],
        pic: widget.arguments['singerPic'],
      ),
      SingerAlbums(
        id: widget.arguments['id'],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: GlobalAudioPlayer(
          controlBack: () {
            Provider.of<AudioPlayerModel_Provider>(context, listen: false)
                .stop();
          },
          playing: context.select((AudioPlayerModel_Provider _) => _.playing_),
          name: context.select((AudioPlayerModel_Provider _) => _.name_),
          singer: context.select((AudioPlayerModel_Provider _) => _.singer_),
          pic: context.select((AudioPlayerModel_Provider _) => _.pic_),
        ),
      ),
      // No appbar provided to the Scaffold, only a body with a
      // CustomScrollView.
      body: CustomScrollView(
        slivers: <Widget>[
          // Add the app bar to the CustomScrollView.
          SliverAppBar(
            backgroundColor: AppColor.primary_deep2,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: AppColor.primary_deep3,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            pinned: true,

            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1,
              title: TabBar(
                indicatorColor: AppColor.primary_deep3,
                labelColor: AppColor.primary_deep3,
                unselectedLabelColor: AppColor.primary,
                tabs: _tabs,
                controller: _tabController,
              ),
              collapseMode: CollapseMode.parallax,
              background: Hero(
                tag: widget.arguments['singerPic'],
                child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/lazy-1.png',
                    image: widget.arguments['singerPic']),
              ),
            ),

            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 300,
          ),
          SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  56,
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      children: _tabsContent,
                      controller: _tabController,
                    ),
                  )
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}

class SingerInfo extends StatefulWidget {
  final int id;
  const SingerInfo({Key? key, required this.id}) : super(key: key);

  @override
  State<SingerInfo> createState() => _SingerInfoState();
}

class _SingerInfoState extends State<SingerInfo> {
  late List<SingerInfoModel> _infoData = <SingerInfoModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init(widget.id);
  }

  _init(int id) async {
    SingerInfoModel res = await getSingerInfo(id);
    setState(() {
      _infoData = [res];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _infoData.isEmpty
        ? Container()
        : Container(
            constraints: BoxConstraints.expand(),
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '艺人百科',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary_deep3,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                LableText(
                  lable: '艺人名: ',
                  lableColor: Color.fromARGB(255, 130, 129, 129),
                  text: _infoData[0].data!.artist!.name!,
                ),
                SizedBox(
                  height: 10,
                ),
                LableText(
                  lable: '身份: ',
                  lableColor: Color.fromARGB(255, 130, 129, 129),
                  text: _infoData[0].data!.artist!.identities!.join('、'),
                ),
                SizedBox(
                  height: 10,
                ),
                LableText(
                  lable: '生日: ',
                  lableColor: Color.fromARGB(255, 130, 129, 129),
                  text: _infoData[0].data!.user == 'undefined'
                      ? timeFormate(_infoData[0].data!.user!.birthday!)
                      : '不详',
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: LableText(
                        lable: '个人简介: ',
                        lableColor: Color.fromARGB(255, 130, 129, 129),
                        text: _infoData[0].data!.artist!.briefDesc!),
                  ),
                )
              ],
            ),
          );
  }
}

class SingerSongs extends StatefulWidget {
  final int id;
  final String pic;
  const SingerSongs({Key? key, required this.id, required this.pic})
      : super(key: key);

  @override
  State<SingerSongs> createState() => _SingerSongsState();
}

class _SingerSongsState extends State<SingerSongs> {
  late List<SingerSongModel> _songData = <SingerSongModel>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _init(widget.id);
  }

  _init(int id) async {
    SingerSongModel res = await getSingerAllSong(id);
    setState(() {
      _songData = [res];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _songData.isEmpty
        ? Container()
        : Container(
            child: ListView.builder(
              itemCount: _songData[0].songs!.length!,
              itemBuilder: ((context, index) => SongLine(
                    name: _songData[0].songs![index].name!,
                    singer: _songData[0]
                        .songs![index]
                        .ar!
                        .map((e) => e.name)
                        .toList()
                        .join('、'),
                    onTap: () async {
                      Provider.of<AudioPlayerModel_Provider>(context,
                              listen: false)
                          .setUrl(
                        id: _songData[0].songs![index].id!,
                        pic: widget.pic,
                        name: _songData[0].songs![index].name!,
                        singer: _songData[0]
                            .songs![index]
                            .ar!
                            .map((e) => e.name)
                            .toList()
                            .join('、'),
                      );
                    },
                  )),
            ),
          );
  }
}

class SingerAlbums extends StatefulWidget {
  final int id;
  const SingerAlbums({Key? key, required this.id}) : super(key: key);

  @override
  State<SingerAlbums> createState() => _SingerAlbumsState();
}

class _SingerAlbumsState extends State<SingerAlbums> {
  late List<HotAlbums> _albumsData = <HotAlbums>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init(widget.id);
  }

  _init(int id) async {
    List<HotAlbums> res = await getSingerAlbums(id);
    setState(() {
      _albumsData = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _albumsData.length,
        itemBuilder: ((context, index) => SingerAlbumCard(
              ontap: (id) {
                Navigator.pushNamed(context, '/album', arguments: {
                  'id': id,
                  'cover': _albumsData[index].blurPicUrl!,
                  'singer': _albumsData[index].artist!.name!,
                  'name': _albumsData[index].name!
                });
              },
              item: _albumsData[index],
            )),
      ),
    );
  }
}
