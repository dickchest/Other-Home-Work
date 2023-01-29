package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise2_2;

public class DanceFloor {
    public static void main(String[] args) {
        Danceable firstDancer = new Dancer();
        Danceable secondDancer = new PopDancer();

        /*
        Создайте массив Dancable[] и добавьте 6 танцоров, пройдитесь по каждому из них и вызовите метод для танца
         */

        Danceable[] dancers = new Danceable[6];
        dancers[0] = new Dancer();
        dancers[1] = new BalletDancer();
        dancers[2] = new BallroomDancer();
        dancers[3] = new BreakDancer();
        dancers[4] = new FolkDancer();
        dancers[5] = new PopDancer();

        for (int i = 0; i < dancers.length; i++) {
            dancers[i].dance();
        }

    }
}
