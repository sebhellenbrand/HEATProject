import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'heat_text.dart';

class NamedProgressIndicator extends StatelessWidget {
  const NamedProgressIndicator(
      {Key? key,
      required this.color,
      required this.name,
      required this.progress})
      : super(key: key);

  final double progress;
  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          bottom: 10,
          left: 15,
          right: 15,
        ),
        child: Row(children: [
          SizedBox(
            width: 76,
            child: HeatText(
              text: name,
              color: const Color(0xff9b9fa4),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: LinearProgressIndicator(
              backgroundColor: const Color(0xfff4f4f5),
              minHeight: 5,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              value: progress,
            ),
          ))
        ]));
  }
}
