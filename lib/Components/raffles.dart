import 'package:flutter/cupertino.dart';

import 'button_link.dart';
import 'heat_text.dart';

class Raffle {
  String name;
  String url;
  Raffle(this.name, this.url);
}

class RaffleCard extends StatefulWidget {
  const RaffleCard({Key? key, required this.name, required this.url})
      : super(key: key);

  final String name;
  final String url;

  @override
  _RaffleCardState createState() => _RaffleCardState();
}

class _RaffleCardState extends State<RaffleCard> {
  bool checked = false;

  void _turnChecked() {
    setState(() {
      checked = !checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _turnChecked,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: checked
                      ? const Center(
                          child: HeatText(text: "✓", color: Color(0xfff2f2f7)))
                      : null,
                  margin: const EdgeInsets.only(right: 12),
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2.0,
                        color: checked
                            ? const Color(0xffc72740)
                            : const Color(0xff272324)),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(14),
                    ),
                    color: checked
                        ? const Color(0xffC72740)
                        : const Color(0xffF4F4F5),
                  ),
                ),
                HeatText(
                    text: widget.name,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff272324),
                    fontSize: 16),
              ],
            ),
            ButtonLink(
                text: 'Öffnen',
                url: widget.url,
                color: const Color(0xffffffff),
                backgroundColor:
                    checked ? const Color(0xff545453) : const Color(0xffc72740))
          ],
        ),
      ),
    );
  }
}

class Raffles extends StatelessWidget {
  const Raffles({Key? key, required this.raffelList}) : super(key: key);

  final List<Raffle> raffelList;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: const HeatText(
                    text: "Raffles", fontSize: 13, color: Color(0xff545453))),
            Column(
                children: raffelList
                    .map(
                      (raffle) => Container(
                        child: Center(
                            child: RaffleCard(
                          name: raffle.name,
                          url: raffle.url,
                        )),
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
