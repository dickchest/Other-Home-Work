package JavaCourse.Lesson10_Massives;

public class HomeWorkTen {
    /*
    First level: 2. Дан массив из N целых чисел и целое число  K , найдите количество пар элементов в массиве, сумма которых равна K.

Пример 1:
Вход:
N = 4, K = 6
arr[] = {1, 5, 7, 1}
Вывод: 2
Объяснение:
arr[0] + arr[1] = 1 + 5 = 6
arr[1] + arr[3] = 5 + 1 = 6.

Пример 2:
Вход:
N = 4, К = 2
arr[] = {1, 1, 1, 1}
Выход: 6
Объяснение:

Каждая 1 даст в сумме 2 с любой 1.
     */
    public static void main(String[] args) {
        // обявляем переменные
        int[] arr = {1, 5, 7, 1};
        int N = 4;
        int K = 6;
        int amount = 0;

        // находим количество пар
        for (int i = 0; i < arr.length-1; i++) {
            for (int j = i+1; j < arr.length ; j++) {
                if (arr[i] + arr[j] == K) {
                    amount++;
                }
            }
        }

        // выводим результат
        System.out.printf("Количество пар, сумма которых равна %d является: %d", K, amount);
    }
}
