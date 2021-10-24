import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import 'heat_text.dart';

class ButtonLink extends StatelessWidget {
  const ButtonLink(
      {Key? key,
      required this.text,
      required this.url,
      required this.color,
      required this.backgroundColor})
      : super(key: key);

  final String text;
  final String url;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return GestureDetector(
        onTap: _launchURL,
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 8, top: 8, left: 15, right: 15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: backgroundColor,
          ),
          child: HeatText(
              text: text,
              fontWeight: FontWeight.w600,
              color: color,
              fontSize: 16),
        ));
  }
}
