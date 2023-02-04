package JavaProfessionalCourse.Lesson5.HomeWork5.Level2.Exercise5BattleOfTheShips;

import java.util.Scanner;

public class Game {

        /*
        Подумайте как можно реализовать игру морской бой
        и если есть идеи можете накидать примерную реализацию
        (должна быть двухмерный массив)
         */

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // иницилизация игровов и игровых полей
        System.out.println("----------ваша карта расположения кораблей---------");
        Player player1 = new Player(); // человек
        player1.showBattleBoard();
        System.out.println("----------ЧИТ: карта соперника---------");

        Player player2 = new Player(); // computer
        player2.showBattleBoard();

        System.out.println("Начинает компьютер");


//        ХОД ИГРЫ
        while (true) { // пока не дописано услвоие прекращения игры (когда убиты все корабли)

//        1. Игрок выбирает поле - внутри Player
            Coordinates coordinates2 = player2.makeAShot();
//            System.out.println(coordinates2);
//        3. получаем ответ от соперника
            ShotResult shotResult2 = player1.getShotResult(coordinates2);
            System.out.println(shotResult2);
//        4. отмечаем у себя на карте результат
            player2.writeResultToMapBoard(shotResult2, coordinates2);

            // Ход игрока


            // сначала запрашиваем координаты и проверяем, что б они не были уже введены
            int shotMapResult = -1;
            int x = 0;
            int y = 0;

            while (shotMapResult != 0) {
                System.out.println("Insert coordinates:");
                x = scanner.nextInt();
                y = scanner.nextInt();
                shotMapResult = player1.mapBoard.getCell(new Coordinates(x,y));
            }
            Coordinates coordinates1 = new Coordinates(x, y);
            ShotResult shotResult1 = player2.getShotResult(coordinates1);
            System.out.println(shotResult1);
            player1.writeResultToMapBoard(shotResult1, coordinates1);
            player1.showMapBoard();

        }

    }
}
