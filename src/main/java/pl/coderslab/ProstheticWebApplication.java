package pl.coderslab;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "pl.coderslab")
public class ProstheticWebApplication {

    public static void main(String[] args) {
        SpringApplication.run(ProstheticWebApplication.class, args);
    }

}
