package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.Zoo;

public class Cow extends Herbivore{
    public Cow() {
    }

    public Cow(String name, String color) {
        super(name, color);
    }

    @Override
    public String voice() {
        return "Muuu";
    }

    @Override
    public void jump(int high) {
        if (high >= 3) {
            System.out.println("I can't jump so high");
            return;
        }
        super.jump(high);
    }

    @Override
    public String toString() {
        return "Cow{" +
                "name='" + getName() + '\'' +
                ", color='" + getColor() + '\'' +
                '}';
    }

}
