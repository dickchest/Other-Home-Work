package JavaCourse.Lesson8.HomeWork8;

public class HomeWorklAcht {
    public static void main(String[] args) {
        /*
        First level: В переменной month лежит какое-то число из интервала от 1 до 12.
Определите в какую пору года попадает этот месяц (зима, лето, весна, осень).
Выберите наилучший способ сделать это.
         */

        // выбираем случайно номер месяца
        int month = (int) Math.ceil(Math.random()*12);
        String season = switch (month) {
            case 12, 1, 2 -> "зима";
            case 3, 4, 5 -> "весна";
            case 6, 7, 8 -> "лето";
            case 9,10,11 -> "осень";
            default -> throw new IllegalStateException("Unexpected value: " + month);
        };

        System.out.printf("месяц %d - это %s", month, season);
    }
}
