package JavaCourse.Lesson9;

public class HomeWorkNine {
    /*
        First level: лифт, находящийся на первом этаже здания высотой H, должен подняться на последний этаж. Лифт сломан.
Каждый раз он поднимается на N этажей и спускается на M этажей.
Если на последнем подьеме лифт превысил колличество этажей, то считается что лифт поднялся на самый верх.
Найдите количество подьемов, которые понадобятся лифту.

Ввод:
H = 200, N = 50, M = 1
Ответ: 5
Объяснение:
Первый подьем: 50 - 1 = 49
Второй подьем: 49 + 50 - 1 = 98
Третий подьем: 98 + 50 - 1 = 147
Четвертый подьем: 147 + 50 - 1 = 196
Пятый подьем: выйти за пределы H.

реализовать метод numberOfLifts(int floor, int stepUp, int stepDown)
     */
    // обявляем глобальную переменную, что би использовать внутри метода
    static int height = 200;

    private static int numberOfLifts(int floor, int stepUp, int stepDown) {
        floor = floor + stepUp - stepDown;
        if (floor > height) {
            floor = height;
        }
        return floor;
    }


    public static void main(String[] args) {
        // обявление переменных
        int stepUp = 50;
        int stepDown = 1;
        int current_position = 1;
        int i = 1;
        // цикл - движение лифта
        while (current_position < height) {
            current_position = numberOfLifts(current_position, stepUp, stepDown);
            System.out.printf("%d-й поподьем: %d\n", i, current_position);
            i++;
        }
        // вывод результата
        System.out.println("-------------------");
        System.out.printf("Количество подьемов: %d\n", i-1);
    }
}
