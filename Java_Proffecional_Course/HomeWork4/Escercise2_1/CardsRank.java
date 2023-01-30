package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise2_1;

public enum CardsRank {

TWO("2"),
THREE("3"),
FOUR("4"),
FIVE("5"),
SIX("6"),
SEVEN("7"),
EIGHT("8"),
NINE("9"),
TEN("10"),
JACK("Jack"),
QUEEN("Queen"),
KING("King"),
ACE("Ace");

private String rank;

    CardsRank(String rank) {
        this.rank = rank;
    }

    public String getRank() {
        return rank;
    }
}
