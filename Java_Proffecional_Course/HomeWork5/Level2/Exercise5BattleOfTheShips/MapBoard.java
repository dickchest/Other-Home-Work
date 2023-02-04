package JavaProfessionalCourse.Lesson5.HomeWork5.Level2.Exercise5BattleOfTheShips;

public class MapBoard implements Board {

    private int[][] mapBoard;
    @Override
    public void init() {
        this.mapBoard = new int[10][10];
    }

    @Override
    public void showBoard() {
        for (int i = 0; i < this.mapBoard.length; i++) {
            for (int j = 0; j < this.mapBoard[i].length; j++) {
                System.out.print(this.mapBoard[i][j] + " ");
            }
            System.out.println();
        }
    }

    @Override
    public int getCell(Coordinates coordinates) {
        int x= coordinates.getX();
        int y= coordinates.getY();
        return this.mapBoard[x][y];
    }

    public void setCell(ShotResult shotResult, Coordinates coordinates) {
        int x = coordinates.getX();
        int y = coordinates.getY();
        this.mapBoard[x][y] = 9 - shotResult.ordinal();
    }
}
