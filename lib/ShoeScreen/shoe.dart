import 'package:heat_screen_app/Components/raffles.dart';
import 'package:heat_screen_app/Components/shops.dart';

class Shoe {
  final String brandImageSrc;
  final String name;
  final String subName;
  final String releaseState;
  final String releaseDate;
  final String releaseYearAndTime;
  final String price;
  final int shopCount;
  final int raffleCount;
  final double availableAmount;
  final double demandAmount;

  final List<String> imageLinks;
  final List<Shop> shopList;
  final List<Raffle> raffleList;

  Shoe(
      {required this.brandImageSrc,
      required this.name,
      required this.subName,
      required this.releaseState,
      required this.releaseDate,
      required this.releaseYearAndTime,
      required this.price,
      required this.shopCount,
      required this.raffleCount,
      required this.availableAmount,
      required this.demandAmount,
      required this.imageLinks,
      required this.shopList,
      required this.raffleList});
}

fetchShoe() {
  //mock
  return Shoe(
      brandImageSrc: 'assets/images/1631794155-lfdylogopng-hm.png',
      name: 'Nike Air Jordan 1 "Multicolor"',
      subName: "Sail/Black- Cider- Chile Red | DA8005-100",
      releaseState: 'Anstehend',
      releaseDate: 'Mo, 04.Dez. ',
      releaseYearAndTime: "2020 - 12:00 Uhr",
      price: '440€',
      shopCount: 2,
      raffleCount: 3,
      availableAmount: 0.2,
      demandAmount: 0.9,
      imageLinks: [
        "assets/images/1633340540-adidas-ultra-boost-heat-maps.jpg",
        "assets/images/1634202956-new-balance-920-sand.jpg",
        "assets/images/1634204973-nike-air-force-1-low-wolf-grey.jpg",
        "assets/images/1634025298-heat-rect-large.jpg",
        "assets/images/1634204310-nike-air-force-1-low-royal.jpg"
      ],
      shopList: [
        Shop("Nike", "assets/images/1631794155-lfdylogopng-hm.png",
            "Mo, 04.Dez 2020 - 12.00 Uhr", 'https://nike.com/de/'),
        Shop("StockX", "assets/images/1631794155-lfdylogopng-hm.png",
            "Mo, 04.Dez 2020 - 12.00 Uhr", 'https://stockx.com/')
      ],
      raffleList: [
        Raffle("Asphaltgold", 'https://asphaltgold.com'),
        Raffle("Afew", 'https://de.afew-store.com/'),
        Raffle("BSTN", 'https://bstn.com/')
      ]);
}
