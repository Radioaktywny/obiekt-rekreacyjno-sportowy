package com.ors.web;


import com.ors.model.Contact;
import com.ors.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by DuduŚ on 2016-12-16.
 */
@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;


    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String contactService(Model model) {

        model.addAttribute("contactForm", new Contact());
        return "contact";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String contactService(@ModelAttribute("contactForm") Contact contact, BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "/contact";
        }

        contactService.saveMessage(contact);
        return "/index";
    }
}
