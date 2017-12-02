DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS global_seq;

CREATE SEQUENCE global_seq START 100000;
--КОД 200000 чтобы не баговалось по фотке

CREATE TABLE users
(
  id               INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  name             VARCHAR                  NOT NULL,
  email            VARCHAR                  NOT NULL,
  password         VARCHAR                  NOT NULL,
  registered       TIMESTAMP DEFAULT now()  NOT NULL,
  enabled          BOOL DEFAULT TRUE        NOT NULL,
  calories_per_day INTEGER DEFAULT 2000     NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON users (email);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role    VARCHAR,
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

CREATE TABLE meals (
  id          INTEGER PRIMARY KEY DEFAULT nextval('global_seq'),
  user_id     INTEGER   NOT NULL,
  date_time   TIMESTAMP NOT NULL,
  description TEXT      NOT NULL,
-- меняем калорис их нет в базовой версии
  cod         INT  DEFAULT 0 NOT NULL,
  naimenovanie   TEXT   DEFAULT 'o',

  -- calories    INT       NOT NULL,

  type1       TEXT      DEFAULT 'o',
  type2       TEXT      DEFAULT 'o',

  --Также есть ошибка с базой данных по Дате, если повторяется,
  -- тк по еде в одно время одна еда у нас будет (?)

  --5 текст 2 инт


  proizvoditel   TEXT   DEFAULT 'o',
  edizmereniya   TEXT   DEFAULT 'o',
  kolvo       INT       DEFAULT 0,
  cena        INT       DEFAULT 0,
  primechanie TEXT      DEFAULT 'o',
  articul     TEXT     DEFAULT 'o',
  picture     TEXT      DEFAULT 'o',


  /*   cod         INT       DEFAULT 0, начальный был без нот нулл посмотрим

    proizvoditel   TEXT   DEFAULT 'o',
    edizmereniya   TEXT   DEFAULT 'o',
    kolvo       INT       DEFAULT 0,
    cena        INT       DEFAULT 0,
    primechanie TEXT      DEFAULT 'o',
    articul     TEXT     DEFAULT 'o',
    picture     TEXT      DEFAULT 'o',

    */



  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
CREATE UNIQUE INDEX meals_unique_user_datetime_idx ON meals (user_id, date_time)