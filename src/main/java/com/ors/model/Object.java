package com.ors.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by cos on 07.12.2016.
 */

@Entity
@Table(name = "obiekt")
public class Object {
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;

    @NotNull
    @Column(name = "nazwa")
    private String name;

    @NotNull
    @Column(name = "opis")
    private String description;


    public Long getId() {
        return id;
    }

    public String getName() {return name;  }

    public String getDescription() {
        return description;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    @Override
    public String toString()
    {
        return "id: " + getId() + " name: "+getName() +" description: "+getDescription();
    }
}
