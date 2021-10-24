import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heat_screen_app/Components/big_image_slider.dart';
import 'package:heat_screen_app/Components/heat_text.dart';
import 'package:heat_screen_app/Components/named_progress_indicator.dart';
import 'package:heat_screen_app/Components/raffles.dart';
import 'package:heat_screen_app/Components/shops.dart';
import 'package:heat_screen_app/Components/small_image_slider.dart';
import 'package:heat_screen_app/ShoeScreen/shoe_availability.dart';
import 'package:heat_screen_app/ShoeScreen/shoe_basic_information.dart';

import 'shoe_obtainable_information.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> shoeAssetLinks = [
      "assets/images/1633340540-adidas-ultra-boost-heat-maps.jpg",
      "assets/images/1634202956-new-balance-920-sand.jpg",
      "assets/images/1634204973-nike-air-force-1-low-wolf-grey.jpg",
      "assets/images/1634025298-heat-rect-large.jpg",
      "assets/images/1634204310-nike-air-force-1-low-royal.jpg"
    ];

    const brandImgSrc = 'assets/images/1631794155-lfdylogopng-hm.png';
    const shoeTitle = 'Nike Air Jordan 1 "Multicolor"';
    const shoeSubTitle = "Sail/Black- Cider- Chile Red | DA8005-100";

    const shoeReleaseState = 'Anstehend';
    const shoeReleaseDate = 'Mo, 04.Dez. ';
    const shoeReleaseYearAndTime = "2020 - 12:00 Uhr";

    const shoePrice = '440€';
    const shoeShopCount = 2;
    const shoeRaffleCount = 3;

    const shoeAvailableAmount = 0.2;
    const shoeDemandAmount = 0.9;

    final List<Shop> shopList = [
      Shop("Nike", "assets/images/1631794155-lfdylogopng-hm.png",
          "Mo, 04.Dez 2020 - 12.00 Uhr", 'https://nike.com/de/'),
      Shop("StockX", "assets/images/1631794155-lfdylogopng-hm.png",
          "Mo, 04.Dez 2020 - 12.00 Uhr", 'https://stockx.com/')
    ];

    final List<Raffle> raffleList = [
      Raffle("Asphaltgold", 'https://asphaltgold.com'),
      Raffle("Afew", 'https://de.afew-store.com/'),
      Raffle("BSTN", 'https://bstn.com/')
    ];

    return Scaffold(
      appBar: AppBar(
        title: const HeatText(
          text: shoeTitle,
          color: Color(0xffffffff),
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        backgroundColor: Colors.red[400],
      ),
      body: ListView(
        children: [
          Column(children: [
            BigImageSlider(
              shoeAssetLinks: shoeAssetLinks,
            ),
            const ShoeBasicInformation(
              brandImgSrc: brandImgSrc,
              title: shoeTitle,
              subTitle: shoeSubTitle,
            ),
            const ShoeAvailability(
              releaseState: shoeReleaseState,
              releaseDate: shoeReleaseDate,
              releaseYearAndTime: shoeReleaseYearAndTime,
            ),
            ShoeObtainableInformation(
                price: shoePrice,
                shopCount: shoeShopCount,
                raffleCount: shoeRaffleCount,
                shopUrl: shopList[0].url),
            const NamedProgressIndicator(
              name: 'Stückzahl',
              progress: shoeAvailableAmount,
              color: Color(0xfff99D0b),
            ),
            const NamedProgressIndicator(
              name: 'Nachfrage',
              progress: shoeDemandAmount,
              color: Color(0xffc72740),
            ),
            Shops(shopList: shopList),
            Raffles(raffelList: raffleList),
            SmallImageSlider(
              shoeAssetLinks: shoeAssetLinks,
              title: "Weitere Farben",
            )
          ])
        ],
      ),
    );
  }
}
