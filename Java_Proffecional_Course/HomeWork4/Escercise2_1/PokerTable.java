package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise2_1;

import java.util.Random;
import java.util.Scanner;

public class PokerTable {
    public static void main(String[] args) {

        DeckOfCards deckOfCards = new DeckOfCards();
        final Scanner sc = new Scanner(System.in);

        final int cardsForPlayer = 5;
        int players;
        int numberOfCards = deckOfCards.numberOfCards;

        while (true) {
            System.out.println("Enter the number of players: ");

            if (sc.hasNextInt()) {
                players = sc.nextInt();
                if (cardsForPlayer * players <= numberOfCards && players > 0) {
                    break;
                } else {
                    if (players == 0) {
                        System.out.println("The game has been terminated.");
                        break;
                    } else if (players < 0) {
                        System.out.println("The number of players cannot be less than 0");
                    } else {
                        System.out.println("Too many players!");
                    }
                }
            } else {
                System.out.println("You have not entered a number, or your number is too large!");
            }
        }

        deckOfCards.initialization();
        deckOfCards.shuffling();
        deckOfCards.displayCards(players, cardsForPlayer);
    }
}
