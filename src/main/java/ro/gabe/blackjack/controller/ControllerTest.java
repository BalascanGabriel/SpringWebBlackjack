package ro.gabe.blackjack.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
// @WebServlet("/
public class ControllerTest {

	
	// protected void doGet(HttpServletRequest req, HttpServletResponse res){
	//   req.getRequestDispatcher("/pages/about.jsp").forward(req, res);
	// 
	/*
	 in application.properties avem:
	 spring.mvc.view.prefix=/pages/
	 spring.mvc.view.suffix=.jsp
	 */
	
	@RequestMapping("/despre")
	public String metodaCareNavigheazaLaAbout(HttpServletRequest req) {
		System.out.println("NAME: " + req.getParameter("name"));
		return "about"; // /pages/about.jsp
	}
	
	@RequestMapping("/contact")
	public String paginaContact() {
		return "contact";
	}
	
	@RequestMapping("/salut/{nume}")
	public String paginaGreeting(@PathVariable("nume") String n, Model model) {
		System.out.println("NUME: " + n);
		String mesaj = "SALUTARE, " + n + "!";
//		 req.setAttribute("MESAJUL", mesaj);
		 model.addAttribute("MESAJUL", mesaj);
		 
		return "greeting";
	}
	
}
