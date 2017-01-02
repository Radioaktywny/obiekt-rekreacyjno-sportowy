package com.ors.web;

/**
 * Created by Marcin on 05.12.2016.
 */

import com.ors.model.News;
import com.ors.model.User;
import com.ors.service.*;
import com.ors.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;

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

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

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

    @RequestMapping(value = "/userProfileEdit", method = RequestMethod.GET)
    public String userProfileEdit(Model model, HttpServletRequest request) {

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "userProfileEdit";
    }

    @RequestMapping(value = "/userProfileEditEmail", method = RequestMethod.POST)
    public String userProfileEditEmail(@RequestParam("userName") String name, @RequestParam("id") String id, Model model, HttpServletRequest request) {
        User user = priceListService.getUser(request.getUserPrincipal().getName());

        if (name != null) {
            userService.updateEmail(name, Long.parseLong(id));
        }


        model.addAttribute("user", user);
        return "userProfile";
    }

    @RequestMapping(value = "/userProfileEditStreet", method = RequestMethod.POST)
    public String userProfileEditStreet(@RequestParam("street") String street, @RequestParam("id") String id, Model model, HttpServletRequest request) {

        if (street != null) {
            userService.updateStreet(street, Long.parseLong(id));
        }

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);

        return "userProfile";
    }

    @RequestMapping(value = "/userProfileEditPhone", method = RequestMethod.POST)
    public String userProfileEditPhone(@RequestParam("phone") String phone, @RequestParam("id") String id, Model model, HttpServletRequest request) {



        if (phone != null) {
            userService.updateNumber(phone, Long.parseLong(id));
        }

        User user = priceListService.getUser(request.getUserPrincipal().getName());
        model.addAttribute("user", user);

        return "userProfile";
    }

    @RequestMapping(value = "/userProfileEditPassword", method = RequestMethod.POST)
    public String userProfileEditPassword(@RequestParam("password1") String password1, @RequestParam("password2") String password2, @RequestParam("id") String id, Model model, HttpServletRequest request) {

        if (password1 != null && password2 != null) {
            System.out.println(password1+ "  "+password2);
            String passwordInput = bCryptPasswordEncoder.encode(password1);
            User user2 = priceListService.getUser(request.getUserPrincipal().getName());
            System.out.println(passwordInput+" 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
            System.out.println(user2.getPassword()+" 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

            if(bCryptPasswordEncoder.matches(passwordInput,user2.getPassword())) {
                System.out.println(passwordInput+" 1!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                String newPassword = bCryptPasswordEncoder.encode(password2);
                userService.updatePassword(newPassword, Long.parseLong(id));

                User user = priceListService.getUser(request.getUserPrincipal().getName());
                model.addAttribute("user", user);
                return "userProfile";
            }

        }
        return "userProfileEdit";
    }


}
