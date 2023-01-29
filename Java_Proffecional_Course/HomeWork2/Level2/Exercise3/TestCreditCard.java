package JavaProfessionalCourse.Lesson2.HomeWork2.Level2.Exercise3;

public class TestCreditCard {

    public static void main(String[] args) {
        CreditCard ivanov = new CreditCard("1234-5678-9012", 1234);
        System.out.println(ivanov.getBalance());
        ivanov.setCreditLimit(50);
        ivanov.deposit(1, 50);

        ivanov.deposit(1234, 50);
        System.out.println(ivanov.getBalance());
        ivanov.withdrawal(1, 70);

        ivanov.withdrawal(1234, 70);
        System.out.print(ivanov.getBalance() + " : ");
        System.out.println(ivanov.getCreditDebt());

        ivanov.deposit(1234, 10);
        System.out.print(ivanov.getBalance() + " : ");
        System.out.println(ivanov.getCreditDebt());

        ivanov.deposit(1234, 100);
        System.out.print(ivanov.getBalance() + " : ");
        System.out.println(ivanov.getCreditDebt());

        ivanov.setPin(4555, 1111);
        ivanov.setPin(4555, 1234);

        ivanov.withdrawal(1234, 70);
        ivanov.withdrawal(4555, 70);

        System.out.print(ivanov.getBalance() + " : ");
        System.out.println(ivanov.getCreditDebt());
    }
}
