package com.ors.service;

import com.ors.model.SeasonPass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bgacek on 11.12.2016.
 */

@Service
public class SeasonPassServiceImpl implements SeasonPassService
{
    @Autowired SeasonPassService seasonPassService;

    @Override
    public List<SeasonPass> findByUserId(Long userId)
    {
        return seasonPassService.findByUserId(userId);
    }

    @Override
    public SeasonPass findByUserIdAndObjectId(Long userId, Long objectId)
    {
        return seasonPassService.findByUserIdAndObjectId(userId, objectId);
    }
}
