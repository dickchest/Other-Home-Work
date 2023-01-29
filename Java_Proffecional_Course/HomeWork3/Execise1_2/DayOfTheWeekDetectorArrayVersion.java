package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise1_2;

public class DayOfTheWeekDetectorArrayVersion implements DayOfTheWeekDetector{
    @Override
    public String detectDayName(int number) {
        String[] dayOfWeek = {"Monday", "Tuesday", "Wednesday","Thursday","Friday","Saturday","Sunday"};
        if (number < 7 ) {
            return dayOfWeek[number-1];
        } else {
            return "Please input a valid number between 1 and 7";
        }
    }
}
