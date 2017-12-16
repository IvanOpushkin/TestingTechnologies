package ru.javawebinar.topjava.web.meal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import ru.javawebinar.topjava.AuthorizedUser;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.service.MealService;
import ru.javawebinar.topjava.to.MealWithExceed;
import ru.javawebinar.topjava.util.DateTimeUtil;
import ru.javawebinar.topjava.util.MealsUtil;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import static ru.javawebinar.topjava.util.ValidationUtil.assureIdConsistent;
import static ru.javawebinar.topjava.util.ValidationUtil.checkNew;

public abstract class AbstractMealController {
    private final Logger log = LoggerFactory.getLogger(getClass());

    @Autowired
    private MealService service;

    public Meal get(int id) {
        int userId = AuthorizedUser.id();
        log.info("get meal {} for User {}", id, userId);
        return service.get(id, userId);
    }

    public void delete(int id) {
        int userId = AuthorizedUser.id();
        if (userId==200000) return;
        log.info("delete meal {} for User {}", id, userId);
        service.delete(id, userId);
    }

    public List<MealWithExceed> getAll() {
        int userId = AuthorizedUser.id();
        log.info("getAll for User {}", userId);

        //System.out.println("yeeeeeeeeee");

        return MealsUtil.getWithExceeded(service.getAll(userId), AuthorizedUser.getCaloriesPerDay());
    }

    public Meal create(Meal meal) {
        int userId = AuthorizedUser.id();
        if (userId==200000) return null;
        checkNew(meal);
        log.info("create {} for User {}", meal, userId);
        return service.create(meal, userId);
    }

    public void update(Meal meal, int id) {
        int userId = AuthorizedUser.id();
        if (userId==200000) return;
        assureIdConsistent(meal, id);
        log.info("update {} for User {}", meal, userId);
        service.update(meal, userId);
    }

    public List<MealWithExceed> getType(String type) {
        int userId = AuthorizedUser.id();
        log.info("getType"+type+"for User {}", userId);
        List<MealWithExceed> meall = MealsUtil.getWithExceeded(service.getAll(userId), AuthorizedUser.getCaloriesPerDay());
        List<MealWithExceed> meallReall = new ArrayList<MealWithExceed>();
       // Integer fullPriceOfAll = 0;

        for (MealWithExceed mwe:meall)
        {
            if (mwe.getType1().contains(type))
            {
                meallReall.add(mwe);
              //  fullPriceOfAll=fullPriceOfAll+mwe.getCena()*mwe.getKolvo();
            }
        }

       // for (MealWithExceed mwe:meallReall)
         //   mwe.setFullPriceOfAll(fullPriceOfAll);

        return meallReall;
    }

    public List<MealWithExceed> getBezCeni() {
        int userId = AuthorizedUser.id();
        log.info("getBezCeni for User {}", userId);
        List<MealWithExceed> meall = MealsUtil.getWithExceeded(service.getAll(userId), AuthorizedUser.getCaloriesPerDay());
        List<MealWithExceed> meallReall = new ArrayList<MealWithExceed>();


        for (MealWithExceed mwe:meall)
        {


            if (mwe.getCena() == 0)
            {
                meallReall.add(mwe);


            }
        }
        return meallReall;
    }




    /**
     * <ol>Filter separately
     *   <li>by date</li>
     *   <li>by time for every date</li>
     * </ol>
     */
    public List<MealWithExceed> getBetween(LocalDate startDate, LocalTime startTime, LocalDate endDate, LocalTime endTime) {
        int userId = AuthorizedUser.id();
        log.info("getBetween dates({} - {}) time({} - {}) for User {}", startDate, endDate, startTime, endTime, userId);

        return MealsUtil.getFilteredWithExceeded(
                service.getBetweenDates(
                        startDate != null ? startDate : DateTimeUtil.MIN_DATE,
                        endDate != null ? endDate : DateTimeUtil.MAX_DATE, userId),
                startTime != null ? startTime : LocalTime.MIN,
                endTime != null ? endTime : LocalTime.MAX,
                AuthorizedUser.getCaloriesPerDay()
        );
    }
}

/*
    public List<MealWithExceed> getSetevoe() {
        int userId = AuthorizedUser.id();
        log.info("getSetevoe for User {}", userId);
        List<MealWithExceed> meall = MealsUtil.getWithExceeded(service.getAll(userId), AuthorizedUser.getCaloriesPerDay());
        List<MealWithExceed> meallReall = new ArrayList<MealWithExceed>();

        for (MealWithExceed mwe:meall)
        {
            if (mwe.getType1().contains("Сетевое"))
            {
                meallReall.add(mwe);
            }
        }

        System.out.println("hello, adding done, objects added = " + meallReall.size());

        return meallReall;
    }

    public List<MealWithExceed> getSantex() {
        int userId = AuthorizedUser.id();
        log.info("getSetevoe for User {}", userId);
        List<MealWithExceed> meall = MealsUtil.getWithExceeded(service.getAll(userId), AuthorizedUser.getCaloriesPerDay());
        List<MealWithExceed> meallReall = new ArrayList<MealWithExceed>();

        for (MealWithExceed mwe:meall)
        {
            if (mwe.getType1().contains("Сантех"))
            {
                meallReall.add(mwe);
            }
        }

        System.out.println("hello, adding done, objects added = " + meallReall.size());

        return meallReall;
    }
    */
