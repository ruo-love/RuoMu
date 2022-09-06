import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/video_list.dart';
import 'package:flutter_application_pc_1/components/mv_card.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/video_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_application_pc_1/mode/video_url_model.dart'
    as UrlMode_PACKAGE;

class HotVideo extends StatefulWidget {
  HotVideo({Key? key}) : super(key: key);

  @override
  State<HotVideo> createState() => _HotVideoState();
}

class _HotVideoState extends State<HotVideo>
    with AutomaticKeepAliveClientMixin {
  List<Data> _hotMvData = <Data>[];
  int limit = 10;
  int page = 0;
  bool hasMore = false;
  bool loading = true;
  bool error = false;

  String errorMsg = '未知错误';
  late EasyRefreshController _easy_controller;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easy_controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
      onLoad: _hotMvData.isEmpty ? null : _onLoad,
      child: gridBody(),
    );
  }

  Widget gridBody() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 7),
      itemCount: _hotMvData.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: MediaQuery.of(context).size.width,
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (_, index) => MvCard(
        cover: _hotMvData[index].cover!,
        id: _hotMvData[index].id!,
        name: _hotMvData[index].name!,
        playCount: _hotMvData[index].playCount!,
        onTap: _playVide,
      ),
    );
  }

  Future _getHotMvData({bool push = false}) async {
    try {
      page++;

      List<Data> res = await getHotMvList(limit: limit, page: page);
      setState(() {
        if (push) {
          _hotMvData.addAll(res);
        } else {
          _hotMvData = res;
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
    await _getHotMvData();
    // 恢复刷新状态 使onLoad再次可用
    _easy_controller.finishRefresh();
  }

  // 加载回调(null为不开启加载)
  Future _onLoad() async {
    if (hasMore) {
      await _getHotMvData(push: true);
    }
    // 结束加载
    _easy_controller.finishLoad(noMore: !hasMore);
  }

//play
  void _playVide(int id) async {
    UrlMode_PACKAGE.Data res = await getMvDetail(id);
    Navigator.pushNamed(context, '/mv', arguments: {'data': res});
  }
}
