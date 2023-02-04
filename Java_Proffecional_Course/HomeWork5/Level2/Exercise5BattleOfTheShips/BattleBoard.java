package JavaProfessionalCourse.Lesson5.HomeWork5.Level2.Exercise5BattleOfTheShips;

import java.util.Random;

public class BattleBoard implements Board {
    Ships ships;
    private int[][] battleBoard;


    @Override
    public void init() {
        // инициализация
        this.battleBoard = new int[10][10];

        // Расставление кораблей случайным образом
        // 1 - 4х палубный, 2 - 3х палубных, 3 - 2х палубных, 4 - однопалубных
        Ships[] ships = Ships.values();
        for (int size = ships.length; size > 0; size--) {
            for (int i = 0; i < ships[size-1].getShipQuantity(); i++) {
                placeShip(size);
            }
        }
    }

    @Override
    public void showBoard() {
        for (int i = 0; i < this.battleBoard.length; i++) {
            for (int j = 0; j < this.battleBoard[i].length; j++) {
                System.out.print(this.battleBoard[i][j] + " ");
            }
            System.out.println();
        }
    }

    @Override
    public int getCell(Coordinates coordinates) {
        int x = coordinates.getX();
        int y = coordinates.getY();
        System.out.println(coordinates);
         return this.battleBoard[x][y];
    }

    @Override
    public void setCell(ShotResult shotResult, Coordinates coordinates) {
        // пока нет вариантов
    }


    private void placeShip(int size) {

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

                arrayForCheck[0] = this.battleBoard[xTemp][yTemp];

                if (yTemp == 0) arrayForCheck[1] = 0;
                else arrayForCheck[1] = this.battleBoard[xTemp][yTemp - 1];

                if (xTemp == 9) arrayForCheck[2] = 0;
                else arrayForCheck[2] = this.battleBoard[xTemp + 1][yTemp];

                if (yTemp == 9) arrayForCheck[3] = 0;
                else arrayForCheck[3] = this.battleBoard[xTemp][yTemp + 1];

                if (xTemp == 0) arrayForCheck[4] = 0;
                else arrayForCheck[4] = this.battleBoard[xTemp - 1][yTemp];

                isEmpty = checkIsEmpty(arrayForCheck);
            }
            xFound = x;
            yFound = y;
            directionFound = direction;
        }

        // рисуем корабль на карте
        for (int i = 0; i < size; i++) {
            if (i > 0) {
                xFound = checkX(xFound, directionFound);
                yFound = checkY(yFound, directionFound);
            }
            this.battleBoard[xFound][yFound] = size;
        }
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
