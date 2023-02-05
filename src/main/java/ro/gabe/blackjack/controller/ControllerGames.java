package ro.gabe.blackjack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ControllerGames {

	@RequestMapping("/blackjack")
	public String blackjack() {
	return "blackjack";
	}

	@RequestMapping("/roulette")
	public String roulette() {
	return "roulette";
	}

	@RequestMapping("/coinflip")
	public String coinflip() {
	return "coinflip";
	}

	@RequestMapping("/slots")
	public String slots() {
	return "slots";
	}

	@RequestMapping("/game-select")
	public String gameSelect() {
	return "game-select";
	}
	
	  @RequestMapping("/start-game")
	  public String startGame(@RequestParam("game") String game) {
	    switch (game) {
	      case "blackjack":
	        return "redirect:/blackjack";
	      case "roulette":
	        return "redirect:/roulette";
	      case "coinflip":
	        return "redirect:/coinflip";
	      case "slots":
	        return "redirect:/slots";
	      default:
	        return "redirect:/game-select";
	    }
	  }
	}


