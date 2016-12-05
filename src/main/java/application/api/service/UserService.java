package application.api.service;

import application.api.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Marcin on 05.12.2016.
 */
public interface UserService {

    User findByUsername(String username);

    User createUser(User user);
}
