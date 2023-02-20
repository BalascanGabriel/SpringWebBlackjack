package ro.gabe.blackjack.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/secured")
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

    @PostMapping("/start-game")
    public String startGame(@RequestParam("game") String game) {
        switch (game) {
            case "blackjack":
                return "redirect:/secured/blackjack";
            case "roulette":
                return "redirect:/secured/roulette";
            case "coinflip":
                return "redirect:/secured/coinflip";
            case "slots":
                return "redirect:/secured/slots";
            default:
                return "redirect:/secured/game-select";
        }
    }
    
    @PostMapping("/secured/coinflip")
    public String playCoinFlip(@RequestParam("betAmount") double betAmount, @RequestParam("coinSide") String coinSide, Model model) {
        // Generate a random result for the coin flip
        String result = Math.random() >= 0.5 ? "heads" : "tails";
        
        // Determine if the user won or lost the bet
        boolean won = result.equals(coinSide);
        
        // Calculate the payout amount
        double payout = won ? betAmount * 2 : 0;
        
        // Add the game results to the model for display on the JSP page
        model.addAttribute("result", result);
        model.addAttribute("won", won);
        model.addAttribute("betAmount", betAmount);
        model.addAttribute("payout", payout);
        
        return "coinflip";
    }
}
