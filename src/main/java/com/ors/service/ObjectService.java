package com.ors.service;

import com.ors.model.Object;

public interface ObjectService {

    Object findById(Long id);
    void save(Object object); // nie wiem czy potrzebne ?
}
