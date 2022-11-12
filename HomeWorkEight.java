package JavaCourse.Lesson8;

import java.util.Arrays;

/*
First level:          Есть строка, состоящая из любых возможных комбинаций букв A,B,C
         Необходимо закодировать строку в другую строку, согласно таблице
         A ---> 1
         B ---> 0
         C ---> 3
         Вывести получившуюся строку на экран.
         Пример: BCAC ---> 0313
         Сделать обратную конвертацию
         Пример: 0313 ---> BCAC
         Помочь в этом нам могут массивы: String[] chars = {'A','B','C'}
         и int[] integers = {0,3,1,3}
         А также метод toCharArray(), который можно вызвать у строки.
 */
public class HomeWorkEight {
    public static void main(String[] args) {
        // обявляем переменные
        String string_in = "ABBCAACBABBC";
        String string_out = "";

        // кодирование
        for(char c : string_in.toCharArray()) {
            string_out = string_out + switch (c) {
                case 'A' -> '1';
                case 'B' -> '0';
                case 'C' -> '3';
                default -> throw new IllegalStateException("Unexpected value: " + c);
            };
        }
        System.out.printf("%s ---> %s\n",string_in,string_out);

        // декодирование (c применением массивов)

        // обьявляем переменные
        int[] integers = new int[string_out.length()];
        char[] chars = new char[string_out.length()];
        int j = 0;

        // заносим в массив кодированный код
        for (char c : string_out.toCharArray()) {
            integers[j] = Character.getNumericValue(c);
            j++;
        }
         // декодирование
        for (int i = 0; i < integers.length; i++) {
            chars[i] = switch (integers[i]) {
                case 1 -> 'A';
                case 0 -> 'B';
                case 3 -> 'C';
                default -> throw new IllegalStateException("Unexpected value: " + integers[i]);
            };
        }
        // вывод результата
        System.out.println(Arrays.toString(chars));
    }
}
