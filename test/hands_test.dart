import 'package:flutter_test/flutter_test.dart';
import 'package:poker_hand_analyzer/utils/poker_card.dart';
import 'package:poker_hand_analyzer/utils/poker_hand_analyzer.dart';

void main() {
  test('Should return High Card', () {
    List<PokerCard> cards = [
      PokerCard(3, 'Diamonds'),
      PokerCard(11, 'Spades'),
      PokerCard(8, 'Spades'),
      PokerCard(4, 'Hearts'),
      PokerCard(2, 'Spades'),
    ];
    expect(HandChecker.checker(cards), equals('High Card'));
  });

  test('Should return Pair', () {
    List<PokerCard> cards = [
      PokerCard(2, 'Spades'),
      PokerCard(3, 'Diamonds'),
      PokerCard(4, 'Spades'),
      PokerCard(4, 'Diamonds'),
      PokerCard(5, 'Hearts'),
    ];
    expect(HandChecker.checker(cards), equals('Pair'));
  });

  test('Should return Two pair', () {
    List<PokerCard> cards = [
      PokerCard(3, 'Hearts'),
      PokerCard(3, 'Clubs'),
      PokerCard(4, 'Spades'),
      PokerCard(4, 'Diamonds'),
      PokerCard(5, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Two pair'));
  });

  test('Should return Three of a kind', () {
    List<PokerCard> cards = [
      PokerCard(3, 'Diamonds'),
      PokerCard(3, 'Clubs'),
      PokerCard(4, 'Diamonds'),
      PokerCard(7, 'Hearts'),
      PokerCard(3, 'Spades'),
    ];
    expect(HandChecker.checker(cards), equals('Three of a kind'));
  });

  test('Should return Straight', () {
    List<PokerCard> cards = [
      PokerCard(9, 'Diamonds'),
      PokerCard(10, 'Diamonds'),
      PokerCard(11, 'Spades'),
      PokerCard(12, 'Clubs'),
      PokerCard(13, 'Hearts'),
    ];
    expect(HandChecker.checker(cards), equals('Straight'));
  });

  test('Should return Flush', () {
    List<PokerCard> cards = [
      PokerCard(2, 'Diamonds'),
      PokerCard(4, 'Diamonds'),
      PokerCard(6, 'Diamonds'),
      PokerCard(8, 'Diamonds'),
      PokerCard(7, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Flush'));
  });

  test('Should return Full House', () {
    List<PokerCard> cards = [
      PokerCard(3, 'Spades'),
      PokerCard(3, 'Hearts'),
      PokerCard(4, 'Spades'),
      PokerCard(4, 'Clubs'),
      PokerCard(4, 'Clubs'),
    ];
    expect(HandChecker.checker(cards), equals('Full House'));
  });

  test('Should return Four of a kind', () {
    List<PokerCard> cards = [
      PokerCard(3, 'Diamonds'),
      PokerCard(4, 'Clubs'),
      PokerCard(4, 'Diamonds'),
      PokerCard(4, 'Spades'),
      PokerCard(4, 'Hearts'),
    ];
    expect(HandChecker.checker(cards), equals('Four of a kind'));
  });

  test('Should return Straight Flush', () {
    List<PokerCard> cards = [
      PokerCard(9, 'Diamonds'),
      PokerCard(10, 'Diamonds'),
      PokerCard(11, 'Diamonds'),
      PokerCard(12, 'Diamonds'),
      PokerCard(13, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Straight Flush'));
  });

  test('Should return Royal Flush', () {
    List<PokerCard> cards = [
      PokerCard(10, 'Diamonds'),
      PokerCard(11, 'Diamonds'),
      PokerCard(12, 'Diamonds'),
      PokerCard(13, 'Diamonds'),
      PokerCard(14, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Royal Flush'));
  });
}
