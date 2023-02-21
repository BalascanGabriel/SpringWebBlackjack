package ro.gabe.blackjack.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_activity_log")
public class ActivityEntry {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name="last_login")
	private Date lastLogin;
	
	@Column(name="user_ip")
	private String userIp;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(Date lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}

	@Override
	public String toString() {
		return "ActivityEntry [id=" + id + ", lastLogin=" + lastLogin + ", userIp=" + userIp + "]";
	}
	
//	CREATE TABLE `user_activity_log` (
//			  `id` int NOT NULL AUTO_INCREMENT,
//			  `user_id` int DEFAULT NULL,
//			  `last_login` datetime DEFAULT NULL,
//			  `user_ip` varchar(200) DEFAULT NULL,
//			  PRIMARY KEY (`id`),
//			  KEY `user_id` (`user_id`),
//			  CONSTRAINT `user_activity_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`Id`)
//			) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

	
	
}
