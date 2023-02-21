package ro.gabe.blackjack.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ro.gabe.blackjack.dao.DaoActivity;
import ro.gabe.blackjack.model.ActivityEntry;

@RestController
@RequestMapping("/rest/activity")
public class ControllerActivityRest {

	@Autowired
	private DaoActivity dao;

	@GetMapping("/all")
	public Iterable<ActivityEntry> metodaPentruAll() {
		return dao.findAll();
	}

	@GetMapping("/by-page/{pageNumber}")
	public Page<ActivityEntry> getPagePentruPaginare(@PathVariable("pageNumber") int pn){
		Pageable detaliiPagina = PageRequest.of(pn, 3);
		Page<ActivityEntry> pagina = dao.findAll(detaliiPagina);
		return pagina;
	}

}
