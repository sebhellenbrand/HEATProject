import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heat_screen_app/Components/heat_text.dart';

class SmallImageSlider extends StatelessWidget {
  const SmallImageSlider(
      {Key? key,
      required this.shoeAssetLinks,
      required this.title,
      this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  final List<String> shoeAssetLinks;
  final String title;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            child: HeatText(
              text: title,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xff545453),
            ),
            margin: const EdgeInsets.only(bottom: 15)),
        CarouselSlider(
          options: CarouselOptions(
            height: 170.0,
            enableInfiniteScroll: true,
            enlargeCenterPage: false,
          ),
          items: shoeAssetLinks.map((shoeAssetLink) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    shoeAssetLink,
                  ),
                );
              },
            );
          }).toList(),
        )
      ]),
    );
  }
}
