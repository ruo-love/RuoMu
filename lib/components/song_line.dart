import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';

class SongLine extends StatelessWidget {
  final String name;
  final String singer;
  final bool isPay;
  final Function() onTap;

  const SongLine(
      {Key? key,
      this.name = '歌名',
      this.singer = '歌手',
      required this.onTap,
      this.isPay = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isPay ? name : '${name}(付费)',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColor.primary_deep3,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      singer,
                      style: TextStyle(
                        color: AppColor.un3active,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.queue_music_outlined,
                color: AppColor.primary_deep3,
              )
            ],
          )),
    );
  }
}
