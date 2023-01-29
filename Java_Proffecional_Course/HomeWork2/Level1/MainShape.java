package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

import java.io.PrintStream;

public class MainShape {
    public static void main(String[] args) {
        Circle circle = new Circle(1, 2, "Green");
        Triangle triangle = new Triangle(1, "Red", 3, 4, 5);
        Square square = new Square(1, "Yellow", 3);

        System.out.println(circle);
        System.out.println(triangle);
        System.out.println(square);

        System.out.println("Площадь: " + circle.calculateArea());
        System.out.println("Периметр: " + circle.calculatePerimeter());

        PrintStream printf = System.out.printf("Площадь: %.2f%n", triangle.calculateArea());
        System.out.printf("Периметр: %.2f%n", triangle.calculatePerimeter());

        System.out.printf("Площадь: %.2f%n", square.calculateArea());
        System.out.printf("Периметр: %.2f%n", square.calculatePerimeter());
    }
}
