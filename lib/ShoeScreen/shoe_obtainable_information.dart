import 'package:flutter/cupertino.dart';
import '../Components/button_link.dart';
import '../Components/heat_text.dart';

class ShoeObtainableInformationBadge extends StatelessWidget {
  const ShoeObtainableInformationBadge(
      {Key? key, required this.headline, required this.child})
      : super(key: key);

  final String headline;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeatText(
              text: headline,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: const Color(0xff9B9FA4),
            ),
            child
          ],
        ));
  }
}

class ShoeObtainableInformation extends StatelessWidget {
  const ShoeObtainableInformation(
      {Key? key,
      required this.price,
      required this.shopCount,
      required this.raffleCount,
      required this.shopUrl})
      : super(key: key);

  final String price;
  final int shopCount;
  final int raffleCount;
  final String shopUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 30),
        child: Row(children: [
          ShoeObtainableInformationBadge(
              headline: 'Preis',
              child: HeatText(
                text: price,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              )),
          ShoeObtainableInformationBadge(
            headline: 'Shops',
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(CupertinoIcons.shopping_cart)),
                HeatText(
                  text: shopCount.toString(),
                  fontSize: 22,
                  color: const Color(0xff272324),
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
          ShoeObtainableInformationBadge(
            headline: 'Raffles',
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: const Icon(CupertinoIcons.ticket)),
                HeatText(
                  text: raffleCount.toString(),
                  fontSize: 22,
                  color: const Color(0xff272324),
                  fontWeight: FontWeight.w700,
                )
              ],
            ),
          ),
          ButtonLink(
              text: 'Zum Shop',
              url: shopUrl,
              backgroundColor: const Color(0xfff4f4f5),
              color: const Color(0xff545453))
        ]));
  }
}
