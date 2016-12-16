package com.ors.web;

/**
 * Created by Marcin on 05.12.2016.
 */

import com.ors.model.News;
import com.ors.model.Reservation;
import com.ors.model.User;
import com.ors.service.*;
import com.ors.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private ObjectService objectService;

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private PriceListService priceListService;

    @Autowired
    private ContactService contactService;

    @Autowired
    private ReservationService reservationService;
    //   @Autowired
    //   private PriceListService priceListService;

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "index";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = "/userProfile", method = RequestMethod.GET)
    public String userProfile(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "userProfile";
    }

    @RequestMapping(value = "/userProfileReservation", method = RequestMethod.GET)
    public String userProfileReservation(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());

        model.addAttribute("listsofReservation", reservationService.findByUserId(user.getId()));
        model.addAttribute("user", user);

        return "userProfileReservation";
    }

    @RequestMapping(value = "/userProfileMessages", method = RequestMethod.GET)
    public String userProfileMessages(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());

        model.addAttribute("listsOfMessages", contactService.getContactMess());
        model.addAttribute("user", user);

        return "userProfileMessages";
    }

    @RequestMapping(value = "/userProfileSettings", method = RequestMethod.GET)
    public String userProfileSettings(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        model.addAttribute("newsForm", new News());
        model.addAttribute("newsList", newsService.findAll());
        model.addAttribute("objectList" , objectService.findAll());
        return "userProfileSettings";
    }

    @RequestMapping(value = "/userProfileEdit", method = RequestMethod.GET)
    public String userProfileEdit(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "userProfileEdit";
    }

    @RequestMapping(value = "/userProfileEdit", method = RequestMethod.POST)
    public String userProfileEdit(@RequestParam("userName") String name, @RequestParam("password") String password, Model model, HttpServletRequest request) {


        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "userProfileEdit";
    }


}
