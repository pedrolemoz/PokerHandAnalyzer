import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/components/green_table.dart';
import 'package:poker_hand_analyzer/model/user_hands.dart';
import 'package:poker_hand_analyzer/utils/hand_selection.dart';
import 'package:provider/provider.dart';

class HandTable extends StatefulWidget {
  @override
  _HandTableState createState() => _HandTableState();
}

class _HandTableState extends State<HandTable> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        GreenTable(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:
              Provider.of<UserHands>(context).seletedHand == Hand.firstHand
                  ? Provider.of<UserHands>(context).firstHand.isEmpty
                      ? [Container()]
                      : Provider.of<UserHands>(context).firstHand
                  : Provider.of<UserHands>(context).secondHand.isEmpty
                      ? [Container()]
                      : Provider.of<UserHands>(context).secondHand,
        ),
      ],
    );
  }
}
