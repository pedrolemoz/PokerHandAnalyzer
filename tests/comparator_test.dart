import 'package:poker_analyzer/card.dart';
import 'package:test/test.dart';
import '../lib/poker_hand_analyzer.dart';

// TODO: Criar os testes de comparação

void main() {
  test('Should return true if contains', () {
    List<Card> cards = [
      Card(3, 'Diamonds'),
      Card(11, 'Spades'),
      Card(8, 'Spades'),
      Card(4, 'Hearts'),
      Card(2, 'Spades'),
    ];
    expect(HandChecker.checker(cards), equals('High Card'));
  });
}
