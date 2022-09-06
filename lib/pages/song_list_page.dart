import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/components/global_audio_player.dart';
import 'package:flutter_application_pc_1/components/song_line.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/song_list_detail_model.dart';
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:provider/provider.dart';

class SongListPage extends StatefulWidget {
  final arguments;
  SongListPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<SongListPage> createState() => _SongListPageState();
}

class _SongListPageState extends State<SongListPage> {
  late List<Playlist> _currentListData = <Playlist>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light // dark:一般显示黑色   light：一般显示白色
        ));
    _init(widget.arguments['id']);
  }

  _init(int id) async {
    Playlist res = await getAlbumDetails(id: id);
    setState(() {
      _currentListData = [res];
    });
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              '歌单漫游',
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
            floating: true,
            snap: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: widget.arguments['id'],
                child: ClipPath(
                  clipper: BottomClipper(),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.fitWidth,
                    height: 200,
                    placeholder: 'assets/images/lazy-1.png',
                    image: widget.arguments['cover'],
                  ),
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: _currentListData.isEmpty
                ? SliverChildListDelegate([])
                : SliverChildBuilderDelegate(
                    (context, index) => SongLine(
                      onTap: () async {
                        Provider.of<AudioPlayerModel_Provider>(context,
                                listen: false)
                            .setUrl(
                          id: _currentListData[0].tracks![index].id!,
                          pic: _currentListData[0].tracks![index].al!.picUrl!,
                          name: _currentListData[0].tracks![index].name!,
                          singer:
                              _currentListData[0].tracks![index].ar![0].name!,
                        );
                      },
                      name: _currentListData[0].tracks![index].name!,
                      singer: _currentListData[0].tracks![index].ar![0].name!,
                    ),
                    childCount: _currentListData[0].tracks!.length,
                  ),
          ),
        ],
      ),
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 40);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstendPoint = Offset(size.width / 2.25, size.height - 30);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstendPoint.dx, firstendPoint.dy);
    var secondConttorPoint = Offset(size.width / 4 * 3, size.height - 90);
    var secondendPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondConttorPoint.dx, secondConttorPoint.dy,
        secondendPoint.dx, secondendPoint.dy);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
