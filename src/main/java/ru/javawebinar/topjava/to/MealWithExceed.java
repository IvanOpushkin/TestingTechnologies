package ru.javawebinar.topjava.to;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.time.LocalDateTime;

public class MealWithExceed extends BaseTo {

    private final LocalDateTime dateTime;

    private final String description;

    private final String type1;
    private final String type2;



    private final int cod;

    private final String naimenovanie;

    private final boolean exceed;

    public MealWithExceed(@JsonProperty("id") Integer id,
                          @JsonProperty("dateTime") LocalDateTime dateTime,
                          @JsonProperty("description") String description,
                          @JsonProperty("type1") String type1,
                          @JsonProperty("type2") String type2,
                          @JsonProperty("cod") int cod,
                          @JsonProperty("naimenovanie") String naimenovanie,
                          @JsonProperty("exceed") boolean exceed) {
        super(id);
        this.dateTime = dateTime;
        this.description = description;
        this.type1 = type1;
        this.type2 = type2;
        this.cod = cod;
        this.naimenovanie = naimenovanie;
        this.exceed = exceed;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public String getDescription() {
        return description;
    }

    public String getType1() {
        return type1;
    }

    public String getType2() {
        return type2;
    }

    public int getCod() {
        return cod;
    }

    public String getNaimenovanie() {
        return naimenovanie;
    }

    public boolean isExceed() {
        return exceed;
    }

    @Override
    public String toString() {
        return "MealWithExceed{" +
                "dateTime=" + dateTime +
                ", description='" + description + '\'' +
                ", cod=" + cod +
                ", naimenovanie='" + naimenovanie + '\'' +
                ", exceed=" + exceed +
                '}';
    }
}