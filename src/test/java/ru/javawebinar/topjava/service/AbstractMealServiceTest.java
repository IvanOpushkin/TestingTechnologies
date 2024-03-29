package ru.javawebinar.topjava.service;

import org.junit.Assume;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.util.exception.ErrorType;
import ru.javawebinar.topjava.util.exception.NotFoundException;

import javax.validation.ConstraintViolationException;
import java.time.LocalDate;
import java.time.Month;
import java.util.Arrays;

import static java.time.LocalDateTime.of;
import static org.hamcrest.core.StringContains.containsString;
import static ru.javawebinar.topjava.MealTestData.*;
import static ru.javawebinar.topjava.UserTestData.ADMIN_ID;
import static ru.javawebinar.topjava.UserTestData.USER_ID;

public abstract class AbstractMealServiceTest extends AbstractServiceTest {

    @Autowired
    protected MealService service;

    @Test
    public void testDelete() throws Exception {
        service.delete(MEAL1_ID, USER_ID);
        MATCHER.assertListEquals(Arrays.asList(MEAL6, MEAL5, MEAL4, MEAL3, MEAL2), service.getAll(USER_ID));
    }

    @Test
    public void testDeleteNotFound() throws Exception {
        thrown.expect(NotFoundException.class);
        service.delete(MEAL1_ID, 1);
    }

    @Test
    public void testCreate() throws Exception {
        Meal created = getCreated();
        service.create(created, USER_ID);
        MATCHER.assertListEquals(Arrays.asList(created, MEAL6, MEAL5, MEAL4, MEAL3, MEAL2, MEAL1), service.getAll(USER_ID));
    }

    @Test
    public void testGet() throws Exception {
        Meal actual = service.get(ADMIN_MEAL_ID, ADMIN_ID);
        MATCHER.assertEquals(ADMIN_MEAL1, actual);
    }

    @Test
    public void testGetNotFound() throws Exception {
        thrown.expect(NotFoundException.class);
        service.get(MEAL1_ID, ADMIN_ID);
    }

    @Test
    public void testUpdate() throws Exception {
        Meal updated = getUpdated();
        service.update(updated, USER_ID);
        MATCHER.assertEquals(updated, service.get(MEAL1_ID, USER_ID));
    }

    @Test
    public void testUpdateNotFound() throws Exception {
        thrown.expect(NotFoundException.class);
        thrown.expectMessage(containsString(ErrorType.DATA_NOT_FOUND.name()));
        thrown.expectMessage(containsString(NotFoundException.NOT_FOUND_EXCEPTION));
        thrown.expectMessage(containsString(String.valueOf(MEAL1_ID)));
        service.update(MEAL1, ADMIN_ID);
    }

    @Test
    public void testGetAll() throws Exception {
        MATCHER.assertListEquals(MEALS, service.getAll(USER_ID));
    }

    @Test
    public void testGetBetween() throws Exception {
        MATCHER.assertListEquals(Arrays.asList(MEAL3, MEAL2, MEAL1),
                service.getBetweenDates(
                        LocalDate.of(2015, Month.MAY, 30),
                        LocalDate.of(2015, Month.MAY, 30), USER_ID));
    }

    @Test
    public void testValidation() throws Exception {
        Assume.assumeTrue(isJpaBased());
        validateRootCause(() -> service.create(new Meal(null, of(2015, Month.JUNE, 1, 18, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no"), USER_ID), ConstraintViolationException.class);
        validateRootCause(() -> service.create(new Meal(null, of(2015, Month.MAY, 30, 10, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no"), USER_ID), ConstraintViolationException.class);
        validateRootCause(() -> service.create(new Meal(null, of(2015, Month.JUNE, 1, 18, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no"), USER_ID), ConstraintViolationException.class);
        validateRootCause(() -> service.create(new Meal(null, of(2015, Month.JUNE, 1, 18, 0), "Завтрак","Завтрак", "Завтрак2", "Завтрак2","500", "Завтрак2", "ok", "nook", 444, 555, "no", "yes", "no","no"), USER_ID), ConstraintViolationException.class);
    }
}

















