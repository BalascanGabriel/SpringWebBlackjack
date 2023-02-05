package ro.gabe.blackjack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import ro.gabe.blackjack.dao.DaoUser;
import ro.gabe.blackjack.model.User;

@RestController
public class ControllerRestUser {

	@Autowired
	private DaoUser dao;
	
	@GetMapping("/toti-userii")
	public Iterable<User> allUtilizatori(){
		return dao.findAll();
	}
	
	@GetMapping("/user-by-id/{id}")
	public User getOneUser(@PathVariable("id") int id) {
		return dao.findById(id).get();
	}
	
	@GetMapping("/user-by-name/{name}")
	public User getOneUser(@PathVariable("name") String name) {
		return dao.findByName(name);
	}
	
	
}
