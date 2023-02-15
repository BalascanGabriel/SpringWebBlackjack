package ro.gabe.blackjack.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ro.gabe.blackjack.dao.DaoUser;
import ro.gabe.blackjack.model.User;
import org.springframework.ui.Model;

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
	
	@RequestMapping(value="/secured/gamepage")
	public String gamePage( HttpSession session) {
//		if(session.getAttribute("user") == null) {
//			return "redirect:/login";
//		}
		return "gamepage";
	}
	
	@RequestMapping(value="/logout")
	public String logout() {
		return "logout";
	}
	
	@RequestMapping(value="/secured/user-lista")
	public String paginaUserii(Model model) {
		Iterable<User> useriiDb = dao.findAll(); // new ArrayList<>();
		model.addAttribute("USERII", useriiDb);
		return "users-list";
	}
	
	@RequestMapping(value="/save-register", method = RequestMethod.POST)
	public String processRegister(@ModelAttribute User newUser) {
//		
		 dao.save(newUser);
		 System.out.println("SAVING TO DB: " + newUser);
		
		return "redirect:/despre";
	}
	
	@RequestMapping(value="/save-login", method = RequestMethod.POST)
	public String processLogin(@ModelAttribute User user, RedirectAttributes redirectAttributes, HttpSession session) {
		System.out.println("Login parameters " + user);
		
		User dbUser = dao.findByNameAndPassword(user.getName(), user.getPassword());
	    if (dbUser != null) {
	    	session.setAttribute("user", dbUser);
	        return "redirect:/secured/gamepage";
	    } else {
	    	redirectAttributes.addFlashAttribute("loginFailed", true);
	        return "redirect:/login";
	    }
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.POST)
	public String processLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
