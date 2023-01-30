package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_11;

public class DieselAuto extends Auto {
private Fuel fuel;
    public DieselAuto(int yearOfProduction, String brand, String model) {
        super(yearOfProduction, brand, model);
        fuel = Fuel.DIESEL;
    }

    public Fuel getFuel() {
        return fuel;
    }

    @Override
    public void drive(Fuel fuel) {
        // проверка, если в авто заправлено правильное топливо
        if (fuel.equals(this.fuel)) {
            super.drive(this.fuel);
        } else {
            System.out.println("I can't use this fuel");
        }
    }

    @Override
    public void broke() {
        super.broke();
    }
}
