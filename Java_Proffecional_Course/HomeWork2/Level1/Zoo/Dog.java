package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.Zoo;

public class Dog extends Predator{

    public Dog() {
    }

    public Dog(String name, String color) {
        super(name, color);
    }

    @Override
    public String voice() {
        return "Gav";
    }

    @Override
    public void jump(int high) {
        if (high >= 4) {
            System.out.println("I can't jump so high");
            return;
        }
        super.jump(high);
    }

    @Override
    public void jump() {
        System.out.println("I'm jumping continuously");
    }

    @Override
    public String toString() {
        return "Dog{" +
                "name='" + getName() + '\'' +
                ", color='" + getColor() + '\'' +
                '}';
    }
}
