package ru.javawebinar.topjava.repository.datajpa;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import ru.javawebinar.topjava.model.Meal;
import ru.javawebinar.topjava.repository.MealRepository;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

import static java.time.LocalDateTime.of;

@Repository
public class DataJpaMealRepositoryImpl implements MealRepository {

    @Autowired
    private CrudMealRepository crudMealRepository;

    @Autowired
    private CrudUserRepository crudUserRepository;

    @Override
    @Transactional
    public Meal save(Meal meal, int userId) {
        if (!meal.isNew() && get(meal.getId(), userId) == null) {
            return null;
        }
        meal.setUser(crudUserRepository.getOne(userId));

        if (meal.getDateTime() == null)
        meal.setDateTime(LocalDateTime.now());
        if (meal.getCod() == null)
        meal.setCod(0);
        if (meal.getCena() == null)
        meal.setCena(0);
        if (meal.getKolvo() == null)
        meal.setKolvo(0);
        if (meal.getCalories() == null)
        meal.setCalories("o");
        if (meal.getDescription() == null)
        meal.setDescription("o");
        return crudMealRepository.save(meal);
    }

    @Override
    public boolean delete(int id, int userId) {
        return crudMealRepository.delete(id, userId) != 0;
    }

    @Override
    public Meal get(int id, int userId) {
        Meal meal = crudMealRepository.findOne(id);
        return meal != null && meal.getUser().getId() == userId ? meal : null;
    }

    @Override
    public List<Meal> getAll(int userId) {
        List<Meal> noRichi = crudMealRepository.getAll(userId);

        //Временная заменя в самой проге

        for (Meal richi : noRichi)
        {

            if (richi.getPrimechanie().contains("ричи"))
            {
                //System.out.println("1");
                richi.setDescription(richi.getDescription()+"ричи");
                String primechChange = "" + richi.getPrimechanie().replace("ричи","");
                //System.out.println(primechChange);
                richi.setPrimechanie(primechChange);

            }

        }
        return noRichi;
    }

    @Override
    public List<Meal> getBetween(LocalDateTime startDate, LocalDateTime endDate, int userId) {
        return crudMealRepository.getBetween(startDate, endDate, userId);
    }

    @Override
    public Meal getWithUser(int id, int userId) {
        return crudMealRepository.getWithUser(id, userId);
    }
}
