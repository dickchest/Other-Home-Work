package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_11;

public abstract class Auto implements Driveable, Brokeable {
    // переменные
    private int yearOfProduction;
    private String brand;
    private String model;

    private Tire tire;

    private boolean isBroken = false; // переменная для текущего состояния авто
    private boolean isOn = false; // включен ли двигатель

    // конструктор
    public Auto(int yearOfProduction, String brand, String model) {
        this.yearOfProduction = yearOfProduction;
        this.brand = brand;
        this.model = model;
    }

    // геттеры и сеттеры
    public int getYearOfProduction() {
        return yearOfProduction;
    }

    public String getBrand() {
        return brand;
    }

    public String getModel() {
        return model;
    }

    public Tire getTire() {
        return tire;
    }

    public void setTire(Tire tire) {
        this.tire = tire;
        System.out.println(tire + " tires installed");
    }

    public void setOn(boolean on) {
        isOn = on;
        System.out.println("Ignition is on");
    }

// методы

    public void drive(Fuel fuel) {
        // проверка, если машина не поломна
        if (!this.isBroken) {
            // проверка если авто включено зажигание
            if (this.isOn) {
                // проверка если у авто установлены шины
                if (this.tire != null) {
                    System.out.println("I'm driving using " + fuel);
                } else {
                    System.out.println("Can't drive. Please install tires");
                }
            } else {
                System.out.println("Please, turn on the ignition");
            }
        } else {
                System.out.println("Can't drive. The car is broken");
        }
    }

    @Override
    public void broke() {
        this.isBroken = true;
        this.isOn = false;
        System.out.println("Car is broken");
    }

    public void repear() {
        this.isBroken = false;
        System.out.println("Car repaired");
    }
}
