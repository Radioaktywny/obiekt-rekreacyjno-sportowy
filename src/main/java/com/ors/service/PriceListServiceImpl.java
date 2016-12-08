package com.ors.service;

import com.ors.model.PriceList;
import com.ors.repository.PriceListRepository;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by bgacek on 08.12.2016.
 */
public class PriceListServiceImpl implements PriceListService
{
    @Autowired
    private PriceListRepository priceListRepository;

    @Override
    public PriceList findById(Long id)
    {
        return priceListRepository.findById(id);
    }

    @Override
    public PriceList findByObjectId(Long objectId)
    {
        return priceListRepository.findByObjectId(objectId);
    }
}
