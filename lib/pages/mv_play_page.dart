import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/api/video_list.dart';
import 'package:flutter_application_pc_1/components/comment_card.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/mv_comment_model.dart';
import 'package:flutter_application_pc_1/mode/video_url_model.dart';
import 'package:video_player/video_player.dart';

class MvPlayPage extends StatefulWidget {
  final arguments;
  MvPlayPage({Key? key, this.arguments}) : super(key: key);

  @override
  State<MvPlayPage> createState() => _MvPlayPageState();
}

class _MvPlayPageState extends State<MvPlayPage> {
  late final VideoPlayerController _controller;
  bool playing = false;
  List<HotComments> _mvComments = <HotComments>[];
  @override
  void initState() {
    _init();
  }

  _init() async {
    _controller = VideoPlayerController.network(widget.arguments['data'].url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    List<HotComments> res = await getMvComment(widget.arguments['data'].id);
    setState(() {
      _mvComments = res;
    });
    print(_mvComments);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.active,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            //_nextPage(-1);
          },
        ),
        title: Text('MV'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    children: [
                      VideoPlayer(_controller),
                      Positioned(
                        left: 10,
                        bottom: 10,
                        child: IconButton(
                            onPressed: () {
                              if (_controller.value.isPlaying) {
                                _controller.pause();
                                setState(() {
                                  playing = false;
                                });
                              } else {
                                _controller.play();
                                setState(() {
                                  playing = true;
                                });
                              }
                            },
                            icon: playing
                                ? Icon(
                                    Icons.pause,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_arrow,
                                    size: 40,
                                    color: Colors.white,
                                  )),
                      ),
                    ],
                  ))
              : Container(),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '评论',
              style: TextStyle(fontSize: 18, color: AppColor.primary_deep2),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  CommentCard(data: _mvComments[index]),
              itemCount: _mvComments.length,
            ),
          ),
        ],
      ),
    );
  }
}
