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


        //Вопрос ошибки по idшкам (Meal должно быть новым, чтобы пройти в новую таблицу получается)

       //if (userId != 200001)
        if (!meal.isNew() && get(meal.getId(), userId) == null) {
            return null;
        }

       // else meal.setId(meal.getId()+1000000);

        if (userId != 200001)
        meal.setUser(crudUserRepository.getOne(100000));
        else {meal.setId(meal.getId() + 1000000);
            meal.setUser(crudUserRepository.getOne(200001));
        }

       //DEFAULT OPTIONS SETUP
        if (meal.getType1() == null)
            meal.setType1("");
        if (meal.getEdizmereniya() == null)
            meal.setEdizmereniya("");
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
        if (meal.getPolka() == null)
            meal.setPolka("o");
        //(K)DEFAULT OPTIONS SETUP

        return crudMealRepository.save(meal);
    }

    @Override
    public boolean delete(int id, int userId)
    {


        Meal transfer = getWithUser(id, 100000);
        //transfer.getUser().setId(200001);
        //Там же до трёх миллиардов всё норм
        //Сохранение в таблицу по удалению



        //Вставка две строчки на удаление если удаление и ниже две строчки из трансфера
        /*if (userId != 200001) {
            transfer.setId(null);
            transfer.getUser().setId(200001);
            crudMealRepository.save(transfer);
        } */

        transfer.setId(null);
        transfer.getUser().setId(200001);
        crudMealRepository.save(transfer);

        //Вставка две строчки на удаление если удаление и ниже две строчки из трансфера




        //Автоматика по ID
        //crudMealRepository.save(transfer);



        //Вставка две строчки на удаление если удаление и выше две строчки из трансфера
       /* if (userId == 200001)
            return crudMealRepository.delete(id, 200001) != 0;*/
        //Вставка две строчки на удаление если удаление и выше две строчки из трансфера




        //возможна ошибка в параллельных таблицах
        return crudMealRepository.delete(id, 100000) != 0;

    }

    @Override
    public Meal get(int id, int userId) {

        //Мб прокатит тк единичного вызова товара нет
        Meal meal = crudMealRepository.findOne(id);
        return meal != null && meal.getUser().getId() == 100000 ? meal : null;
    }

    @Override
    public List<Meal> getAll(int userId) {
            if (userId!=200001)
        return crudMealRepository.getAll(100000);
            else return crudMealRepository.getAll(200001);
    }

    @Override
    public List<Meal> getBetween(LocalDateTime startDate, LocalDateTime endDate, int userId) {
        return crudMealRepository.getBetween(startDate, endDate, 100000);
    }

    @Override
    public Meal getWithUser(int id, int userId) {
        return crudMealRepository.getWithUser(id, 100000);
    }
}


//Временная заменя в самой проге

//По гет олу

// for (Meal richi : noRichi)
// {

//   if (richi.getPrimechanie().contains("ричи"))
//   {
//System.out.println("1");
//     richi.setDescription(richi.getDescription()+"ричи");
//     String primechChange = "" + richi.getPrimechanie().replace("ричи","");
//System.out.println(primechChange);
//     richi.setPrimechanie(primechChange);

//  }

//  }