package JavaProfessionalCourse.Lesson5.HomeWork5.Level2;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Random;
import java.util.Scanner;

import static JavaProfessionalCourse.Lesson5.HomeWork5.Level1.PrintArray.printArray;

public class Exercise5 {
    public static void main(String[] args) {
        /*
        Подумайте как можно реализовать игру морской бой
        и если есть идеи можете накидать примерную реализацию
        (должна быть двухмерный массив)
         */
        // -------------------------------------------------
        // начинал решать задачу процедурным программирование
        // потом решил продолжить с применением ООП
        // в package Exercise5.BattleOfTheShips
        // -------------------------------------------------

        Random random = new Random();
        Scanner scanner = new Scanner(System.in);

        // инициализация игровых досок
        int[][] player1 = new int[10][10];
        int[][] player2 = new int[10][10];

        // Расставление кораблей случайным образом
        // 1 - 4х палубный, 2 - 3х палубных, 3 - 2х палубных, 4 - однопалубных
        for (int size = 4; size > 0 ; size--) {
            for (int i = 0; i <= 4 - size ; i++) {
                placeShip(player1, size);
            }
        }
        printArray(player1);
        // ----


    }





    // расстановка кораблей
    public static int[][] placeShip(int[][] array, int size) {
        Random random = new Random();
        // случайным образом выбираем клетку и направление и если не занято,
        // то ставим корабль
        boolean isEmpty = false;
        int xFound = 0;
        int yFound = 0;
        int directionFound = 0;

        while (!isEmpty) {

            int x = random.nextInt(10);
            int y = random.nextInt(10);
            int direction = random.nextInt(4); // 0 - N, 1 - E, 2 - S, 3 - W
//            System.out.printf("%d %d direction - %d%n", x, y, direction);

            // проверяем, есть ли свободное место
            int xTemp = x;
            int yTemp = y;
            for (int i = 0; i < size; i++) {
                if (i > 0) {
                    xTemp = checkX(xTemp, direction);
                    yTemp = checkY(yTemp, direction);
                }

                if (yTemp < 0 || yTemp >= 10 || xTemp < 0 || xTemp >= 10) {
                    isEmpty = false;
                    break;
                }

                // Проверка, если клетка и все клетки вокруп пустые
                // 1е условие. если они стоят у стенок
                int[] arrayForCheck = new int[5]; // дополнительный массив клетки и клетов вокруг нее

                arrayForCheck[0] = array[xTemp][yTemp];

                if (yTemp==0) arrayForCheck[1] = 0;
                else arrayForCheck[1] = array[xTemp][yTemp - 1];

                if (xTemp==9) arrayForCheck[2] = 0;
                else arrayForCheck[2] = array[xTemp + 1][yTemp];

                if (yTemp==9) arrayForCheck[3] = 0;
                else arrayForCheck[3] = array[xTemp][yTemp + 1];

                if (xTemp==0) arrayForCheck[4] = 0;
                else arrayForCheck[4] = array[xTemp-1][yTemp];

                isEmpty = checkIsEmpty(arrayForCheck);
            }
            xFound = x;
            yFound = y;
            directionFound = direction;
        }
//        System.out.println(isEmpty);

        // рисуем корабль на карте
        for (int i = 0; i < size; i++) {
            if (i > 0) {
                xFound = checkX(xFound, directionFound);
                yFound = checkY(yFound, directionFound);
            }
            array[xFound][yFound] = size;
        }
        return array;
    }

    // метод проверки, есть ли свободное место
    public static int checkX(int xTemp, int direction) {
        return switch (direction) {
            case 0, 2 -> xTemp;
            case 1 -> xTemp + 1;
            case 3 -> xTemp - 1;
            default -> throw new IllegalStateException("Unexpected value: " + direction);
        };
    }

    public static int checkY(int yTemp, int direction) {
        return switch (direction) {
            case 0 -> yTemp - 1;
            case 1, 3 -> yTemp;
            case 2 -> yTemp + 1;
            default -> throw new IllegalStateException("Unexpected value: " + direction);
        };
    }

    // метод проверки пустоты искомой клетки и клеток вокруг нее
    public static boolean checkIsEmpty(int cels[]) {
        boolean isEmptyStatus = false;
        for (int i = 0; i < cels.length; i++) {
            if (cels[i] == 0) {
                isEmptyStatus = true;
            } else {
                isEmptyStatus = false;
                return false;
            }
        }
//        System.out.println(Arrays.toString(cels));
        return isEmptyStatus;
    }

}
