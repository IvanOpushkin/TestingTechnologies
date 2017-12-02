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

    //proizvoditel, edizmereniya, kolvo, cena, primechanie, articul, picture

    private final String proizvoditel;
    private final String edizmereniya;
    private final int kolvo;
    private final int cena;
    private final String primechanie;
    private final String articul;
    private final String picture;

    private final boolean exceed;

    public MealWithExceed(@JsonProperty("id") Integer id,
                          @JsonProperty("dateTime") LocalDateTime dateTime,
                          @JsonProperty("description") String description,
                          @JsonProperty("type1") String type1,
                          @JsonProperty("type2") String type2,
                          @JsonProperty("cod") int cod,
                          @JsonProperty("naimenovanie") String naimenovanie,
                          @JsonProperty("proizvoditel") String proizvoditel,
                          @JsonProperty("edizmereniya") String edizmereniya,
                          @JsonProperty("kolvo") int kolvo,
                          @JsonProperty("cena") int cena,
                          @JsonProperty("primechanie") String primechanie,
                          @JsonProperty("articul") String articul,
                          @JsonProperty("picture") String picture,
                          @JsonProperty("exceed") boolean exceed) {
        super(id);
        this.dateTime = dateTime;
        this.description = description;
        this.type1 = type1;
        this.type2 = type2;
        this.cod = cod;
        this.naimenovanie = naimenovanie;
        this.proizvoditel=proizvoditel;
        this.edizmereniya=edizmereniya;
        this.kolvo=kolvo;
        this.cena=cena;
        this.primechanie=primechanie;
        this.articul=articul;
        this.picture=picture;



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

    public String getProizvoditel() {
        return proizvoditel;
    }

    public String getEdizmereniya() {
        return edizmereniya;
    }

    public int getKolvo() {
        return kolvo;
    }

    public int getCena() {
        return cena;
    }

    public String getPrimechanie() {
        return primechanie;
    }

    public String getArticul() {
        return articul;
    }

    public String getPicture() {
        return picture;
    }

    public boolean isExceed() {
        return exceed;
    }

    @Override
    public String toString() {
        return "MealWithExceed{" +
                "dateTime=" + dateTime +
                ", description='" + description + '\'' +
                ", type1='" + type1 + '\'' +
                ", type2='" + type2 + '\'' +
                ", cod=" + cod +
                ", naimenovanie='" + naimenovanie + '\'' +
                ", proizvoditel='" + proizvoditel + '\'' +
                ", edizmereniya='" + edizmereniya + '\'' +
                ", kolvo=" + kolvo +
                ", cena=" + cena +
                ", primechanie='" + primechanie + '\'' +
                ", articul='" + articul + '\'' +
                ", picture='" + picture + '\'' +
                ", exceed=" + exceed +
                '}';
    }
}