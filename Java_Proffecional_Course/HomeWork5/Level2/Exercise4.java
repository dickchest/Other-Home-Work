package JavaProfessionalCourse.Lesson5.HomeWork5.Level2;

import java.util.Scanner;

import static JavaProfessionalCourse.Lesson5.HomeWork5.Level1.PrintArray.printArray;

public class Exercise4 {
    public static void main(String[] args) {
        int[][] array = new int[2][2];

        // ввод матриці с клавиатурі
//        fillArray(array);
        Scanner scanner = new Scanner(System.in);
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array[i].length; j++) {
                System.out.printf("Element (%d:%d) = ", i, j);
                array[i][j] = scanner.nextInt();
            }
        }
        printArray(array);

        int max = -1_000_000;

        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array[i].length; j++) {
                if (array[i][j] % 2 == 0) {
                    if (max < array[i][j]) {
                        max = array[i][j];
                    }
                }
            }
        }
        System.out.println("Max among even = " + max);
    }
}
