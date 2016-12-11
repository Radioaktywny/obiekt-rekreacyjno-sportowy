package com.ors.repository;

import com.ors.model.ObjectDutyHours;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by bgacek on 11.12.2016.
 */
public interface ObjectDutyHoursRepository extends JpaRepository<ObjectDutyHours, Long>
{
    ObjectDutyHours findById(Long id);
    ObjectDutyHours findByObjectId(Long objectId);
    List<ObjectDutyHours> findAll();
}
