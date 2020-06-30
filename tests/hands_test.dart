import 'package:poker_analyzer/card.dart';
import 'package:test/test.dart';
import '../lib/poker_hand_analyzer.dart';

void main() {
  test('Should return High Card', () {
    List<Card> cards = [
      Card(3, 'Diamonds'),
      Card(11, 'Spades'),
      Card(8, 'Spades'),
      Card(4, 'Hearts'),
      Card(2, 'Spades'),
    ];
    expect(HandChecker.checker(cards), equals('High Card'));
  });

  test('Should return Pair', () {
    List<Card> cards = [
      Card(2, 'Spades'),
      Card(3, 'Diamonds'),
      Card(4, 'Spades'),
      Card(4, 'Diamonds'),
      Card(5, 'Hearts'),
    ];
    expect(HandChecker.checker(cards), equals('Pair'));
  });

  test('Should return Two pair', () {
    List<Card> cards = [
      Card(3, 'Hearts'),
      Card(3, 'Clubs'),
      Card(4, 'Spades'),
      Card(4, 'Diamonds'),
      Card(5, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Two pair'));
  });

  test('Should return Three of a kind', () {
    List<Card> cards = [
      Card(3, 'Diamonds'),
      Card(3, 'Clubs'),
      Card(4, 'Diamonds'),
      Card(7, 'Hearts'),
      Card(3, 'Spades'),
    ];
    expect(HandChecker.checker(cards), equals('Three of a kind'));
  });

  test('Should return Straight', () {
    List<Card> cards = [
      Card(9, 'Diamonds'),
      Card(10, 'Diamonds'),
      Card(11, 'Spades'),
      Card(12, 'Clubs'),
      Card(13, 'Hearts'),
    ];
    expect(HandChecker.checker(cards), equals('Straight'));
  });

  test('Should return Flush', () {
    List<Card> cards = [
      Card(2, 'Diamonds'),
      Card(4, 'Diamonds'),
      Card(6, 'Diamonds'),
      Card(8, 'Diamonds'),
      Card(7, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Flush'));
  });

  test('Should return Full House', () {
    List<Card> cards = [
      Card(3, 'Spades'),
      Card(3, 'Hearts'),
      Card(4, 'Spades'),
      Card(4, 'Clubs'),
      Card(4, 'Clubs'),
    ];
    expect(HandChecker.checker(cards), equals('Full House'));
  });

  test('Should return Four of a kind', () {
    List<Card> cards = [
      Card(3, 'Diamonds'),
      Card(4, 'Clubs'),
      Card(4, 'Diamonds'),
      Card(4, 'Spades'),
      Card(4, 'Hearts'),
    ];
    expect(HandChecker.checker(cards), equals('Four of a kind'));
  });

  test('Should return Straight Flush', () {
    List<Card> cards = [
      Card(9, 'Diamonds'),
      Card(10, 'Diamonds'),
      Card(11, 'Diamonds'),
      Card(12, 'Diamonds'),
      Card(13, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Straight Flush'));
  });

  test('Should return Royal Flush', () {
    List<Card> cards = [
      Card(10, 'Diamonds'),
      Card(11, 'Diamonds'),
      Card(12, 'Diamonds'),
      Card(13, 'Diamonds'),
      Card(14, 'Diamonds'),
    ];
    expect(HandChecker.checker(cards), equals('Royal Flush'));
  });
}
