import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/components/card_widget.dart';
import 'package:poker_hand_analyzer/components/hand_table.dart';
import 'package:poker_hand_analyzer/model/user_hands.dart';
import 'package:poker_hand_analyzer/pages/cards_tabs.dart';
import 'package:poker_hand_analyzer/pages/result_page.dart';
import 'package:poker_hand_analyzer/utils/poker_card.dart';
import 'package:poker_hand_analyzer/utils/poker_hand_analyzer.dart';
import 'package:provider/provider.dart';

class SecondHandSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Escolha a segunda mão',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: HandTable(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: Provider.of<UserHands>(context).secondHand.isNotEmpty
                    ? () {
                        Provider.of<UserHands>(context, listen: false)
                            .deleteLastCardSecondHand();
                      }
                    : null,
                color: Colors.red[400],
                child: Text(
                  'Deletar',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: Provider.of<UserHands>(context).secondHand.length ==
                        5
                    ? () {
                        List<PokerCard> firstHand = List<PokerCard>.generate(
                            Provider.of<UserHands>(context, listen: false)
                                .firstHand
                                .length, (index) {
                          CardWidget card =
                              Provider.of<UserHands>(context, listen: false)
                                  .firstHand[index];
                          return PokerCard(card.value, card.suit);
                        });

                        List<PokerCard> secondHand = List<PokerCard>.generate(
                            Provider.of<UserHands>(context, listen: false)
                                .firstHand
                                .length, (index) {
                          CardWidget card =
                              Provider.of<UserHands>(context, listen: false)
                                  .secondHand[index];
                          return PokerCard(card.value, card.suit);
                        });

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ResultPage(
                              winner: HandChecker.comparator(
                            firstHand: firstHand,
                            secondHand: secondHand,
                          ));
                        }));
                      }
                    : null,
                color: Colors.green[600],
                child: Text(
                  'Analisar',
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
      ),
    );
  }
}
