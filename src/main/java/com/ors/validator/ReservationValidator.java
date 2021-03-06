package com.ors.validator;

import com.ors.model.Reservation;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Marcin on 12.12.2016.
 */
@Component
public class ReservationValidator implements Validator {

    private boolean isEndOfReservationLaterThanStartOfReserv(String startOfReservation, String endOfReservation) {
        Integer hourStartReservation = Integer.valueOf(startOfReservation.substring(0, startOfReservation.indexOf(":")));
        Integer hourEndOfReservation = Integer.valueOf(endOfReservation.substring(0, endOfReservation.indexOf(":")));
        if (hourEndOfReservation > hourStartReservation) {
            return true;
        }
        return false;
    }

    private boolean gotDateIsNotBeforeThanToday(String date) {
        if (date.length() < 2)
            return true;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            Date gotDate = sdf.parse(date);
            Date currentDate = sdf.parse(sdf.format(new Date()));
            currentDate.setTime(currentDate.getTime() + 24 * 60 * 60 * 1000);
            if (gotDate.before(currentDate))
                return false;
            return true;
        } catch (ParseException e) {
            return false;
        }
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.isInstance(Reservation.class);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Reservation reservation = (Reservation) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dayOfReservation", "Reservation.emptyDate");

        if (!isEndOfReservationLaterThanStartOfReserv(reservation.getHourOfReservation(),
                reservation.getHourOfEndReservation())) {
            errors.rejectValue("hourOfEndReservation", "Reservation.invalidHoursOfReservation");
        }

        if (!gotDateIsNotBeforeThanToday(reservation.getDayOfReservation())) {
            errors.rejectValue("dayOfReservation", "Reservation.invalidDateOfReservation");
        }
    }
}
