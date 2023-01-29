package JavaProfessionalCourse.Lesson2.HomeWork2.Level1.ExcisesFive;

public class PetrolCar extends Car{

    private double petrolTankCapacity;

    @Override
    void accelerate() {
        System.out.println("Fuel gas");
    }

    public PetrolCar(double petrolTankCapacity) {
        this.petrolTankCapacity = petrolTankCapacity;
    }
}
