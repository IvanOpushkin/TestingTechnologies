DROP TABLE IF EXISTS user_gays;

--TRUNCATE meals;
--INSERT INTO public.meals (id, user_id, date_time, description, calories, cod, naimenovanie, type1, type2, proizvoditel, edizmereniya, kolvo, cena, primechanie, articul, picture, polka) VALUES (301355, 100000, '2018-02-01 23:46:20.747000', 'o', 'o', '18397', 'Клемма EkinoxeNX ноль 30', 'Электромонтажное ', '', 'legrand', 'шт', 13, 500, '', '601293', '18397osnova', '1A1');

--INSERT INTO public.meals (id, user_id, date_time, description, calories, cod, naimenovanie, type1, type2, proizvoditel, edizmereniya, kolvo, cena, primechanie, articul, picture, polka) VALUES (100708, 200001, '2018-01-16 06:31:07.846000', 'o', 'o', '521', 'Кабель ВВГнг-LS 5х50', 'Кабельная продукция', '', '', 'Метры', 400, 1254, 'Космодром', '', '521osnova', 'Уличная площадка 2');

--update meals set cod = '0' || cod WHERE description='ричи';

--update mytable set name = 'a' || name, age = 'b' || age;
--SELECT sum(kolvo*cena) FROM meals WHERE type1='Сетевое Оборудование'


--Очистка таблицы
--TRUNCATE meals;

--Добавление колонки в рабочую таблицу
--ALTER TABLE meals ADD COLUMN polka TEXT;

--INSERT INTO public.meals (id, user_id, date_time, description, calories, cod, naimenovanie, type1, type2, proizvoditel, edizmereniya, kolvo, cena, primechanie, articul, picture, polka) VALUES (999716, 100000, '2018-01-28 05:18:18.306000', 'o', 'o', 49078, 'Модуль памяти 4GB 1rx4 PC3L-10600R-9 Kit', 'Компьютерное оборудование', '', '', 'шт', 5, 2800, '5+1 анд', '604504-B21', '49078osnova', '32C1');
