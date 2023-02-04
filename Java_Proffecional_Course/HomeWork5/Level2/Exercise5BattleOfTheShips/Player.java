package JavaProfessionalCourse.Lesson5.HomeWork5.Level2.Exercise5BattleOfTheShips;

import java.util.Random;

public class Player {

    public Board battleBoard;
    public Board mapBoard;


    public Player() {
        Board battleBoard = new BattleBoard();
        Board mapBoard = new MapBoard();
        battleBoard.init();
        this.battleBoard = battleBoard;
        mapBoard.init();
        this.mapBoard = mapBoard;

    }

    public void showBattleBoard() {
        battleBoard.showBoard();
    }

    public void showMapBoard() {
        mapBoard.showBoard();
    }

    private Coordinates chooseTheFild() {
        Random random = new Random();
        int x = random.nextInt(10);
        int y = random.nextInt(10);

        Coordinates coordinates = new Coordinates(x, y);
        return coordinates;
    }


    public Coordinates makeAShot() {
        while (true) {
            Coordinates coordinates = chooseTheFild();
            if (this.mapBoard.getCell(coordinates) == 0) return coordinates;
        }
    }

    public ShotResult getShotResult(Coordinates coordinates) {

        if(this.battleBoard.getCell(coordinates)==0) {
            return ShotResult.MISSED;
        }
        return ShotResult.INJURED;
    }

    public void writeResultToMapBoard(ShotResult shotResult, Coordinates coordinates) {
        this.mapBoard.setCell(shotResult, coordinates);
    }
}
