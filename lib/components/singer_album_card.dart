import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/singer_album_model.dart';
import 'package:flutter_application_pc_1/util/util.dart';

class SingerAlbumCard extends StatelessWidget {
  final HotAlbums item;
  final Function(int id) ontap;
  const SingerAlbumCard({Key? key, required this.item, required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ontap(item.id!),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.un2active.withOpacity(0.2),
              blurRadius: 30,
              offset: Offset(0, 0),
              spreadRadius: 0,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Row(children: [
          Hero(
            tag: item.id!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                  fit: BoxFit.fitHeight,
                  placeholder: 'assets/images/lazy-1.png',
                  image: item.blurPicUrl!),
            ),
          ),
          Expanded(
              child: Container(
            height: 80,
            padding: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name!,
                  style: TextStyle(color: AppColor.primary_deep3, fontSize: 16),
                ),
                Text(
                  item.artist!.name!,
                  style: TextStyle(color: AppColor.un2active),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    timeFormate(item.publishTime!),
                    style: TextStyle(color: AppColor.un3active),
                  ),
                )
              ],
            ),
          )),
        ]),
      ),
    );
  }
}
