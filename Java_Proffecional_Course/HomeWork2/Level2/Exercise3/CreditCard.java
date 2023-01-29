package JavaProfessionalCourse.Lesson2.HomeWork2.Level2.Exercise3;

public class CreditCard {
    private final String number;
    private int pin;
    private int balance;
    private int creditLimit;
    private int creditDebt;

    // Контсруктор

    public CreditCard(String number, int pin) {
        this.number = number;
        this.pin = pin;
        this.balance = 0;
        this.creditDebt = 0;
    }

    // Геттеры сеттеры

    public void setPin(int pin, int oldPin) {
        if (oldPin != this.pin) {
            System.out.println("Wrong old PIN! Operation canceled!");
        } else {
            this.pin = pin;
        }
    }

    public double getBalance() {
        return balance;
    }

    public double getCreditLimit() {
        return creditLimit;
    }

    public double getCreditDebt() {
        return creditDebt;
    }

    public void setCreditLimit(int creditLimit) {
        this.creditLimit = creditLimit;
    }

    public String getNumber() {
        return number;
    }


// Методы

    public boolean deposit(int pin, int sum) {
        if (pin != this.pin || sum < 0) {
            System.out.println("Operation canceled!");
            return false;
        }
        if (creditDebt > 0) {
            int difference = sum - creditDebt;
            if (difference >= 0 ) {
                creditDebt = 0;
                balance += difference;
            } else {
                creditDebt = creditDebt - sum;
            }
        } else {
            balance += sum;
        }
        return true;
    }

    public boolean withdrawal(int pin, int sum) {
        if (pin != this.pin || sum < 0) {
            System.out.println("Operation canceled!");
            return false;
        }

        if (balance>= sum) {
            balance -= sum;
        } else {
            int diff = sum - balance;
            if (creditLimit < creditDebt + diff) {
                System.out.println("Not enough credit! Operation canceled!");
                return false;
            }
            creditDebt += diff;
            balance = 0;
        }

        return true;
    }

}
