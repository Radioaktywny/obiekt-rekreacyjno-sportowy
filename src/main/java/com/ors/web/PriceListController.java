package com.ors.web;

import com.ors.model.PriceList;
import com.ors.service.PriceListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by bgacek on 08.12.2016.
 */

@Controller
public class PriceListController
{
    @Autowired
    private PriceListService priceListService;

    @RequestMapping(value = "/cennik", method = RequestMethod.GET)
    public String priceListsOfAllObjects()
    {
        List<PriceList> priceLists = priceListService.findAll();

        return "cenniki";
    }
}