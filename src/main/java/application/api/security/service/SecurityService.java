package application.api.security.service;

/**
 * Created by Marcin on 05.12.2016.
 */
public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}
