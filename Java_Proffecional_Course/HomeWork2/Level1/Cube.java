package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

public class Cube extends Shape3D {

    private int width;

    public Cube(int width) {
        this.width = width;
    }

    @Override
    public void draw() {
        System.out.println("Draw a cube");
    }

    @Override
    public double calculateArea() {
        return 6 * width * width;
    }

    @Override
    public double calculatePerimeter() {
        return 12 * width;
    }

    @Override
    public double volume() {
        return width * width * width;
    }
}
