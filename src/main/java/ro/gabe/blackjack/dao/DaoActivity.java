package ro.gabe.blackjack.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import ro.gabe.blackjack.model.ActivityEntry;

@Repository
public interface DaoActivity extends PagingAndSortingRepository<ActivityEntry, Integer>{

}
