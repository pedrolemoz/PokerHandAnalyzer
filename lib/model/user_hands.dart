import 'package:flutter/material.dart';
import 'package:poker_hand_analyzer/utils/hand_selection.dart';

class UserHands extends ChangeNotifier {
  List<Widget> firstHand = [];
  List<Widget> secondHand = [];
  Hand seletedHand = Hand.firstHand;

  void addCardFirstHand(Widget card) {
    if (firstHand.length < 5) {
      firstHand.add(card);
      notifyListeners();
    }
  }

  void addCardSecondHand(Widget card) {
    if (secondHand.length < 5) {
      secondHand.add(card);
      notifyListeners();
    }
  }

  void deleteCardFirstHand(Widget card) {
    firstHand.remove(card);
    notifyListeners();
  }

  void deleteCardSecondHand(Widget card) {
    secondHand.remove(card);
    notifyListeners();
  }

  void deleteLastCardFirstHand() {
    firstHand.removeLast();
    notifyListeners();
  }

  void deleteLastCardSecondHand() {
    secondHand.removeLast();
    notifyListeners();
  }
}
