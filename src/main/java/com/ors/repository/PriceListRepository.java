package com.ors.repository;

import com.ors.model.PriceList;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by bgacek on 08.12.2016.
 */
public interface PriceListRepository extends JpaRepository<PriceList, Long>
{
    PriceList findById(Long id);
    PriceList findByObjectId(Long objectId);
}
