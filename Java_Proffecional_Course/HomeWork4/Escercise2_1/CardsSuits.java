package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise2_1;

public enum CardsSuits {
    CLUBS("clubs"),
    DIAMONDS("diamonds"),
    HEARTS("hearts"),
    SPADES("spades");

    private String suits;

    CardsSuits(String suits) {
        this.suits = suits;
    }

    public String getSuits() {
        return suits;
    }
}
