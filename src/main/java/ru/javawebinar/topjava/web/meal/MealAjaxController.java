package ru.javawebinar.topjava.web.meal;

import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import ru.javawebinar.topjava.View;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.to.MealWithExceed;

import java.util.List;

@RestController
@RequestMapping(value = "/ajax/profile/meals")
public class MealAjaxController extends AbstractMealController {



    @Override
    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getAll() {

        //Сэттинг на цену всего
        return super.toFullPriceOfType(super.getAll());

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
        return super.toFullPriceOfType(super.getType("Сетевое оборудование"));




        //return super.getType("Сетевое оборудование");
    }

    @PostMapping(value = "/filterSantex", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getSantex()
    {
        return super.toFullPriceOfType(super.getType("Сантехническое оборудование"));
    }

    @PostMapping(value = "/filterZashitLotok", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getZashitLotok()
    {
        return super.toFullPriceOfType(super.getType("Защитный лоток"));
    }

    @PostMapping(value = "/filterElectroShit", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getElectroshit()
    {

        return super.toFullPriceOfType(super.getType("Электрощитовое оборудование"));
    }

    @PostMapping(value = "/filterSvetovoe", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getSvetovoe()
    {
        return super.toFullPriceOfType(super.getType("Световое оборудование"));
    }

    @PostMapping(value = "/filterCommun", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getCommun()
    {
        return super.toFullPriceOfType(super.getType("Коммуникационные шкафы"));
    }

    @PostMapping(value = "/filterComp", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getComp()
    {
        return super.toFullPriceOfType(super.getType("Компьютерное оборудование"));
    }

    @PostMapping(value = "/filterTelecom", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getTelecom()
    {
        return super.toFullPriceOfType(super.getType("Телекомуникационные"));
    }

    @PostMapping(value = "/filterOffice", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getOffice()
    {
        return super.toFullPriceOfType(super.getType("Офисное оборудование"));
    }

    @PostMapping(value = "/filterPozhar", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getPozhar()
    {
        return super.toFullPriceOfType(super.getType("Пожарно-охранное оборудование"));
    }

    @PostMapping(value = "/filterCifro", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getCifro()
    {
        return super.toFullPriceOfType(super.getType("Цифровое"));
    }

    @PostMapping(value = "/filterElectromont", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getElectromont()
    {
        return super.toFullPriceOfType(super.getType("Электромонтажное"));
    }

    @PostMapping(value = "/filterMont", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getMont()
    {
        return super.toFullPriceOfType(super.getType("Монтажное оборудование"));
    }


    @PostMapping(value = "/filterAkkamul", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getAkkamul()
    {
        return super.toFullPriceOfType(super.getType("Аккумуляторы"));
    }


    @PostMapping(value = "/filterBezCeni", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getBezCeni()
    {
        return super.toFullPriceOfType(super.getBezCeni());
    }


    @PostMapping(value = "/filterTeploAndDef", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<MealWithExceed> getTeploAndDef()
    {
        return super.toFullPriceOfType(super.getType("Теплоизоляция и защитные покрытия"));
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
