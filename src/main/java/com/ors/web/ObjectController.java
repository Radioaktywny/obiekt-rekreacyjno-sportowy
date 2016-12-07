package com.ors.web;

import com.ors.service.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by cos on 07.12.2016.
 */
@Controller
public class ObjectController {
    @Autowired
    private ObjectService objectService;

    @RequestMapping(value = "/obiekt", method = RequestMethod.GET)
    public String object(Model model , Long id) {
        //System.err.println(objectService.findById(1L)); //przetestowane działa
        return "obiekt";
    }
}
