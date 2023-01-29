package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.Zoo;

public abstract class Herbivore extends Animal{
    public Herbivore() {
    }

    public Herbivore(String name, String color) {
        super(name, color);
    }

    @Override
    public void eat(String food) {
        if ("meat".equals(food)) {
            System.out.println("Я такое не ем");
        } else {
            System.out.println("I'm eating");
        }
    }
}
