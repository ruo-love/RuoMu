import 'package:flutter/material.dart';

class LableText extends StatelessWidget {
  final Color lableColor;
  final Color textColor;
  final String lable;
  final String text;
  const LableText(
      {Key? key,
      this.lable = 'lable',
      this.text = 'text',
      this.lableColor = Colors.black,
      this.textColor = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: lable,
        style: TextStyle(
            fontSize: 16, color: lableColor, fontWeight: FontWeight.w500),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
