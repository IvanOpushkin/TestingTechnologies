package ru.javawebinar.topjava.web.meal;

import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import ru.javawebinar.topjava.View;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.to.MealWithExceed;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@RestController
@RequestMapping(value = "/ajax/profile/meals")
public class MealAjaxController extends AbstractMealController {



    @Override
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getAll() {
        return super.getAll();
    }





    @Override
    @GetMapping(value = "/{id}")
    public Meal get(@PathVariable("id") int id) {
        return super.get(id);
    }

    @Override
    @DeleteMapping(value = "/{id}")
    public void delete(@PathVariable("id") int id) {
        super.delete(id);
    }

    @PostMapping
    public void createOrUpdate(@Validated(View.ValidatedRestUI.class) Meal meal) {
        if (meal.isNew()) {
            super.create(meal);
        } else {
            super.update(meal, meal.getId());
        }
    }

    @PostMapping(value = "/filterSetevoe", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getSetevoe()
    {
        return super.getSetevoe();
    }

    @PostMapping(value = "/filterSantex", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getSantex()
    {
        return super.getSantex();
    }
/*
    @Override
    @PostMapping(value = "/setevoe", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getSetevoe() {
        System.out.println("ok");
        return super.getSetevoe();
    }


    @Override
    @PostMapping(value = "/filter", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getBetween(
            @RequestParam(value = "startDate", required = false) LocalDate startDate,
            @RequestParam(value = "startTime", required = false) LocalTime startTime,
            @RequestParam(value = "endDate", required = false) LocalDate endDate,
            @RequestParam(value = "endTime", required = false) LocalTime endTime)
    {
        return super.getSetevoe();
    }

    */
}
