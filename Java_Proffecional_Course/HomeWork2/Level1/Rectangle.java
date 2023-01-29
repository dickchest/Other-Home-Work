package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

public class Rectangle extends Shape {

    int sideA;
    int sideB;

    public Rectangle(int size, String color, int sideA, int sideB) {
        super(size, color);
        this.sideA = sideA;
        this.sideB = sideB;
    }

    @Override
    public void draw() {
        System.out.println("Draw a rectangle");
    }

    @Override
    public double calculateArea() {
        return sideA * sideB;
    }

    @Override
    public double calculatePerimeter() {
        return 2 * sideA + 2 * sideB;
    }
}
