package JavaProfessionalCourse.Lesson5.HomeWork5.Level1;

import static JavaProfessionalCourse.Lesson5.HomeWork5.Level1.PrintArray.printArray;

public class Exercise4 {
    public static void main(String[] args) {
        char[][] chess = new char[8][8];

        for (int i = 0; i < chess.length; i++) {
            for (int j = 0; j < chess.length; j++) { // не обязательно писать chess[i].length. тк это квадрат
                if (((i % 2 == 0) && (j % 2 == 0)) || ((i % 2 != 0) && (j % 2 != 0)) ) {
                    chess[i][j] = ' ';
                } else
                    chess[i][j] = 'X';
            }
        }
        printArray(chess);
    }
}
