package com.ors.service;

import com.ors.model.SeasonPass;

import java.util.List;

/**
 * Created by bgacek on 11.12.2016.
 */
public interface SeasonPassService
{
    List<SeasonPass> findByUserId(Long userId);
    SeasonPass findByUserIdAndObjectId(Long userId, Long objectId);
}
