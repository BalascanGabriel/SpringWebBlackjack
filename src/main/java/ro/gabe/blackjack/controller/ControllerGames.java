package ro.gabe.blackjack.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class ControllerGames {

	@RequestMapping(value="/gamepage")
	public String gamepage() {
		return "gamepage";
	}
	
	
}
