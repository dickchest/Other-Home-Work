package JavaProfessionalCourse.Lesson1.HomeWork1;

public class Person {
    private String fullName;
    private int age;

    public Person() {
    }

    public Person(String fullName, int age) {
        this.fullName = fullName;
        this.age = age;
    }

    public void Move() {
        System.out.println(this.fullName + " движется");
    }

    public void Talk() {
        System.out.println(this.fullName + " говорит");
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
}
