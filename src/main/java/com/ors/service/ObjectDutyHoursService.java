package com.ors.service;

import com.ors.model.ObjectDutyHours;

import java.util.List;

/**
 * Created by bgacek on 11.12.2016.
 */
public interface ObjectDutyHoursService
{
    ObjectDutyHours findById(Long id);
    ObjectDutyHours findByObjectId(Long objectId);
    List<ObjectDutyHours> findAll();
}
