package com.ors.service;


import com.ors.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);
    void updateEmail(String email, Long id);
    void updatePassword(String password, Long id);
    void updateNumber(String number, Long id);
    void updateStreet(String street, Long id);
}
