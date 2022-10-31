package JavaCourse.Lesson5.HomeWork;

import java.util.Scanner;

/*
First level: - Реализовать программу, выводящую на экран результаты сложения, вычитания, умножения и деления двух чисел.
        Каждая из арифметических операций должна быть реализована как отдельный метод.
*/
public class HomeWorkLessonSix {
    public static void main(String[] args) {
        // ввод двух чисел пользователем
        Scanner scanner = new Scanner(System.in);
        System.out.println("Введите число А:");
        int a = scanner.nextInt();
        System.out.println("Введите число B:");
        int b = scanner.nextInt();

        // вывод результатов работы калькулятора
        System.out.println("Сумма чисел " + a + " и " + b + " равно " + Calculator.sum(a, b));
        System.out.println("Вычитание чисел " + a + " и " + b + " равно " + Calculator.substract(a, b));
        System.out.println("Произведение чисел " + a + " и " + b + " равно " + Calculator.multiplication(a, b));
        try {
            System.out.println("Деление чисел " + a + " и " + b + " равно " + Calculator.divide(a, b));
        } catch (ArithmeticException arithmeticException) {
            System.out.println("Деление на ноль!!!");
        }

        /*
        реализовать метод, который конвертирует указанную сумму в евро в сумму в долларах США
         */
        System.out.println("Введите сумму в евро:");
        double sumEuro = scanner.nextDouble();
        double currentCourse = 1.02;
        double sumDollar = Calculator.exchange(sumEuro, currentCourse);
        System.out.printf("Сумма %.2f евро равняется %.2f долларов, по курсу %.2f\n", sumEuro, sumDollar, currentCourse );
    }
}
