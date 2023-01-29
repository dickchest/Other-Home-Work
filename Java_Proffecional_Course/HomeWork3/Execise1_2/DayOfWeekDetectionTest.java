package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise1_2;

public class DayOfWeekDetectionTest {
    public static void main(String[] args) {
        DayOfTheWeekDetectorIfVersion ifVersion = new DayOfTheWeekDetectorIfVersion();
        DayOfTheWeekDetectorSwitchVersion switchVersion = new DayOfTheWeekDetectorSwitchVersion();
        DayOfTheWeekDetectorArrayVersion arrayVersion = new DayOfTheWeekDetectorArrayVersion();
        DayOfTheWeekDetectorEnumVersion enumVersion = new DayOfTheWeekDetectorEnumVersion();

        System.out.println(ifVersion.detectDayName(5));
        System.out.println(switchVersion.detectDayName(8));
        System.out.println(arrayVersion.detectDayName(2));
        System.out.println(enumVersion.detectDayName(7));
    }
}
