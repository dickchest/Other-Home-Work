package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_9;

public enum Alphabet {
    A("a"),
    B("b"),
    C("c"),
    D("d"),
    E("e"),
    F("f"),
    G("g"),
    H("h"),
    I("i"),
    J("j"),
    K("k"),
    L("l"),
    M("m"),
    N("n"),
    O("o"),
    P("p"),
    Q("q"),
    R("r"),
    S("s"),
    T("t"),
    U("u"),
    V("v"),
    W("w"),
    X("x"),
    Y("y"),
    Z("z");

    String letter;
    private int number;

    private Alphabet(String letter) {
        this.letter = letter;
    }

    public String getLetter() {
        return letter;
    }
}
