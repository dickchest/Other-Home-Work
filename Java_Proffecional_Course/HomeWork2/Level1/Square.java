package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

public class Square extends Shape {
    int width;


    public Square(int size, String color, int width) {
        super(size, color);
        this.width = width;
    }

    public Square() {
    }

    @Override
    public void draw() {
        System.out.println("draw square");
    }

    @Override
    public String toString() {
        return "Square{" +
                "width=" + width +
                ", size=" + size +
                ", color='" + color + '\'' +
                '}';
    }

    @Override
    public double calculateArea() {
        return width * width;
    }

    @Override
    public double calculatePerimeter() {
        return 4 * width;
    }
}
