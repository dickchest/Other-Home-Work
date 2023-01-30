package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_11;

public abstract class AutoService {
    // переменные
    private boolean isRepair;

    // конструктор

    public AutoService(boolean isRepair) {
        this.isRepair = isRepair;
    }

    // геттеры сеттеры

    // методы
    public void fix(Auto auto) {
        auto.repear();
    }
}
