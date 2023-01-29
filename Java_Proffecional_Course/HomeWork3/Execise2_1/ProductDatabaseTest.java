package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise2_1;

import org.w3c.dom.ls.LSOutput;

public class ProductDatabaseTest {

    public static void main(String[] args) {

        InMemoryDatabase database = new InMemoryDatabase();

        Product tomato = new Product("Tomato");
        Product cucumber = new Product("Cucumber");
        Product meet = new Product("Meat");
        Product onion = new Product("Onion");

        database.save(tomato);
        database.save(cucumber);
        database.save(meet);

        database.findByTitle("Meat");
        System.out.println(database.findByTitle("Meat").getTitle());
    }
}
