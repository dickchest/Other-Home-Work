package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.ExcisesThree;

public class Child extends Person {
    private Father father;
    private Mother mother;

    @Override
    public void myMethod() {
        father.myMethod();
        mother.myMethod();
    }
}
