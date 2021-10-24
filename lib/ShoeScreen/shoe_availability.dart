import 'package:flutter/cupertino.dart';
import 'package:heat_screen_app/Components/heat_text.dart';

class ShoeAvailability extends StatelessWidget {
  const ShoeAvailability(
      {Key? key,
      required this.releaseState,
      required this.releaseDate,
      required this.releaseYearAndTime,
      this.margin = const EdgeInsets.all(0)})
      : super(key: key);

  final String releaseState;
  final String releaseDate;
  final String releaseYearAndTime;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: ShoeAvailibilityBadge(releaseState: releaseState),
          ),
          HeatText(
            text: releaseDate,
            fontWeight: FontWeight.w700,
            color: const Color(0xff545453),
          ),
          HeatText(
            text: releaseYearAndTime,
            fontWeight: FontWeight.w400,
            color: const Color(0xff545453),
          )
        ],
      ),
    );
  }
}

class ShoeAvailibilityBadge extends StatelessWidget {
  const ShoeAvailibilityBadge({Key? key, required this.releaseState})
      : super(key: key);

  final String releaseState;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: HeatText(
            text: releaseState,
            fontSize: 13,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w600),
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
