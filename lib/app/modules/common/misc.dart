import 'package:flutter/material.dart';

import 'package:chaldea/models/models.dart';
import 'package:chaldea/utils/atlas.dart';

class CommandCardWidget extends StatelessWidget {
  final CardType card;
  final double width;

  const CommandCardWidget({Key? key, required this.card, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (![CardType.arts, CardType.buster, CardType.quick].contains(card)) {
      return const SizedBox();
    }
    final cardName = card.name;
    return SizedBox(
      width: width,
      height: width,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              left: width * 0.1,
              right: width * 0.1,
              top: width * 0.1,
              bottom: width * 0.1,
              child: Image.network(
                Atlas.dbAsset('card_bg_$cardName.png'),
                // width: 100,
                // height: 100,
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
              child: Image.network(
                Atlas.dbAsset('card_icon_$cardName.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned.fill(
              left: 6,
              right: 6,
              bottom: 0,
              child: Image.network(
                Atlas.dbAsset('card_txt_$cardName.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
