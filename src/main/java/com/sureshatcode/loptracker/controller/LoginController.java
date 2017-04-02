package com.sureshatcode.loptracker.controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Suresh Palanisamy
 *         <p>
 *         <b>Login Controller</b><br>
 * 
 *         Which is using for handling the login functionalities to LOP Tracker.
 *         </p>
 */
@CrossOrigin
@RestController
public class LoginController {

	@GetMapping(value = "/")
	public String loptracker() {
		return "LOP Tracker started running";
	}
	
}
