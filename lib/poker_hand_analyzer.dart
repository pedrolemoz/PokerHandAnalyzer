import 'package:poker_analyzer/card.dart';

/**
 * Initial implementation, probably with poor performance
 */

void main() {
  List<Card> firstHand = [
    Card(3, 'Diamonds'),
    Card(11, 'Spades'),
    Card(8, 'Spades'),
    Card(4, 'Hearts'),
    Card(2, 'Spades'),
  ];

  List<Card> secondHand = [
    Card(10, 'Diamonds'),
    Card(11, 'Diamonds'),
    Card(12, 'Diamonds'),
    Card(13, 'Diamonds'),
    Card(14, 'Diamonds'),
  ];

  print(HandChecker.comparator(firstHand: firstHand, secondHand: secondHand));
}

class HandChecker {
  static const List handPower = [
    'High Card',
    'Pair',
    'Two pair',
    'Three of a kind',
    'Straight',
    'Flush',
    'Full House',
    'Four of a kind',
    'Straight Flush',
    'Royal Flush',
  ];

  static String comparator({List<Card> firstHand, List<Card> secondHand}) {
    final int firstIndex = handPower.indexOf(checker(firstHand));
    final int secondIndex = handPower.indexOf(checker(secondHand));

    print(firstIndex);
    print(secondIndex);

    if (firstIndex == 0 && secondIndex == 0) {
      final int firstHigherCard = firstHand.map((e) => e.value).reduce(
          (value, element) => value = value < element ? element : value);
      final int secondHigherCard = secondHand.map((e) => e.value).reduce(
          (value, element) => value = value < element ? element : value);

      return firstHigherCard > secondHigherCard
          ? 'Player 1 won'
          : 'Player 2 won';
    }

    return firstIndex > secondIndex ? 'Player 1 won' : 'Player 2 won';
  }

  static checker(List<Card> cards) {
    // Sorting cards by value
    cards.sort((a, b) => a.value.compareTo(b.value));

    // Pair
    if (cards[0].value == cards[1].value ||
        cards[1].value == cards[2].value ||
        cards[2].value == cards[3].value ||
        cards[3].value == cards[4].value) {
      // Two pair
      if (cards[0].value == cards[1].value &&
              cards[2].value == cards[3].value &&
              cards[3].value != cards[4].value ||
          cards[0].value != cards[1].value &&
              cards[1].value == cards[2].value &&
              cards[3].value == cards[4].value) {
        // Four of a kind
        if (cards[0].value == cards[1].value &&
                cards[1].value == cards[2].value &&
                cards[2].value == cards[3].value ||
            cards[1].value == cards[2].value &&
                cards[2].value == cards[3].value &&
                cards[3].value == cards[4].value) {
          return 'Four of a kind';
        } else {
          return 'Two pair';
        }
      } else {
        // Three of a kind
        if (cards[0].value == cards[1].value &&
                cards[1].value == cards[2].value ||
            cards[2].value == cards[3].value &&
                cards[3].value == cards[4].value) {
          // Full House
          if (cards[0].value == cards[1].value &&
                  cards[2].value == cards[3].value &&
                  cards[3].value == cards[4].value ||
              cards[0].value == cards[1].value &&
                  cards[1].value == cards[2].value &&
                  cards[3].value == cards[4].value) {
            return 'Full House';
          } else {
            return 'Three of a kind';
          }
        } else {
          return 'Pair';
        }
      }
    } else {
      // Straight
      for (int i = 1; i < cards.length; i++) {
        if (cards[i].value == cards[0].value + i) {
          continue;
        } else {
          // Flush
          for (int i = 1; i < cards.length; i++) {
            if (cards[i].suit == cards[0].suit) {
              continue;
            } else {
              // In case of none of those evaluations became true
              return 'High Card';
            }
          }

          return 'Flush';
        }
      }

      // Straight flush
      for (int i = 1; i < cards.length; i++) {
        if (cards[i].suit == cards[0].suit) {
          continue;
        } else {
          return 'Straight';
        }
      }

      // Royal flush
      if (cards[0].value == 10 && cards[4].value == 14) {
        return 'Royal Flush';
      }

      return 'Straight Flush';
    }
  }
}
