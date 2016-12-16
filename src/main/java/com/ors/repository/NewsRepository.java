package com.ors.repository;

import com.ors.model.News;
import com.ors.model.Object;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by cos on 15.12.2016.
 */
public interface NewsRepository extends JpaRepository<News, Long> {
    News findById(Long id);

    List<News> findAll();

    Object findByObjectId(Long objectId);
}
