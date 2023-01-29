package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.Zoo;

public class Lamb extends Herbivore{

    public Lamb() {
    }

    public Lamb(String name, String color) {
        super(name, color);
    }

    @Override
    public String voice() {
        return "Beee";
    }

    @Override
    public void jump(int high) {
        if (high >= 2) {
            System.out.println("I can't jump so high");
            return;
        }
        super.jump(high);
    }
}
