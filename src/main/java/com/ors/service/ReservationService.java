package com.ors.service;

import com.ors.model.Reservation;
import com.ors.model.User;

import java.util.List;

/**
 * Created by cos on 12.12.2016.
 */
public interface ReservationService {

    void save(Reservation reservation);
    List<Reservation> findByUserId(Long userId);
    List<Reservation> findAll();
}
