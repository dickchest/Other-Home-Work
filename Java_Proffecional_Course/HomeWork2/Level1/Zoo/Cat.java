package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.Zoo;

public class Cat extends Predator{

    public Cat() {
    }

    public Cat(String name, String color) {
        super(name, color);
    }

    @Override
    public String voice() {
        return "Myauuu";
    }

    @Override
    public String toString() {
        return "Cat{" +
                "name='" + getName() + '\'' +
                ", color='" + getColor() + '\'' +
                '}';
    }
}
