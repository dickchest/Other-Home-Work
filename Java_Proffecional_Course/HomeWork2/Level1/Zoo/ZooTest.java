package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.Zoo;

public class ZooTest {
    public static void main(String[] args) {
        Cow cow = new Cow("Burenka", "Brown");
        Dog dog = new Dog("Sharik", "Black");
        Cat cat = new Cat("Matroskin", "Red");
        Lamb lamb = new Lamb("Shon", "White");

        System.out.println(cow.voice());
        System.out.println(dog.voice());
        System.out.println(cat.voice());
        System.out.println(lamb.voice());

        cat.eat("meat");
        cat.eat("fruits");
        cow.eat("meat");
        cow.eat("fruits");

        System.out.println(cow.toString());
        System.out.println(dog.toString());
        System.out.println(cat.toString());
        System.out.println(lamb.toString());


    }
}
