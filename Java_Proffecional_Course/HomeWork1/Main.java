package JavaProfessionalCourse.Lesson1.HomeWork1;

public class Main {
    public static void main(String[] args) {

        /*
        Создать класс Person, который содержит:
переменные fullName, age;
методы move() и talk(), в которых просто вывести на консоль сообщение -"Такой-то  Person говорит".
Добавьте два конструктора  - Person() и Person(fullName, age).
Создайте два объекта этого класса. Один объект инициализируется конструктором Person(), другой - Person(fullName, age)
         */

        Person peter = new Person();
        Person john = new Person("John", 25);

        peter.setFullName("Peter");

        peter.move();
        peter.talk();

        john.move();
        john.talk();

        /*
        2.Класс Phone.
Создайте класс Phone, который содержит переменные number, model и weight.
Создайте три экземпляра этого класса.
Выведите на консоль значения их переменных.
Добавить в класс Phone методы: receiveCall, имеет один параметр – имя звонящего.
Выводит на консоль сообщение “Звонит {name}”. Метод getNumber – возвращает номер телефона.
Вызвать эти методы для каждого из объектов.
         */
        Phone apple = new Phone("+38 095 3289978", "Iphone 10", 400);
        Phone android = new Phone("+49 1515 3287712", "Iphone 10", 400);
        Phone nokia = new Phone("+38 4095 9872809", "Iphone 10", 400);

        // выводим значения всех переменных
        System.out.println(apple.toString());
        System.out.println(apple.toString());
        System.out.println(apple.toString());


        nokia.receiveCall(john.getFullName());
        apple.receiveCall(peter.getFullName());

        System.out.println(apple.getNumber());
        System.out.println(android.getNumber());
        System.out.println(nokia.getNumber());


    }
}
