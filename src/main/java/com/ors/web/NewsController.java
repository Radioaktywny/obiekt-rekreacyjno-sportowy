package com.ors.web;

import com.ors.model.News;
import com.ors.model.User;
import com.ors.service.NewsService;
import com.ors.service.ObjectService;
import com.ors.service.PriceListService;
import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by cos on 15.12.2016.
 */

@Controller
public class NewsController {

    @Autowired
    private ObjectService objectService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private PriceListService priceListService;

    @RequestMapping(value = "/userProfileSettings", method = RequestMethod.POST)
    public String userProfileSettings(@ModelAttribute("newsForm") News news, BindingResult bindingResult, Model model) {

        System.err.println(news.toString());
        if(bindingResult.hasErrors())
        {
            return "error";
        }
        news.setData(String.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())));
        newsService.save(news);
        return "index";
    }

//    @RequestMapping(value = "/userProfileSettings/delete_news/{id}", method = RequestMethod.DELETE)
//    public String deleteNews(@PathVariable("id") Long id) {
//        return newsService.delete(id) ? "userProfileSettings" : "error";
//
//    }

    @RequestMapping(value = "/userProfileSettings/dupa", method = RequestMethod.POST)
    public String deleteNews(@RequestParam String action , @PathVariable(value="id") Long id , Model model) {
        if(action.equals("edit"))
        {
            model.addAttribute("newsForm" , newsService.findById(id));
            return "userProfileSettings";
        }else if(action.equals("delete"))
        {
            return newsService.delete(id) ? "userProfileSettings" : "error";
        }
        return "error";
    }




    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String userProfileSettings(Model model, HttpServletRequest request) {
        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("newsForm", new News());
        model.addAttribute("objectList", objectService.findAll());
        model.addAttribute("newsList", newsService.findAll());
        return "news";
    }



}
