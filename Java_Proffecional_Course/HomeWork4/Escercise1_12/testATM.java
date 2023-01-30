package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_12;

import JavaProfessionalCourse.Lesson2_extendtion.HomeWork2.Level2.Exercise3.CreditCard;

public class testATM {
    public static void main(String[] args) {
        SimpleATM simpleATM = new SimpleATM(50);

        CreditCard card = new CreditCard("234-123-1234-1234", 1234);

        simpleATM.deposit(card, 234, 500);

        simpleATM.deposit(card, 1234, 500);
        System.out.println(simpleATM.balance(card));

        simpleATM.withdrawal(card, 1234, 5000);
        simpleATM.setMoneyCapacity(5000);
        simpleATM.withdrawal(card, 1234, 5000);

        simpleATM.withdrawal(card, 1234, 450);

        System.out.println(simpleATM.balance(card));

    }
}
