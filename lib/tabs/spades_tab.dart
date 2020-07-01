import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/components/card_widget.dart';
import 'package:poker_hand_analyzer/utils/constants.dart';

class SpadesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: clubsImageURI.length,
      padding: EdgeInsets.all(15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.69,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return CardWidget(
          imageURI: spadesImageURI.elementAt(index),
          suit: 'Spades',
          value: index + 2,
        );
      },
    );
  }
}
