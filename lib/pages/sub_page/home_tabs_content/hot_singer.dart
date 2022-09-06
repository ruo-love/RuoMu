import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_pc_1/api/singer_list.dart';
import 'package:flutter_application_pc_1/components/singer_card.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/singer_model.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class HotSinger extends StatefulWidget {
  HotSinger({Key? key}) : super(key: key);

  @override
  State<HotSinger> createState() => _HotSingerState();
}

class _HotSingerState extends State<HotSinger>
    with AutomaticKeepAliveClientMixin {
  List<Artists> _hotSingerData = <Artists>[];
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
      onLoad: _hotSingerData.isEmpty ? null : _onLoad,
      child: gridBody(),
    );
  }

  Widget gridBody() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 7),
      itemCount: _hotSingerData.length,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        mainAxisExtent: MediaQuery.of(context).size.width / 1.5,
        maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
      ),
      itemBuilder: (_, index) => SingerCard(
        id: _hotSingerData[index].id!,
        singerPic: _hotSingerData[index].picUrl!,
        singerName: _hotSingerData[index].name!,
        songCounts: _hotSingerData[index].albumSize!,
        onTap: (id) {
          Navigator.pushNamed(context, '/singer_detail', arguments: {
            'id': id,
            'singerPic': _hotSingerData[index].picUrl!,
          });
        },
      ),
    );
  }

  Future _getSingerData({bool push = false}) async {
    try {
      page++;

      List<Artists> res = await getHotSinger(limit: limit, page: page);
      setState(() {
        if (push) {
          _hotSingerData.addAll(res);
        } else {
          _hotSingerData = res;
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
    await _getSingerData();
    // 恢复刷新状态 使onLoad再次可用
    _easy_controller.finishRefresh();
  }

  // 加载回调(null为不开启加载)
  Future _onLoad() async {
    if (hasMore) {
      await _getSingerData(push: true);
    }
    // 结束加载
    _easy_controller.finishLoad(noMore: !hasMore);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _easy_controller.dispose();
  }
}
