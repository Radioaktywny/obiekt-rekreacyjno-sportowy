package com.ors.repository;

import com.ors.model.Object;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by cos on 07.12.2016.
 */
public interface ObjectRepository extends JpaRepository<Object, Long> {

    Object findById(Long id);

}
