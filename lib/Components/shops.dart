import 'package:flutter/cupertino.dart';

import 'button_link.dart';
import 'heat_text.dart';

class Shop {
  String imageSrc;
  String name;
  String releaseDate;
  String url;
  Shop(this.name, this.imageSrc, this.releaseDate, this.url);
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

class Shops extends StatelessWidget {
  const Shops({Key? key, required this.shopList}) : super(key: key);
  final List<Shop> shopList;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const HeatText(
                  text: "Shops",
                  fontSize: 13,
                  color: Color(0xff545453),
                )),
            Column(
                children: shopList
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
