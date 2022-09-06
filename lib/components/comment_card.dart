import 'package:flutter/material.dart';
import 'package:flutter_application_pc_1/config/app_colors.dart';
import 'package:flutter_application_pc_1/mode/mv_comment_model.dart';

class CommentCard extends StatelessWidget {
  final HotComments data;
  const CommentCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                foregroundImage: NetworkImage(data.user!.avatarUrl!),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                data.user!.nickname!,
                style: TextStyle(fontSize: 14),
              ),
              Spacer(),
              Text(data.likedCount.toString()),
              Icon(
                Icons.star_rate,
                color: AppColor.primary_deep3,
              ),
            ],
          ),
          Text(data.content!, style: TextStyle(color: AppColor.primary_deep2)),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              data.timeStr!,
              style: TextStyle(fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
