package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

public class Circle extends Shape {
    int radius;

    public Circle(int size, int radius, String color) {
        super(size, color);
        this.radius = radius;
    }

    public Circle() {
//        System.out.println(this);
    }

    @Override
    public void draw() {
        System.out.println("draw Circle");
    }

    @Override
    public String toString() {
        return "Circle{" +
                "radius=" + radius +
                ", size=" + size +
                ", color='" + color + '\'' +
                '}';
    }

    @Override
    public double calculateArea() {
        return Math.PI * radius * radius;
    }

    @Override
    public double calculatePerimeter() {
        return 2* Math.PI * radius;
    }
}
