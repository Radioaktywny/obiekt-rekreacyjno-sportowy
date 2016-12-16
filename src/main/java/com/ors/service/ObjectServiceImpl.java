package com.ors.service;

import com.ors.model.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ors.repository.*;

import java.util.List;

/**
 * Created by cos on 07.12.2016.
 */
@Service
public class ObjectServiceImpl implements ObjectService{


    @Autowired
    private ObjectRepository objectRepository;

    @Override
    public Object findById(Long id) {

        return  objectRepository.findById(id);
    }

    @Override
    public void save(Object object) {
        //Czy to nam jest potrzebne ?
    }

    @Override
    public List<Object> findAll() {
        return objectRepository.findAll();
    }


}
