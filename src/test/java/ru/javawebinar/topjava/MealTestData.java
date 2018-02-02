package ru.javawebinar.topjava;

import ru.javawebinar.topjava.matcher.BeanMatcher;
import ru.javawebinar.topjava.model.Meal;

import java.time.Month;
import java.util.Arrays;
import java.util.List;

import static java.time.LocalDateTime.of;
import static ru.javawebinar.topjava.model.AbstractBaseEntity.START_SEQ;

public class MealTestData {

    public static final BeanMatcher<Meal> MATCHER = BeanMatcher.of(Meal.class);

    public static final int MEAL1_ID = START_SEQ + 2;
    public static final int ADMIN_MEAL_ID = START_SEQ + 8;

    public static final Meal MEAL1 = new Meal(MEAL1_ID, of(2015, Month.MAY, 30, 10, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    public static final Meal MEAL2 = new Meal(MEAL1_ID, of(2015, Month.MAY, 30, 10, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    public static final Meal MEAL3 = new Meal(MEAL1_ID, of(2015, Month.MAY, 30, 10, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    public static final Meal MEAL4 = new Meal(MEAL1_ID, of(2015, Month.MAY, 30, 10, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    public static final Meal MEAL5 = new Meal(MEAL1_ID, of(2015, Month.MAY, 30, 10, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    public static final Meal MEAL6 = new Meal(MEAL1_ID, of(2015, Month.MAY, 30, 10, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    public static final Meal ADMIN_MEAL1 = new Meal(ADMIN_MEAL_ID, of(2015, Month.JUNE, 1, 14, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    public static final Meal ADMIN_MEAL2 = new Meal(ADMIN_MEAL_ID + 1, of(2015, Month.JUNE, 1, 21, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");

    public static final List<Meal> MEALS = Arrays.asList(MEAL6, MEAL5, MEAL4, MEAL3, MEAL2, MEAL1);

    public static Meal getCreated() {
        return new Meal(null, of(2015, Month.JUNE, 1, 18, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    }

    public static Meal getUpdated() {
        return new Meal(MEAL1_ID, MEAL1.getDateTime(), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no");
    }
}

















