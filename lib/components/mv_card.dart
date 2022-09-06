import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/video_model.dart';
import 'package:flutter_application_pc_1/mode/video_url_model.dart'
    as VideoUrlModel_PACKAGE;
import 'package:flutter_application_pc_1/util/util.dart';

class MvCard extends StatelessWidget {
  final String cover;
  final String name;
  final int playCount;
  final int id;
  final void Function(int id) onTap;

  const MvCard(
      {Key? key,
      required this.cover,
      required this.name,
      required this.playCount,
      required this.id,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(id);
      },
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
        child: Stack(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1.55,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.fitHeight,
                        placeholder: 'assets/images/lazy-1.png',
                        image: cover),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: toRpx(context, 10)),
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.active,
                      fontSize: toRpx(context, 18),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconTextItem(
                      context: context,
                      text: '1848',
                      icon: Icon(
                        Icons.insert_comment_rounded,
                        size: 16,
                        color: AppColor.active,
                      ),
                    ),
                    IconTextItem(
                      context: context,
                      text: '9990',
                      icon: Icon(
                        Icons.star_border,
                        size: 16,
                        color: AppColor.active,
                      ),
                    ),
                    IconTextItem(
                      context: context,
                      text: '$playCount',
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        size: 16,
                        color: AppColor.active,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            Center(
              widthFactor: 15,
              heightFactor: 8,
              child: Image.asset(
                'assets/icons/tiny_video.png',
                width: toRpx(context, 54),
                height: toRpx(context, 54),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget IconTextItem(
      {required BuildContext context,
      required String text,
      required Icon icon}) {
    return Row(
      children: [
        icon,
        Padding(
          padding: EdgeInsets.only(left: 4),
          child: Text(
            '$text',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.un2active,
              fontSize: toRpx(context, 14),
            ),
          ),
        ),
      ],
    );
  }
}
