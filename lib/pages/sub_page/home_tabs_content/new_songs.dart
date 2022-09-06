import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/song.dart';
import 'package:flutter_application_pc_1/components/song_card.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/recommend_song_model.dart';
import 'package:flutter_application_pc_1/mode/song_url_model.dart';
import 'package:flutter_application_pc_1/state_model/audio_player_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:provider/provider.dart';

class NewSongs extends StatefulWidget {
  NewSongs({Key? key}) : super(key: key);

  @override
  State<NewSongs> createState() => _NewSongsState();
}

class _NewSongsState extends State<NewSongs>
    with AutomaticKeepAliveClientMixin {
  List<Result> _recommendSongsData = <Result>[];
  int limit = 10;
  int page = 0;
  bool hasMore = false;
  bool loading = true;
  bool error = false;
  String errorMsg = '未知错误';
  late EasyRefreshController _easy_controller;
  bool change = false;
  @override
  bool get wantKeepAlive => true; // 是否需要缓存

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easy_controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print('build========================$change');
    return EasyRefresh(
      firstRefresh: true,
      header: ClassicalHeader(
          refreshText: '小若正在拼命加载',
          refreshFailedText: '加载失败',
          refreshReadyText: '准备刷新',
          refreshingText: '正在刷新',
          showInfo: false,
          textColor: AppColor.un2active,
          refreshedText: '小若刷新完成'),
      footer: ClassicalFooter(
          loadText: '小若正在拼命加载',
          loadedText: '加载失败',
          loadReadyText: '准备加载',
          loadingText: '小若正在加载',
          showInfo: false,
          textColor: AppColor.un2active,
          loadFailedText: '小若加载完成'),
      enableControlFinishRefresh: true,
      enableControlFinishLoad: true,
      controller: _easy_controller,
      onRefresh: _onRefresh,
      onLoad: _onLoad,
      child: songBody(),
    );
  }

  Future _getNewSongs({bool push = false}) async {
    try {
      page++;

      List<Result> res = await getSongsByRecommend(limit: limit, page: page);

      setState(() {
        if (push) {
          _recommendSongsData.addAll(res);
        } else {
          _recommendSongsData = res;
        }
        hasMore = page >= 5 ? false : true;
      });
    } catch (err) {
      setState(() {
        error = true;
        errorMsg = err.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

// 刷新回调(null为不开启刷新)
  Future _onRefresh() async {
    page = 1;
    await _getNewSongs();
    // 恢复刷新状态 使onLoad再次可用
    _easy_controller.finishRefresh();
  }

  // 加载回调(null为不开启加载)
  Future _onLoad() async {
    if (hasMore) {
      await _getNewSongs(push: true);
    }
    // 结束加载
    _easy_controller.finishLoad(noMore: !hasMore);
  }

  Widget songBody() {
    return ListView.builder(
      itemCount: _recommendSongsData.length,
      itemBuilder: (context, index) {
        return SongCard(
          onPlay: () async {
            Provider.of<AudioPlayerModel_Provider>(context, listen: false)
                .setUrl(
                    id: _recommendSongsData[index].song!.id!,
                    pic: _recommendSongsData[index].picUrl!,
                    name: _recommendSongsData[index].name!,
                    singer: _recommendSongsData[index].song!.artists![0].name!);
          },
          picUrl: _recommendSongsData[index].picUrl!,
          songName: _recommendSongsData[index].song!.name!,
          singerName: _recommendSongsData[index].song!.artists![0].name!,
          singerPic: _recommendSongsData[index].song!.artists![0].picUrl!,
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _easy_controller.dispose();
  }
}
