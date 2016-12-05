package application.api.repository;

import application.api.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Marcin on 05.12.2016.
 */
public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);

}