package com.ors.web;

import com.ors.model.News;
import com.ors.model.User;
import com.ors.service.NewsService;
import com.ors.service.ObjectService;
import com.ors.service.PriceListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.text.SimpleDateFormat;
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

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String userProfileSettings(Model model, HttpServletRequest request) {
        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("newsForm", new News());
        model.addAttribute("objectList", objectService.findAll());
        model.addAttribute("newsList", newsService.findAll());
        return "news";
    }

    @RequestMapping(value = "/userProfileSettings", method = RequestMethod.POST)
    public String userProfileSettings(@ModelAttribute("newsForm") News news, BindingResult bindingResult, Model model) {

        System.err.println(news.toString());
        if (bindingResult.hasErrors()) {
            return "error";
        }
        news.setData(String.valueOf(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS").format(new Date())));
        if (news.getId() != null) {
            newsService.update(news);
        } else
            newsService.save(news);

        return "redirect:/userProfileSettings";
    }

    @RequestMapping(value = "/userProfileSettings/edit", method = RequestMethod.POST)
    public String deleteNews(@RequestParam("type") String action, @RequestParam("selectId") Long id, Model model, Principal principal) {

        if (action.equals("edit")) {

            News news = newsService.findById(id);
            System.out.println(news.toString());
            model.addAttribute("newsForm", new News(news.getId(), news.getObjectId()));
            model.addAttribute("xd",news.getId());
            model.addAttribute("xd1",news.getId());
            model.addAttribute("newsList", newsService.findAll());
            model.addAttribute("objectList", objectService.findAll());

            return "userProfileSettings";

        } else if (action.equals("delete")) {
            if (newsService.delete(id)) {

                model.addAttribute("newsForm", new News());
                model.addAttribute("objectList", objectService.findAll());
                model.addAttribute("newsList", newsService.findAll());

                return "redirect:/userProfileSettings";
            }
        }
        return "error";
    }


}
