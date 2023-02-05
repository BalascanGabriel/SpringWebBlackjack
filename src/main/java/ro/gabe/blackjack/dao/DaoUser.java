package ro.gabe.blackjack.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import ro.gabe.blackjack.model.User;

@Repository // DAO
public interface DaoUser extends CrudRepository<User, Integer>{

	
	// SELECT * FROM users WHERE name = ...;
	
	public User findByName(String name);
	
}
