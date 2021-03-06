import 'package:flutter/cupertino.dart';
import 'package:heat_screen_app/Components/heat_text.dart';

class ShoeBasicInformation extends StatelessWidget {
  const ShoeBasicInformation(
      {Key? key,
      required this.brandImgSrc,
      required this.title,
      required this.subTitle,
      this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  final String brandImgSrc;
  final String title;
  final String subTitle;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Image.asset(
            brandImgSrc,
            height: 20,
            width: 30,
          ),
          HeatText(
            text: title,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: const Color(0xff272324),
          ),
          HeatText(
              text: subTitle, fontSize: 10, color: const Color(0xff9B9FA4)),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      width: double.infinity,
    );
  }
}
