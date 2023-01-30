package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_11;

public class AutoTest {
    public static void main(String[] args) {
        Auto auto1 = new PetrolAuto(1993, "Toyota", "Auris");
        Auto auto2 = new ElectricalAuto(2019, "Nissan", "Leaf");

        ModernAutoService modernAutoService = new ModernAutoService(true, true);

        auto1.drive(Fuel.DIESEL);
        auto1.drive(Fuel.PETROL);
        auto1.setOn(true);
        auto1.drive(Fuel.PETROL);
        modernAutoService.installTires(auto1, Tire.SUMMER);
        auto1.drive(Fuel.PETROL);
        auto1.broke();
        auto1.drive(Fuel.PETROL);
        modernAutoService.fix(auto1);
        auto1.drive(Fuel.PETROL);
        auto1.setOn(true);
        auto1.drive(Fuel.PETROL);

        System.out.println("-------------");
        modernAutoService.installTires(auto2, Tire.WINTER);
        auto2.setOn(true);
        auto2.drive(Fuel.ELECTRIC);
    }
}
