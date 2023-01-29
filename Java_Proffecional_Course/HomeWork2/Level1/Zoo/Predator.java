package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.Zoo;

public abstract class Predator extends Animal{

    public Predator() {
    }

    public Predator(String name, String color) {
        super(name, color);
    }

    @Override
    public void eat(String food) {
        System.out.println("I'm eating");
    }

}
