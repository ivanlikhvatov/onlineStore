package org.example.onlineStore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

//public class Application {
//    public static void main(String[] args) {
//        String string = "TELEPHONE";
//
//        TypeProduct en = TypeProduct.valueOf(string);
//
//        System.out.println(en.name());
//    }
//}
