package JavaProfessionalCourse.Lesson2.HomeWork2.Level1;

public abstract class Shape {
    protected int size;
    String color;

    public Shape(int size, String color) {
        this.size = size;
        this.color = color;
    }

    public Shape() {
//        System.out.println(this);
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public abstract void draw();

    protected void printSize() {
        System.out.printf("size is %d%n", size);
    }

    public abstract double calculateArea();
    public abstract double calculatePerimeter();
}

