package JavaProfessionalCourse.Lesson5.HomeWork5.Level2;

import java.util.Arrays;
import java.util.Random;

import static JavaProfessionalCourse.Lesson5.HomeWork5.Level1.PrintArray.printArray;

public class Exercise2 {
    public static void main(String[] args) {
        /*
        Создать 2 двумерных массива 5x5 и заполнить их числами, 
        написать программу для нахождения суммы двух массивов
         */
        
        int[][] a = new int[5][5];
        int[][] b = new int[5][5];
        System.out.println("--- Array 1 ---");
        fillArray(a);
        printArray(a);

        System.out.println("--- Array 2 ---");
        fillArray(b);
        printArray(b);

        System.out.println("--- Array 1 + Array 2 ---");
        printArray(sumArray(a, b));


    }

    // метод заполнения массивов случайными числами
    public static int[][] fillArray(int[][] array) {
        Random random = new Random();

        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array[i].length; j++) {
                array[i][j] = random.nextInt(-20, 20);
            }
        }
        return array;
    }

    // метод сложения массивов
    public static int[][] sumArray(int[][] a, int[][] b) {
        int[][] result = new int[a.length][a[0].length];

        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < a[0].length; j++) {
                result[i][j] = a[i][j] + b[i][j];
            }
        }
        return result;
    }
}
