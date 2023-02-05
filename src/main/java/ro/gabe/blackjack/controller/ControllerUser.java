package ro.gabe.blackjack.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ro.gabe.blackjack.dao.DaoUser;
import ro.gabe.blackjack.model.User;

@Controller
public class ControllerUser {

	@Autowired
	private DaoUser dao;
	
	
	@RequestMapping(value="/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping(value="/user-lista")
	public String paginaUserii(Model model) {
		Iterable<User> useriiDb = dao.findAll(); // new ArrayList<>();
		model.addAttribute("USERII", useriiDb);
		return "users-list";
	}
	
	@RequestMapping(value="/save-register", method = RequestMethod.POST)
	public String processRegister(@ModelAttribute User newUser) {
//		String username = req.getParameter("username");
//		String email = req.getParameter("email");
//		String password = req.getParameter("password");
//		User newUser = new User();
//		newUser.setEmail(email);
//		newUser.setPassword(password);
//		newUser.setName(username);
		
		
		 dao.save(newUser);
		 System.out.println("SAVING TO DB: " + newUser);
		
		return "redirect:/despre";
	}
	
}
