import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heat_screen_app/Components/big_image_slider.dart';
import 'package:heat_screen_app/Components/heat_text.dart';
import 'package:heat_screen_app/Components/named_progress_indicator.dart';
import 'package:heat_screen_app/Components/raffles.dart';
import 'package:heat_screen_app/Components/shops.dart';
import 'package:heat_screen_app/Components/small_image_slider.dart';
import 'package:heat_screen_app/ShoeScreen/shoe.dart';
import 'package:heat_screen_app/ShoeScreen/shoe_availability.dart';
import 'package:heat_screen_app/ShoeScreen/shoe_basic_information.dart';

import 'shoe_obtainable_information.dart';

class ShoeScreen extends StatefulWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  _ShoeScreenState createState() => _ShoeScreenState();
}

class _ShoeScreenState extends State<ShoeScreen> {
  late Shoe shoe = fetchShoe();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeatText(
          text: shoe.name,
          color: const Color(0xffffffff),
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        backgroundColor: const Color(0xffC72740),
      ),
      body: ListView(
        children: [
          Column(children: [
            BigImageSlider(
              shoeAssetLinks: shoe.imageLinks,
            ),
            ShoeBasicInformation(
              brandImgSrc: shoe.brandImageSrc,
              title: shoe.name,
              subTitle: shoe.subName,
            ),
            ShoeAvailability(
              releaseState: shoe.releaseState,
              releaseDate: shoe.releaseDate,
              releaseYearAndTime: shoe.releaseYearAndTime,
            ),
            ShoeObtainableInformation(
                price: shoe.price,
                shopCount: shoe.shopCount,
                raffleCount: shoe.raffleCount,
                shopUrl: shoe.shopList[0].url),
            NamedProgressIndicator(
              name: 'Stückzahl',
              progress: shoe.availableAmount,
              color: const Color(0xfff99D0b),
            ),
            NamedProgressIndicator(
              name: 'Nachfrage',
              progress: shoe.demandAmount,
              color: const Color(0xffc72740),
            ),
            Shops(shopList: shoe.shopList),
            Raffles(raffelList: shoe.raffleList),
            SmallImageSlider(
              shoeAssetLinks: shoe.imageLinks,
              title: "Weitere Farben",
            )
          ])
        ],
      ),
    );
  }
}
