import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_pc_1/api/video_list.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/tiny_video_model.dart';
import 'package:flutter_application_pc_1/state_model/use_model.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class TinyVideoPage extends StatefulWidget {
  TinyVideoPage({Key? key}) : super(key: key);

  @override
  State<TinyVideoPage> createState() => _TinyVideoPageState();
}

class _TinyVideoPageState extends State<TinyVideoPage> {
  late List<Datas> videoList = [];
  bool hasMore = true;
  int offset = 0;
  PageController _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page!.toInt() + 1 == videoList.length - 1) {
        offset++;
        _init();
      }
    });
    _init();
  }

  _init() async {
    TinyVideoModel res = await getRecommendVideo(
        offset: offset,
        cookie: Provider.of<UserModel_Provider>(context, listen: false).cookie);
    setState(() {
      videoList.addAll(res.datas!);
      hasMore = res.hasmore!;
      offset = res.hasmore! ? offset + 1 : offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          '推荐',
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
        backgroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColor.primary_deep3),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          constraints: BoxConstraints.expand(),
          child: PageView.builder(
              controller: _pageController,

              /// pageview中 子条目的个数
              itemCount: videoList.length,

              /// 上下滑动
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                Datas videoModel = videoList[index];
                return buildPageViewItemWidget(videoModel);
              }),
        ),
      ),
    );
  }

  buildPageViewItemWidget(Datas videoModel) {
    return FindVideoItemPage(videoModel);
  }
}

///播放视频的页面
class FindVideoItemPage extends StatefulWidget {
  Datas videoModel;
  FindVideoItemPage(this.videoModel);

  @override
  State<StatefulWidget> createState() {
    return FindVideoItemPageState();
  }
}

class FindVideoItemPageState extends State<FindVideoItemPage> {
  ///创建视频播放控制 器
  late VideoPlayerController videoPlayerController;

  ///控制更新视频加载初始化完成状态更新
  late Future videoPlayFuture;

  @override
  void initState() {
    super.initState();

    videoPlayerController = VideoPlayerController.network(
        widget.videoModel.data?.urlInfo?.url ?? '');

    videoPlayFuture = videoPlayerController.initialize().then((_) {
      ///视频初始完成后
      ///调用播放
      videoPlayerController.play();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ///播放视频
        buildVideoWidget(),
        //描述卡片
        descCard(),

        //侧边卡片
        asideCard(),
      ],
    );
  }

//
  Widget descCard() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Colors.black,
        height: 120,
        padding: EdgeInsets.only(right: 50),
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: AppColor.un3active.withOpacity(0.5),
                    foregroundImage: NetworkImage(widget
                            .videoModel.data?.creator?.avatarUrl ??
                        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F88f7509f2d45a7f15108eee7c681182ee39e36c829475-k2VyDs_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1663147360&t=92bace8e6d5114ba61ac967e451ab6e4'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      widget.videoModel.data?.creator?.nickname ?? '若若',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Text(
              '    ${widget.videoModel.data!.description ?? ''}',
              maxLines: 3,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget asideCard() {
    return Align(
        alignment: Alignment.bottomRight,
        child: Container(
          margin: EdgeInsets.only(bottom: 50, right: 10),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AsideIcon(
                  icon: Icons.favorite,
                  text: widget.videoModel.data?.praisedCount.toString() ?? '0'),
              AsideIcon(
                  icon: Icons.textsms,
                  text: widget.videoModel.data?.commentCount.toString() ?? '0'),
              AsideIcon(
                  icon: Icons.replay,
                  text: widget.videoModel.data?.shareCount.toString() ?? '0'),
              AsideIcon(
                  icon: Icons.add_box,
                  text: widget.videoModel.data?.playTime.toString() ?? '0'),
            ],
          ),
        ));
  }

  ///播放视频
  buildVideoWidget() {
    return FutureBuilder(
      future: videoPlayFuture,
      builder: (BuildContext contex, value) {
        if (value.connectionState == ConnectionState.done) {
          ///点击事件
          return InkWell(
            onTap: () {
              if (videoPlayerController.value.isInitialized) {
                /// 视频已初始化
                if (videoPlayerController.value.isPlaying) {
                  /// 正播放 --- 暂停
                  videoPlayerController.pause();
                } else {
                  ///暂停 ----播放
                  videoPlayerController.play();
                }

                setState(() {});
              } else {
                ///未初始化
                videoPlayerController.initialize().then((_) {
                  videoPlayerController.play();
                  setState(() {});
                });
              }
            },

            ///居中
            child: Center(
              /// AspectRatio 组件用来设定子组件宽高比
              child: AspectRatio(
                ///设置视频的大小 宽高比。长宽比表示为宽高比。例如，16:9宽高比的值为16.0/9.0
                aspectRatio: 16.0 / 14.0,

                ///播放视频的组件
                child: VideoPlayer(videoPlayerController),
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,

            ///圆形加载进度
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColor.primary_deep3,
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}

class AsideIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  const AsideIcon({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
        Text(
          text,
          maxLines: 1,
          style: TextStyle(
            // overflow: TextOverflow.ellipsis,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
