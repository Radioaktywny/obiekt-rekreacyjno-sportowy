package com.ors.service;

import com.ors.model.PriceList;

/**
 * Created by bgacek on 08.12.2016.
 */
public interface PriceListService
{
    PriceList findById(Long id);
    PriceList findByObjectId(Long objectId);
}
