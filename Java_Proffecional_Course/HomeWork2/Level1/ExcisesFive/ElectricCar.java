package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.ExcisesFive;

public class ElectricCar extends Car{

    private int batteryCharge;

    public ElectricCar(int batteryCharge) {
        this.batteryCharge = batteryCharge;
    }

    @Override
    void accelerate() {
        System.out.println("Electric gas");
    }
}
