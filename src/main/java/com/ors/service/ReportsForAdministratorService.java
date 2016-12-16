package com.ors.service;

import com.ors.model.ReportObj;

/**
 * Created by Marcin on 13.12.2016.
 */
public interface ReportsForAdministratorService {

    ReportObj reportForNewUser();

    ReportObj reportForReservations();

}
