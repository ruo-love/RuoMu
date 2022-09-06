import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';

class SongListCard extends StatelessWidget {
  final String cover;
  final String desc;
  final int playCount;
  final int id;
  final Function(int id) onTap;

  const SongListCard(
      {Key? key,
      required this.cover,
      required this.desc,
      required this.id,
      this.playCount = 0,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(id),
      child: Container(
        width: 100,
        height: 150,
        child: Stack(
          children: [
            Column(
              children: [
                Hero(
                  tag: id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.fitWidth,
                        placeholder: 'assets/images/lazy-1.png',
                        image: cover),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Positioned(
              right: 4,
              top: 4,
              child: Text(
                playCount > 0
                    ? (playCount / 10000).toInt().toString() + '万'
                    : '',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
