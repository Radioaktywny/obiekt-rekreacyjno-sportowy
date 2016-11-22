package application;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Marcin on 22.11.2016.
 */
@Controller
public class IndexController {

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String getView() {
        return "index";
    }
}
