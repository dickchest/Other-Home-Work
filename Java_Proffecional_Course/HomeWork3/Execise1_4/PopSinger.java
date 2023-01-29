package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise1_4;

public class PopSinger implements Dancable, Singable{
    @Override
    public void dance() {
        System.out.println("I'm dancing");
    }

    @Override
    public void sing() {
        System.out.println("I'm singing");
    }
}
