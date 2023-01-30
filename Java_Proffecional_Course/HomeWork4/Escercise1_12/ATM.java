package JavaProfessionalCourse.Lesson4.HomeWork4.Escercise1_12;

import JavaProfessionalCourse.Lesson2_extendtion.HomeWork2.Level2.Exercise3.CreditCard;

public abstract class ATM {
//    private boolean isCartInserted;
    private int moneyCapacity;

    public ATM(int moneyCapacity) {
        this.moneyCapacity = moneyCapacity;
    }

    public int getMoneyCapacity() {
        return moneyCapacity;
    }

    public void setMoneyCapacity(int moneyCapacity) {
        this.moneyCapacity = moneyCapacity;
    }

    public double balance(CreditCard creditCard) {
        return creditCard.getBalance();
    }

    public boolean deposit(CreditCard creditCard, int pin, int sum) {
        if (creditCard.deposit(pin, sum)) {
            moneyCapacity += sum;
            return true;
        } else {
            return false;
        }
    }

    public boolean withdrawal(CreditCard creditCard, int pin, int sum) {
        if (moneyCapacity >= sum) {
            if (creditCard.withdrawal(pin, sum)) {
                moneyCapacity -= sum;
                return true;
            } else {
                return false;
            }
        } else {
            System.out.println("Operation canceled. Not enough cash");
            return false;
        }
    }
}
