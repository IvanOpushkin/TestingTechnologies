package ru.javawebinar.topjava.model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.validator.constraints.Range;
import org.hibernate.validator.constraints.SafeHtml;
import org.springframework.format.annotation.DateTimeFormat;
import ru.javawebinar.topjava.View;
import ru.javawebinar.topjava.util.DateTimeUtil;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

@SuppressWarnings("JpaQlInspection")
@NamedQueries({
        @NamedQuery(name = Meal.ALL_SORTED, query = "SELECT m FROM Meal m WHERE m.user.id=:userId ORDER BY m.dateTime DESC"),
        @NamedQuery(name = Meal.DELETE, query = "DELETE FROM Meal m WHERE m.id=:id AND m.user.id=:userId"),
        @NamedQuery(name = Meal.GET_BETWEEN, query = "SELECT m FROM Meal m " +
                "WHERE m.user.id=:userId AND m.dateTime BETWEEN :startDate AND :endDate ORDER BY m.dateTime DESC"),
//        @NamedQuery(name = Meal.UPDATE, query = "UPDATE Meal m SET m.dateTime = :datetime, m.calories= :calories," +
//                "m.description=:desc where m.id=:id and m.user.id=:userId")
})
@Entity
@Table(name = "meals", uniqueConstraints = {@UniqueConstraint(columnNames = {"user_id", "date_time"}, name = "meals_unique_user_datetime_idx")})
public class Meal extends AbstractBaseEntity {
    public static final String ALL_SORTED = "Meal.getAll";
    public static final String DELETE = "Meal.delete";
    public static final String GET_BETWEEN = "Meal.getBetween";

    @Column(name = "date_time", nullable = false)
    @NotNull
    @DateTimeFormat(pattern = DateTimeUtil.DATE_TIME_PATTERN)
    private LocalDateTime dateTime;

    @Column(name = "description", nullable = false)
    @NotBlank
    @Size(min = 2, max = 120)
    //@SafeHtml чекс текст на зловредные скрипты, чтобы их не было. Как в гугл поисковике
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String description;


    @Column(name = "type1", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String type1;

    @Column(name = "type2", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String type2;



    @Column(name = "cod", nullable = false)
    //@Range(min = 10, max = 5000)
    @NotNull
    private Integer cod;

    @Column(name = "naimenovanie", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String naimenovanie;

    //5 текстовых и 2 цифровые (2 2(цифр) 3)



    //proizvoditel
    //1
    @Column(name = "proizvoditel", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String proizvoditel;

    //edizmereniya
    //2
    @Column(name = "edizmereniya", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String edizmereniya;

    //kolvo
    //3
    @Column(name = "kolvo", nullable = false)
    //@Range(min = 10, max = 5000)
    @NotNull
    private Integer kolvo;

    //cena
    //4
    @Column(name = "cena", nullable = false)
    //@Range(min = 10, max = 5000)
    @NotNull
    private Integer cena;

    //primechanie
    //5
    @Column(name = "primechanie", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String primechanie;

    //articul
    //6
    @Column(name = "articul", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String articul;

    //picture
    //7
    @Column(name = "picture", nullable = false)
    @NotBlank
    @SafeHtml(groups = {View.ValidatedRestUI.class})
    private String picture;


    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @NotNull(groups = View.Persist.class)
    private User user;

    public Meal() {
    }

    public Meal(LocalDateTime dateTime, String description, int cod, String naimenovanie) {
        this(null, dateTime, description, cod, naimenovanie);
    }

    public Meal(Integer id, LocalDateTime dateTime, String description, int cod, String naimenovanie) {
        super(id);
        this.dateTime = dateTime;
        this.description = description;
        this.cod = cod;
        this.naimenovanie = naimenovanie;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public String getDescription() {
        return description;
    }

    public Integer getCod() {
        return cod;
    }

    public void setCod(Integer cod) {
        this.cod = cod;
    }

    public LocalDate getDate() {
        return dateTime.toLocalDate();
    }

    public LocalTime getTime() {
        return dateTime.toLocalTime();
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getNaimenovanie() {
        return naimenovanie;
    }

    public void setNaimenovanie(String naimenovanie) {
        this.naimenovanie = naimenovanie;
    }

   //Новых 14


    public String getProizvoditel() {
        return proizvoditel;
    }

    public void setProizvoditel(String proizvoditel) {
        this.proizvoditel = proizvoditel;
    }

    public String getEdizmereniya() {
        return edizmereniya;
    }

    public void setEdizmereniya(String edizmereniya) {
        this.edizmereniya = edizmereniya;
    }

    public Integer getKolvo() {
        return kolvo;
    }

    public void setKolvo(Integer kolvo) {
        this.kolvo = kolvo;
    }

    public Integer getCena() {
        return cena;
    }

    public void setCena(Integer cena) {
        this.cena = cena;
    }

    public String getPrimechanie() {
        return primechanie;
    }

    public void setPrimechanie(String primechanie) {
        this.primechanie = primechanie;
    }

    public String getArticul() {
        return articul;
    }

    public void setArticul(String articul) {
        this.articul = articul;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getType1() {
        return type1;
    }

    public void setType1(String type1) {
        this.type1 = type1;
    }

    public String getType2() {
        return type2;
    }

    public void setType2(String type2) {
        this.type2 = type2;
    }

    @Override
    public String toString() {
        return "Meal{" +
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
                ", user=" + user +
                '}';
    }
}
