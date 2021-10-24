import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeatText extends StatelessWidget {
  const HeatText(
      {Key? key,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.fontSize = 14})
      : super(key: key);

  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color));
  }
}
