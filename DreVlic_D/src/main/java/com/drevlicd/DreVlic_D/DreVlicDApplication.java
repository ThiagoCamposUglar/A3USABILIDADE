package com.drevlicd.DreVlic_D;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@ComponentScan(basePackages = {
    "com.drevlicd.DreVlic_D.controller"
})
@EnableJpaRepositories(basePackages = {
    "com.drevlicd.DreVlic_D.repository"
})
@EntityScan(basePackages = {
    "com.drevlicd.DreVlic_D.model"
})
public class DreVlicDApplication {

	public static void main(String[] args) {
		SpringApplication.run(DreVlicDApplication.class, args);
	}
}