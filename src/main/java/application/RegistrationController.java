package application;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by cos on 05.12.2016.
 */
@Controller
public class RegistrationController {
    @RequestMapping(value = "/registration" , method = RequestMethod.GET)
    public String getRegistration() {return  "registration";}
}
