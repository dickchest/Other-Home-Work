package JavaProfessionalCourse.Lesson5.HomeWork5.Level1;

import java.util.Random;

import static JavaProfessionalCourse.Lesson5.HomeWork5.Level1.PrintArray.printArray;

public class Exercise1 {
    public static void main(String[] args) {
        int[][] array = new int[10][10];
        Random random = new Random();
        for (int i = 0; i < array.length; i++) {
            for (int j = 0; j < array[i].length; j++) {
                array[i][j] = random.nextInt(101);
            }
        }
        printArray(array);
        System.out.println();


        // Найти максимальный элемент побочной диагонали
        int max = 0;
        int line = 0;
        for (int i = 0; i < array.length; i++) {
            int j = array[i].length - i - 1;
            if (array[i][j] > max) {
                max = array[i][j];
                line = i+1;
            }
        }
        printArray(array);
        System.out.printf("Max = %d in line %d", max, line);
    }

}

