package com.sureshatcode.loptracker.config;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author Suresh Palanisamy
 *         <p>
 *         <b>LOP Tracker Application</b><br>
 * 
 *         Which is using to define a spring boot application, while application
 *         running which will trigger the application to run.
 *         </p>
 */
@SpringBootApplication
public class LopTrackerApplication {

	public static void main(String[] args) {
		SpringApplication.run(LopTrackerApplication.class, args);
	}

}
