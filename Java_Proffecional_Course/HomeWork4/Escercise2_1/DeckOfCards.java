package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise2_1;

import java.util.Arrays;
import java.util.Random;

public class DeckOfCards {
    final CardsSuits[] suits = CardsSuits.values();
    final CardsRank[] rank = CardsRank.values();

    final int numberOfCards = suits.length * rank.length; // number of cards
    String[] deck = new String[numberOfCards];


    public int getNumberOfCards() {
        return numberOfCards;
    }

    // deck initialization
    public void initialization() {
        for (int i = 0; i < rank.length; i++) {
            for (int j = 0; j < suits.length; j++) {
                deck[suits.length * i + j] = rank[i].getRank() + " " + suits[j].getSuits();
            }
        }
    }

    // deck shuffling
    public void shuffling() {

        final Random random = new Random();

        for (int i = 0; i < numberOfCards; i++) {
            int card = i + (random.nextInt(numberOfCards - i)); // random card in the deck
            String temp = deck[card];
            deck[card] = deck[i];
            deck[i] = temp;
        }
    }

    // the shuffled deck is displayed
    public void displayCards(int players, int cardsForPlayer) {
        for (int i = 0; i < players * cardsForPlayer; i++) {
            System.out.println(deck[i]);

            if (i % cardsForPlayer == cardsForPlayer - 1)
                System.out.println();
        }
    }

}
