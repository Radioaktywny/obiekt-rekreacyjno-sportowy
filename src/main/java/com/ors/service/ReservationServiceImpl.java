package com.ors.service;

import com.ors.model.Reservation;
import com.ors.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by cos on 12.12.2016.
 */
@Service
public class ReservationServiceImpl implements ReservationService{
    @Autowired
    private ReservationRepository userRepository;

    @Override
    public void save(Reservation reservation) {
        userRepository.save(reservation);
    }
}
