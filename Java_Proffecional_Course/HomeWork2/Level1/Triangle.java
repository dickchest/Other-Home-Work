package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

public class Triangle extends Shape {
    int firstSide;
    int secondSide;
    int thirdSide;

    public Triangle(int size, String color, int firstSide, int secondSide, int thirdSide) {
        super(size, color);
        this.firstSide = firstSide;
        this.secondSide = secondSide;
        this.thirdSide = thirdSide;
    }

    public Triangle() {
    }

    @Override
    public String toString() {
        return "Triangle{" +
                "firstSide=" + firstSide +
                ", secondSide=" + secondSide +
                ", thirdSide=" + thirdSide +
                ", size=" + size +
                ", color='" + color + '\'' +
                '}';
    }

    @Override
    public void draw() {
        System.out.println("Рисую треухгольник");
    }

    @Override
    public double calculateArea() {
        double p = calculatePerimeter() / 2;
        return Math.sqrt(p * (p - firstSide) * (p - secondSide) * (p - thirdSide));
    }

    @Override
    public double calculatePerimeter() {
        return firstSide + secondSide + thirdSide;
    }
}
