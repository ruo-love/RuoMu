import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';

class GlobalAudioPlayer extends StatelessWidget {
  String pic;
  String name;
  String singer;
  bool playing;
  Function() controlBack;
  GlobalAudioPlayer(
      {Key? key,
      required this.pic,
      required this.name,
      required this.singer,
      required this.playing,
      required this.controlBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColor.un3active.withOpacity(0.5),
            foregroundImage: NetworkImage(pic),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '$name-$singer',
                maxLines: 1,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: controlBack,
            child: Icon(
              playing ? Icons.pause_circle : Icons.play_circle,
              color: AppColor.primary_deep3,
            ),
          )
        ],
      ),
    );
  }
}
