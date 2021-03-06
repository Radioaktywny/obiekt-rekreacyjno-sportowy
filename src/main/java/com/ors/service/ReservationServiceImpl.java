package com.ors.service;

import com.ors.model.Reservation;
import com.ors.model.User;
import com.ors.repository.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cos on 12.12.2016.
 */
@Service
public class ReservationServiceImpl implements ReservationService{
    @Autowired
    private ReservationRepository reservationRepository;

    @Override
    public void save(Reservation reservation) {
        reservationRepository.save(reservation);
    }

    @Override
    public List<Reservation> findByUserId(Long userId) {
        return reservationRepository.findByUserId(userId);
    }

//    @Override
//    public List<Reservation> findAllReservationForUser(User user) {
//       return reservationRepository.findByUserId(user.getId());
//    }

    @Override
    public List<Reservation> findAll() {
        return reservationRepository.findAll();
    }
}
