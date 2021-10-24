import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Nike Air Jordan 1 "Multicolor"'),
          backgroundColor: Colors.red[400],
        ),
        body: ListView(
          children: [
            Column(children: const [
              BigImageSlider(),
              ShoeBasicInformation(),
              ShoeAvailability(),
              ObtainableInformation(),
              NamedProgressIndicator(
                name: 'Stückzahl',
                progress: 0.2,
                color: Color(0xfff99D0b),
              ),
              NamedProgressIndicator(
                name: 'Nachfrage',
                progress: 0.9,
                color: Color(0xffc72740),
              ),
              Shops(),
              Raffles(),
              SmallImageSlider()
            ])
          ],
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  const ShopCard(
      {Key? key,
      required this.imageSrc,
      required this.name,
      required this.releaseDate,
      required this.url})
      : super(key: key);

  final String imageSrc;
  final String name;
  final String releaseDate;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      imageSrc,
                      height: 20,
                      width: 30,
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeatText(
                        text: name,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff272324),
                        fontSize: 16),
                    HeatText(
                        text: releaseDate,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff9b9fa4),
                        fontSize: 10)
                  ],
                )
              ],
            ),
            ButtonLink(
                text: 'Öffnen',
                url: url,
                color: const Color(0xffffffff),
                backgroundColor: const Color(0xffc72740))
          ],
        ));
  }
}

class ShopInformation {
  String imageSrc;
  String name;
  String releaseDate;
  String url;
  ShopInformation(this.name, this.imageSrc, this.releaseDate, this.url);
}

class Shops extends StatelessWidget {
  const Shops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ShopInformation> shops = [
      ShopInformation("Nike", "assets/images/1631794155-lfdylogopng-hm.png",
          "Mo, 04.Dez 2020 - 12.00 Uhr", 'https://flutter.io'),
      ShopInformation("StockX", "assets/images/1631794155-lfdylogopng-hm.png",
          "Mo, 04.Dez 2020 - 12.00 Uhr", 'https://flutter.io')
    ];

    return Container(
        margin: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  "Shops",
                  style: TextStyle(fontSize: 13, color: Color(0xff545453)),
                )),
            Column(
                children: shops
                    .map(
                      (shop) => Container(
                        child: ShopCard(
                            imageSrc: shop.imageSrc,
                            name: shop.name,
                            releaseDate: shop.releaseDate,
                            url: shop.url),
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 2),
                        height: 54,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Color(0xffF4F4F5),
                        ),
                      ),
                    )
                    .toList())
          ],
        ));
  }
}

class Raffles extends StatelessWidget {
  const Raffles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final strings = ["test", "test2"];

    return Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const Text(
                  "Raffles",
                  style: TextStyle(fontSize: 13, color: Color(0xff545453)),
                )),
            Column(
                children: strings
                    .map(
                      (string) => Container(
                        child: Center(child: Text(string)),
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 2),
                        height: 54,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(14),
                          ),
                          color: Color(0xffF4F4F5),
                        ),
                      ),
                    )
                    .toList())
          ],
        ));
  }
}

class BigImageSlider extends StatelessWidget {
  const BigImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeAssetLinks = [
      "assets/images/1633340540-adidas-ultra-boost-heat-maps.jpg",
      "assets/images/1634202956-new-balance-920-sand.jpg",
      "assets/images/1634204973-nike-air-force-1-low-wolf-grey.jpg",
      "assets/images/1634025298-heat-rect-large.jpg",
      "assets/images/1634204310-nike-air-force-1-low-royal.jpg"
    ];

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

class SmallImageSlider extends StatelessWidget {
  const SmallImageSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeAssetLinks = [
      "assets/images/1633340540-adidas-ultra-boost-heat-maps.jpg",
      "assets/images/1634202956-new-balance-920-sand.jpg",
      "assets/images/1634204973-nike-air-force-1-low-wolf-grey.jpg",
      "assets/images/1634025298-heat-rect-large.jpg",
      "assets/images/1634204310-nike-air-force-1-low-royal.jpg"
    ];

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          child: const Text("Weitere Farben",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff545453),
                  fontFamily: 'SF Pro Text')),
          margin: const EdgeInsets.all(15)),
      CarouselSlider(
        options: CarouselOptions(
          height: 170.0,
          enableInfiniteScroll: false,
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
    ]);
  }
}

class ShoeBasicInformation extends StatelessWidget {
  const ShoeBasicInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(
            'assets/images/1631794155-lfdylogopng-hm.png',
            height: 20,
            width: 30,
          ),
          const Text(
            'Nike Air Jordan 1 "Multicolor"',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Color(0xff272324),
                fontFamily: 'SF Pro Display'),
          ),
          const Text(
            "Sail/Black- Cider- Chile Red | DA8005-100",
            style: TextStyle(
                fontSize: 10,
                color: Color(0xff9B9FA4),
                fontFamily: 'SF Pro Display'),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      width: double.infinity,
      margin: const EdgeInsets.all(15),
    );
  }
}

class ShoeAvailability extends StatelessWidget {
  const ShoeAvailability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const ShoeAvailibilityBadge(),
          ),
          const Text(
            "Mo, 04.Dez. ",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xff545453),
                fontFamily: 'SF Pro Display'),
          ),
          const Text("2020 - 12:00 Uhr",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff545453),
                  fontFamily: 'SF Pro Display'))
        ],
      ),
    );
  }
}

class ShoeAvailibilityBadge extends StatelessWidget {
  const ShoeAvailibilityBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: const Text(
          "Anstehend",
          style: TextStyle(
              color: Color(0xffffffff),
              fontSize: 13,
              fontFamily: 'SF Pro Text',
              fontWeight: FontWeight.w600),
        ),
        height: 26,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color(0xffC72740),
        ),
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 12, right: 12));
  }
}

class ObtainableInformation extends StatelessWidget {
  const ObtainableInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 30),
        child: Row(children: [
          const ObtainableInformationBadge(
            headline: 'Preis',
            child: Text(
              "440€",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'SF Pro Display'),
            ),
          ),
          ObtainableInformationBadge(
            headline: 'Shops',
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(CupertinoIcons.shopping_cart)),
                const HeatText(
                  text: '2',
                  fontSize: 22,
                  color: Color(0xff272324),
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
          ObtainableInformationBadge(
            headline: 'Raffles',
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(CupertinoIcons.ticket)),
                const HeatText(
                  text: '3',
                  fontSize: 22,
                  color: Color(0xff272324),
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
          const ButtonLink(
              text: 'Zum Shop',
              url: 'https://flutter.io',
              backgroundColor: Color(0xff545453),
              color: Color(0xfff4f4f5))
        ]));
  }
}

class HeatText extends StatelessWidget {
  const HeatText(
      {Key? key,
      required this.text,
      required this.fontWeight,
      required this.color,
      required this.fontSize})
      : super(key: key);

  final String text;
  final FontWeight fontWeight;
  final Color color;
  final double fontSize;

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

class ObtainableInformationBadge extends StatelessWidget {
  const ObtainableInformationBadge(
      {Key? key, required this.headline, required this.child})
      : super(key: key);

  final String headline;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(headline,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'SF Pro Display',
                    color: Color(0xff9B9FA4))),
            child
          ],
        ));
  }
}

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
        child: (Container(
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
        )));
  }
}

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
