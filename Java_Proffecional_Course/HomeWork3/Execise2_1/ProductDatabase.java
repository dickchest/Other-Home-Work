package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise2_1;

public interface ProductDatabase {
    void save(Product product);
    Product findByTitle(String productTitle);
}
