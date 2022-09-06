import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/recommend_song_model.dart';
import 'package:flutter_application_pc_1/util/util.dart';

class SongCard extends StatelessWidget {
  final String picUrl;
  final String songName;
  final String singerName;
  final String singerPic;
  final void Function() onPlay;
  const SongCard(
      {Key? key,
      required this.picUrl,
      required this.songName,
      required this.singerName,
      required this.singerPic,
      required this.onPlay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPlay,
      child: Container(
        padding: EdgeInsets.all(toRpx(context, 16)),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.un2active.withOpacity(0.2),
              blurRadius: 30,
              offset: Offset(0, 10),
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            )
          ],
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
        child: Row(
          children: [
            songCover(context),
            Expanded(child: songContent(context)),
          ],
        ),
      ),
    );
  }

  //封面组件
  Widget songCover(BuildContext context) {
    return SizedBox(
      width: toRpx(context, 150),
      height: toRpx(context, 150),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/lazy-1.png', image: picUrl),
          ),
          Center(
            child: Image.asset(
              'assets/icons/tiny_video.png',
              width: toRpx(context, 22),
              height: toRpx(context, 22),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget songContent(BuildContext context) {
    return SizedBox(
      height: toRpx(context, 150),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songName,
                      style: TextStyle(
                        color: AppColor.active,
                        fontSize: toRpx(context, 18),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      singerName,
                      style: TextStyle(
                        color: AppColor.un3active,
                        fontSize: toRpx(context, 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: toRpx(context, 30),
                      height: toRpx(context, 30),
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(singerPic),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.star_outline,
                              color: AppColor.un2active,
                              size: toRpx(context, 16),
                            ),
                            Icon(
                              Icons.comment_outlined,
                              color: AppColor.un2active,
                              size: toRpx(context, 16),
                            ),
                            Icon(
                              Icons.remove_red_eye_sharp,
                              color: AppColor.un2active,
                              size: toRpx(context, 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
