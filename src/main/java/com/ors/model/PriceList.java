package com.ors.model;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by bgacek on 08.12.2016.
 */
@Entity
@Table(name = "cennik")

public class PriceList
{
    @Id
    @GeneratedValue
    @Column(name = "id")
    private Long id;


    @NotNull
    @Column(name = "id_obiektu")
    private Long objectId;

    @NotNull
    @Column(name = "wynajecie_robocze_taryfa_pierwsza")
    private Integer rentWeekdayTariffOnePrice;

    @NotNull
    @Column(name = "wynajecie_robocze_taryfa_druga")
    private Integer rentWeekdayTariffTwoPrice;

    @NotNull
    @Column(name = "wynajecie_weekend_taryfa_pierwsza")
    private Integer rentWeekendTariffOnePrice;

    @NotNull
    @Column(name = "wynajecie_weekend_taryfa_druga")
    private Integer rentWeekendTariffTwoPrice;

    @NotNull
    @Column(name = "karnet_robocze_taryfa_pierwsza")
    private Integer subscriptionTariffOnePrice;

    @NotNull
    @Column(name = "karnet_robocze_taryfa_druga")
    private Integer subscriptionTariffTwoPrice;


    @Column(name = "jednorazowe_wejscie")
    private Integer oneTimeEntrancePrice;

    @NotNull
    @Column(name = "godzina_zmiany_taryfy")
    private String tariffSwitchHour;

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getObjectId()
    {
        return objectId;
    }

    public void setObjectId(Long objectId)
    {
        this.objectId = objectId;
    }

    public Integer getRentWeekdayTariffOnePrice()
    {
        return rentWeekdayTariffOnePrice;
    }

    public void setRentWeekdayTariffOnePrice(Integer rentWeekdayTariffOnePrice)
    {
        this.rentWeekdayTariffOnePrice = rentWeekdayTariffOnePrice;
    }

    public Integer getRentWeekdayTariffTwoPrice()
    {
        return rentWeekdayTariffTwoPrice;
    }

    public void setRentWeekdayTariffTwoPrice(Integer rentWeekdayTariffTwoPrice)
    {
        this.rentWeekdayTariffTwoPrice = rentWeekdayTariffTwoPrice;
    }

    public Integer getRentWeekendTariffOnePrice()
    {
        return rentWeekendTariffOnePrice;
    }

    public void setRentWeekendTariffOnePrice(Integer rentWeekendTariffOnePrice)
    {
        this.rentWeekendTariffOnePrice = rentWeekendTariffOnePrice;
    }

    public Integer getRentWeekendTariffTwoPrice()
    {
        return rentWeekendTariffTwoPrice;
    }

    public void setRentWeekendTariffTwoPrice(Integer rentWeekendTariffTwoPrice)
    {
        this.rentWeekendTariffTwoPrice = rentWeekendTariffTwoPrice;
    }

    public Integer getSubscriptionTariffOnePrice()
    {
        return subscriptionTariffOnePrice;
    }

    public void setSubscriptionTariffOnePrice(Integer subscriptionTariffOnePrice)
    {
        this.subscriptionTariffOnePrice = subscriptionTariffOnePrice;
    }

    public Integer getSubscriptionTariffTwoPrice()
    {
        return subscriptionTariffTwoPrice;
    }

    public void setSubscriptionTariffTwoPrice(Integer subscriptionTariffTwoPrice)
    {
        this.subscriptionTariffTwoPrice = subscriptionTariffTwoPrice;
    }

    public Integer getOneTimeEntrancePrice()
    {
        return oneTimeEntrancePrice;
    }

    public void setOneTimeEntrancePrice(Integer oneTimeEntrancePrice)
    {
        this.oneTimeEntrancePrice = oneTimeEntrancePrice;
    }

    public String getTariffSwitchHour()
    {
        return tariffSwitchHour;
    }

    public void setTariffSwitchHour(String tariffSwitchHour)
    {
        this.tariffSwitchHour = tariffSwitchHour;
    }
}
