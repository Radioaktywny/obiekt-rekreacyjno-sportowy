package application.api.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by Marcin on 05.12.2016.
 */
@Entity
public class User {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "nazwa_uzytkownika")
    private String username;

    @NotNull
    @Column(name = "haslo")
    private String password;

    @NotNull
    @Column(name = "poziom_dostepu")
    private String role;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
