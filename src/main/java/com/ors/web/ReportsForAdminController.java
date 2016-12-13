package com.ors.web;

import com.ors.model.ReportObj;
import com.ors.service.ReportsForAdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Marcin on 13.12.2016.
 */
@Controller
public class ReportsForAdminController {

    @Autowired
    private ReportsForAdministratorService reportsForAdministratorService;

    @RequestMapping(value = "/reports", method = RequestMethod.GET)
    public String priceListsOfAllObjects(Model model) {
        List<ReportObj> reportObjs = Arrays.asList(reportsForAdministratorService.reportForNewUser(),
                reportsForAdministratorService.reportForReservations());

        model.addAttribute("reports", reportObjs);
        return "reports";
    }
}
