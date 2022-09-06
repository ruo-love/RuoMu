import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/components/song_list_card.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/album_model.dart';
import 'package:flutter_application_pc_1/mode/song_list.dart';

class RecommendContent extends StatefulWidget {
  RecommendContent({Key? key}) : super(key: key);

  @override
  State<RecommendContent> createState() => _RecommendContentState();
}

class _RecommendContentState extends State<RecommendContent>
    with AutomaticKeepAliveClientMixin {
  late List<Result> _recommendSongList = <Result>[];
  late List<Albums> _albumList = <Albums>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  _init() async {
    List<Result> res1 = await getRecommendSongList();
    List<Albums> res2 = await getNewAlbum();
    setState(() {
      _recommendSongList = res1;
      _albumList = res2;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '推荐歌单',
                style: TextStyle(
                    color: AppColor.primary_deep2,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.arrow_right,
                color: AppColor.primary_deep2,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）

              scrollDirection: Axis.horizontal,
              itemCount: _recommendSongList.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(right: 8),
                child: SongListCard(
                  onTap: (id) {
                    Navigator.pushNamed(context, '/songlist', arguments: {
                      'id': id,
                      'cover': _recommendSongList[index].picUrl!
                    });
                  },
                  id: _recommendSongList[index].id!,
                  cover: _recommendSongList[index].picUrl!,
                  desc: _recommendSongList[index].name!,
                  playCount: _recommendSongList[index].playCount!,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '最新专辑',
                style: TextStyle(
                    color: AppColor.primary_deep2,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.arrow_right,
                color: AppColor.primary_deep2,
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 150,
            child: ListView.builder(
                shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
                scrollDirection: Axis.horizontal,
                itemCount: _albumList.length,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(right: 8),
                      child: SongListCard(
                        onTap: (id) {
                          Navigator.pushNamed(context, '/album', arguments: {
                            'id': id,
                            'cover': _albumList[index].blurPicUrl!,
                            'singer': _albumList[index].artist!.name!,
                            'name': _albumList[index].name!
                          });
                        },
                        id: _albumList[index].id!,
                        cover: _albumList[index].blurPicUrl!,
                        desc: _albumList[index].name!,
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
