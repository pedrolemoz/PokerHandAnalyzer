import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/components/hand_table.dart';
import 'package:poker_hand_analyzer/model/user_hands.dart';
import 'package:poker_hand_analyzer/pages/cards_tabs.dart';
import 'package:poker_hand_analyzer/pages/second_hand_selection.dart';
import 'package:poker_hand_analyzer/utils/hand_selection.dart';
import 'package:provider/provider.dart';

class FirstHandSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: HandTable(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: Provider.of<UserHands>(context).firstHand.isNotEmpty
                  ? () {
                      Provider.of<UserHands>(context, listen: false)
                          .deleteLastCardFirstHand();
                    }
                  : null,
              color: Colors.red[800],
              child: Text(
                'Deletar',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: Provider.of<UserHands>(context).firstHand.length == 5
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          Provider.of<UserHands>(context).seletedHand =
                              Hand.secondHand;
                          return SecondHandSelection();
                        }),
                      );
                    }
                  : null,
              color: Colors.green[600],
              child: Text(
                'Continuar',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
        Flexible(child: CardsTabs()),
      ],
    );
  }
}
