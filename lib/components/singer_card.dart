import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/util/util.dart';

class SingerCard extends StatelessWidget {
  final String singerPic;
  final String singerName;
  final int songCounts;
  final int id;
  final Function(int id) onTap;
  const SingerCard(
      {Key? key,
      required this.singerPic,
      required this.singerName,
      required this.songCounts,
      required this.id,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(id),
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 1),
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
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Hero(
                  tag: singerPic,
                  child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: 'assets/images/lazy-1.png',
                      image: singerPic),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: toRpx(context, 10)),
              child: Text(
                singerName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColor.active,
                  fontSize: toRpx(context, 18),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.music_note_outlined,
                        color: AppColor.un2active,
                        size: toRpx(context, 14),
                      ),
                      Text(
                        '歌曲：$songCounts',
                        style: TextStyle(
                          color: AppColor.active,
                          fontSize: toRpx(context, 12),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_sharp,
                        color: AppColor.un2active,
                        size: toRpx(context, 14),
                      ),
                      Text(
                        '播放：92',
                        style: TextStyle(
                          color: AppColor.active,
                          fontSize: toRpx(context, 12),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
