package JavaProfessionalCourse.Lesson5.HomeWork5.Level2;

import java.util.Arrays;

public class Exercise1 {
    public static void main(String[] args) {
        /*
        Реализуйте алгоритм сортировки пузырьком. Алгоритм состоит в повторяющихся проходах
        по сортируемому массиву. На каждой итерации последовательно сравниваются соседние элементы,
        и, если порядок в паре неверный, то элементы меняют местами.
         */

        int[] arr = {-2, 45, 0, 11, -9};

        for (int i = 0; i < arr.length - 1; i++) {
            for (int j = 0; j < arr.length - 1; j++) {
                if (arr[j] > arr[j + 1]) {
                    int tmp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = tmp;
                }
            }
            System.out.println(Arrays.toString(arr));
        }
    }
}
