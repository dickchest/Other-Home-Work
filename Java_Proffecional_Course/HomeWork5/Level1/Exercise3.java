package JavaProfessionalCourse.Lesson5.HomeWork5.Level1;

import static JavaProfessionalCourse.Lesson5.HomeWork5.Level1.PrintArray.printArray;

public class Exercise3 {
    public static void main(String[] args) {
        // Создать двумерный массив. Заполнить его элементами,
        // каждый из которых вычисляется по формуле: a[i,j]:=7i-3j. Вывести массив на экран.

        int[][] arr = new int[10][10];

        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[i].length; j++) {
                arr[i][j] = 7*i - 3*j;
            }
        }
        printArray(arr);
    }
}
