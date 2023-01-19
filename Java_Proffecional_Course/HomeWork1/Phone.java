package JavaProfessionalCourse.Lesson1.HomeWork1;

public class Phone {

    private String number;
    private String model;
    private double weight;

    // конструктор
    public Phone(String number, String model, double weight) {
        this.number = number;
        this.model = model;
        this.weight = weight;
    }

    // метод, выводит имя звонящего
    public void receiveCall(String name) {
        System.out.printf("Звонит %s\n", name);
    }

    // геттер для намбера
    public String getNumber() {
        return number;
    }

    // функция toString
    @Override
    public String toString() {
        return "Phone{" +
                "number=" + number +
                ", model='" + model + '\'' +
                ", weight=" + weight +
                '}';
    }
}

