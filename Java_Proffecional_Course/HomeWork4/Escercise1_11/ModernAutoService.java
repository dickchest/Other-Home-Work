package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_11;

public class ModernAutoService extends AutoService{
    private boolean isChangeTires;


    public ModernAutoService(boolean isRepair, boolean isChangeTires) {
        super(isRepair);
        this.isChangeTires = isChangeTires;
    }

    public void installTires(Auto auto, Tire tire) {
        auto.setTire(tire);
    }
}
