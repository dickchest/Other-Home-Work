package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

public class Cylinder extends Shape3D {

    int radius;
    int height;

    public Cylinder(int radius, int height) {
        this.radius = radius;
        this.height = height;
    }

    @Override
    public void draw() {
        System.out.println("Draw a cylinder");
    }

    @Override
    public double calculateArea() {
        return 2 * Math.PI * radius * height + 2 * Math.PI * radius * radius;
    }

    @Override
    public double calculatePerimeter() {
        return 0;
    }

    @Override
    public double volume() {

        return Math.PI*radius*radius*height;
    }
}
