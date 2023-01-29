package JavaProfessionalCourse.Lesson2.HomeWork2.Level2.Exercise1;

import JavaProfessionalCourse.Lesson2.HomeWork2.Level1.*;

import java.util.Random;

public class ShapeGenerator {
    void generate() {
        Random random = new Random();
        int i = random.nextInt(4);
//        System.out.println(i);
        Shape shape = switch (i) {
            case 0 -> new Circle(1, 2, "Black");
            case 1 -> new Square(1, "White", 4);
            case 2 -> new Triangle(1, "Yellow", 3,4,5);
            default -> new Dot();
        };
        shape.draw();
    }

    public static void main(String[] args) {
        ShapeGenerator generator = new ShapeGenerator();
        generator.generate();
        generator.generate();
        generator.generate();
        generator.generate();
        generator.generate();

    }
}
