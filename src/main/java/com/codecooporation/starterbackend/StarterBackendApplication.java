package com.codecooporation.starterbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class StarterBackendApplication {

	@GetMapping("/welcome")
	public String welcome(){
		return "say welcome to automation";
	}

	@GetMapping("/health")
	public String health(){
		return "your app is up and running";
	}

	public static void main(String[] args) {
		SpringApplication.run(StarterBackendApplication.class, args);
	}

}
