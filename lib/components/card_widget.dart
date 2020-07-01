import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/model/user_hands.dart';
import 'package:poker_hand_analyzer/utils/hand_selection.dart';
import 'package:provider/provider.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    @required this.imageURI,
    @required this.suit,
    @required this.value,
  });

  final String imageURI;
  final String suit;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(17.0),
      elevation: 4.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(17.0),
        onTap: () {
          print('$value - $suit');
          Provider.of<UserHands>(context, listen: false).seletedHand ==
                  Hand.firstHand
              ? Provider.of<UserHands>(context, listen: false)
                  .addCardFirstHand((this))
              : Provider.of<UserHands>(context, listen: false)
                  .addCardSecondHand((this));
        },
        child: Container(
          height: 72.6,
          width: 50.0,
          child: Image.asset(imageURI),
        ),
      ),
    );
  }
}
