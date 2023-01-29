package JavaProfessionalCourse.Lesson3_Interface.HomeWork3.Execise2_1;

import java.util.Arrays;

public class InMemoryDatabase implements ProductDatabase {
    private boolean isFirstTime = true;
    Product[] products = new Product[1];
//    String[] products = new String[1];

    @Override
    public void save(Product product) {
        if (isFirstTime) {
            products[0] = product;
            isFirstTime = false;
        } else {
            Product[] newProducts = new Product[products.length+1];

            for (int i = 0; i < products.length; i++) {
                newProducts[i] = products[i];
            }
            newProducts[products.length] = product;
            products = newProducts.clone();

        }
        // вывод массива
        for (int i = 0; i < products.length; i++) {
            System.out.print(products[i].getTitle() + " ");
        }
        System.out.println();
    }

    @Override
    public Product findByTitle(String productTitle) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].getTitle().equals(productTitle)) {
//                System.out.println(products[i].getTitle());
                return products[i];
            }
        }
        return null;
    }
}
