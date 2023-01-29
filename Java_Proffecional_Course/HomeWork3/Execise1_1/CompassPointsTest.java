package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise1_1;

import java.util.Scanner;

public class CompassPointsTest {
    public static void main(String[] args) {

        System.out.println(CompassPoints.NORTH);
        System.out.println(CompassPoints.EAST);
        System.out.println(CompassPoints.SOUTH);
        System.out.println(CompassPoints.WEST);

        CompassPoints[] direction = CompassPoints.values();
        for (int i = 0; i < direction.length; i++) {
            System.out.println(direction[i]);
            System.out.println(direction[i].ordinal());
        }

        Scanner scanner = new Scanner(System.in);
        CompassPoints movement = CompassPoints.valueOf(scanner.nextLine());
        switch (movement) {
            case NORTH -> System.out.println("Moving up");
            case EAST -> System.out.println("Moving right");
            case SOUTH -> System.out.println("Moving down");
            case WEST -> System.out.println("Moving left");
            default -> System.out.println("Stay still");
        }
    }
}
