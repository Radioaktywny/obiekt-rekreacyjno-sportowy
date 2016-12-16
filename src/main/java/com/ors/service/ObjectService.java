package com.ors.service;

import com.ors.model.Object;

import java.util.List;

public interface ObjectService {

    Object findById(Long id);
    void save(Object object); // nie wiem czy potrzebne ?
    List<Object> findAll();
}
