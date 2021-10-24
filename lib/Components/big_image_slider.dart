import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BigImageSlider extends StatelessWidget {
  const BigImageSlider({Key? key, required this.shoeAssetLinks})
      : super(key: key);

  final List<String> shoeAssetLinks;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 260.0,
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
      ),
      items: shoeAssetLinks.map((shoeAssetLink) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
                width: double.infinity, child: Image.asset(shoeAssetLink));
          },
        );
      }).toList(),
    );
  }
}
