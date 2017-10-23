package com.proximus.bootcamel.she.camelmiddleware;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ImportResource;

@SpringBootApplication
//@EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
@ImportResource({ "classpath:META-INF/spring/camel-context-oracle.xml" })
public class CamelmiddlewareApplication {

	public static void main(String[] args) {
		SpringApplication.run(CamelmiddlewareApplication.class, args);
	}
}
