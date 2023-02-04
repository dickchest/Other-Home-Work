package JavaProfessionalCourse.Lesson5.HomeWork5.Level2;

import static JavaProfessionalCourse.Lesson5.HomeWork5.Level1.PrintArray.printArray;
import static JavaProfessionalCourse.Lesson5.HomeWork5.Level2.Exercise2.fillArray;

public class Exercise3 {
    public static void main(String[] args) {
        int[][] array = new int[5][5];

        fillArray(array);
        printArray(array);

        /*
        Вывести на консоль количество отрицательных элементов под главной диагональю матрицы
         */
        int count = 0;
        for (int i = 1; i < array.length; i++) {
            for (int j = 0; j < i; j++) {
                if(array[i][j] < 0) {
                    count ++;
                }
            }
        }
        System.out.println(count);

    }
}
