package ro.gabe.blackjack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import ro.gabe.blackjack.dao.DaoActivity;

@Controller
@RequestMapping("/secured/admin")
public class AdminController {

	
//	@Autowired
//	private DaoActivity dao;
	
	@RequestMapping("/dashboard")
	public String goToAdmin(Model model) {
//		model.addAttribute("LOGS", dao.findAll());
		model.addAttribute("DIN_CONTROLLER", "SALUTARE DIN CONTROLLER");
		model.addAttribute("i", "SHAORMA");
		return "admin-dashboard";
	}
	
}
