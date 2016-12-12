package com.ors.web;

/**
 * Created by Marcin on 05.12.2016.
 */

import com.ors.model.User;
import com.ors.service.PriceListService;
import com.ors.service.SecurityService;
import com.ors.service.UserService;
import com.ors.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private PriceListService priceListService;

    //TU CHCE TE REZERWACJE
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
        model.addAttribute("reservationList" , "TU ZIOMEK MI WRZUCISZ TA LISTE OK ( WYSZUKIWANA PO ID UZYTKOWNIKA)");
        model.addAttribute("user", user);

        return "userProfileReservation";
    }

    @RequestMapping(value = "/userProfileSettings", method = RequestMethod.GET)
    public String userProfileSettings(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "userProfileSettings";
    }
}
