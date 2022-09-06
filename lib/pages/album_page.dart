import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/components/global_audio_player.dart';
import 'package:flutter_application_pc_1/components/song_line.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/album_detail_model.dart';
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatefulWidget {
  final arguments;
  AlbumPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> with TickerProviderStateMixin {
  late TabController _tabController;

  List<Tab> _tabs = [
    Tab(text: '歌曲'),
    Tab(text: '详情'),
  ];
  late List<Widget> _tabsContent = <Widget>[Container(), Container()];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init(widget.arguments['id']);

    setState(() {
      _tabController =
          TabController(initialIndex: 0, length: _tabs.length, vsync: this);
    });
  }

  _init(int id) async {
    AlbumDetailModel res = await getNewAlbumDetail(id);
    setState(() {
      _tabsContent = [
        AlbumListContent(
          albumDetailData: [res],
          cover: widget.arguments['cover'],
          singer: widget.arguments['singer'],
        ),
        AlbumInfoContent(
          albumDetailData: [res],
        )
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: GlobalAudioPlayer(
        controlBack: () {
          Provider.of<AudioPlayerModel_Provider>(context, listen: false).stop();
        },
        playing: context.select((AudioPlayerModel_Provider _) => _.playing_),
        name: context.select((AudioPlayerModel_Provider _) => _.name_),
        singer: context.select((AudioPlayerModel_Provider _) => _.singer_),
        pic: context.select((AudioPlayerModel_Provider _) => _.pic_),
      ),
      appBar: AppBar(
        title: Text(
          '最新专辑',
          style: TextStyle(
            color: AppColor.primary_deep3,
            fontSize: 16,
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: AppColor.primary_deep3,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: ClipPath(
                clipper: BottomClippertest(),
                child: FadeInImage.assetNetwork(
                  fit: BoxFit.fitWidth,
                  height: 200,
                  placeholder: 'assets/images/lazy-1.png',
                  image: widget.arguments['cover'],
                ),
              ),
            ),
            Center(
              child: Text(
                '${widget.arguments['name']}',
                style: TextStyle(
                  color: AppColor.primary_deep3,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Center(
              child: Text('-  ${widget.arguments['singer']}  -'),
            ),
            TabBar(
              indicatorColor: AppColor.primary_deep3,
              labelColor: AppColor.primary_deep3,
              unselectedLabelColor: AppColor.un2active,
              tabs: _tabs,
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                children: _tabsContent,
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomClippertest extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0); //第一个点
    path.lineTo(0, size.height - 20); //第二个点
    var firstControlPoint = Offset(size.width / 2, size.height); //曲线开始点
    var firstendPoint = Offset(size.width, size.height - 20); // 曲线结束点
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstendPoint.dx, firstendPoint.dy);
    path.lineTo(size.width, size.height - 20); //第四个点
    path.lineTo(size.width, 0); // 第五个点
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AlbumListContent extends StatefulWidget {
  // final int id;
  final String singer;
  final String cover;
  List<AlbumDetailModel> albumDetailData = <AlbumDetailModel>[];
  AlbumListContent(
      {Key? key,
      required this.cover,
      required this.singer,
      required this.albumDetailData})
      : super(key: key);

  @override
  State<AlbumListContent> createState() => _AlbumListContentState();
}

class _AlbumListContentState extends State<AlbumListContent>
    with AutomaticKeepAliveClientMixin {
  // late List<AlbumDetailModel> _albumDetailData = <AlbumDetailModel>[];
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _init(widget.id);
  }

  // _init(int id) async {
  //   AlbumDetailModel res = await getNewAlbumDetail(id);
  //   setState(() {
  //     _albumDetailData = [res];
  //     print(_albumDetailData);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.albumDetailData.isEmpty
        ? Container()
        : ListView.builder(
            itemBuilder: (BuildContext context, int index) => SongLine(
              name: widget.albumDetailData[0].songs![index].name!,
              singer: widget.singer,
              isPay: widget.albumDetailData[0].songs![index].fee == 0 ||
                  widget.albumDetailData[0].songs![index].fee == 8,
              onTap: () async {
                if (widget.albumDetailData[0].songs![index].fee != 0 ||
                    widget.albumDetailData[0].songs![index].fee != 8) {
                  print('无版权 无法播放');
                }
                Provider.of<AudioPlayerModel_Provider>(context, listen: false)
                    .setUrl(
                  id: widget.albumDetailData[0].songs![index].id!,
                  pic: widget.cover,
                  name: widget.albumDetailData[0].songs![index].name!,
                  singer: widget.singer,
                );
              },
            ),
            itemCount: widget.albumDetailData[0].songs!.length,
          );
  }
}

class AlbumInfoContent extends StatefulWidget {
  List<AlbumDetailModel> albumDetailData = <AlbumDetailModel>[];
  AlbumInfoContent({Key? key, required this.albumDetailData}) : super(key: key);

  @override
  State<AlbumInfoContent> createState() => _AlbumInfoContentState();
}

class _AlbumInfoContentState extends State<AlbumInfoContent>
    with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: '名称:',
                style: TextStyle(
                    fontSize: 18,
                    color: AppColor.primary_deep3,
                    fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: '  ${widget.albumDetailData[0].album!.name}',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColor.un3active,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: '公司:',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.primary_deep3,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '  ${widget.albumDetailData[0].album!.company}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.un3active,
                      ),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: '简介:',
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.primary_deep3,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: '  ${widget.albumDetailData[0].album!.description}',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.un3active,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
