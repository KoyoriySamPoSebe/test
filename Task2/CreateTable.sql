DROP TABLE IF EXISTS season_player_club, players, seasons, clubs CASCADE;

CREATE TABLE clubs (
    id SERIAL PRIMARY KEY,
    name_ru VARCHAR(255) NOT NULL,
    name_en VARCHAR(255) NOT NULL,
    city_ru VARCHAR(255) NOT NULL,
    city_en VARCHAR(255) NOT NULL
);

CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    full_name_ru VARCHAR(255) NOT NULL,
    full_name_en VARCHAR(255) NOT NULL,
    weight INTEGER,
    height INTEGER,
    jersey_number INTEGER
);

CREATE TABLE season_player_club (
    id SERIAL PRIMARY KEY,
    season_id INTEGER NOT NULL REFERENCES seasons(id),
    player_id INTEGER NOT NULL REFERENCES players(id),
    club_id INTEGER NOT NULL REFERENCES clubs(id)
);

INSERT INTO clubs (name_ru, name_en, city_ru, city_en) VALUES
    ('Динамо', 'Dynamo', 'Москва', 'Moscow'),
    ('Спартак', 'Spartak', 'Санкт-Петербург', 'Saint Petersburg'),
    ('Зенит', 'Zenit', 'Казань', 'Kazan');

INSERT INTO seasons (name) VALUES
    ('2022/2023'),
    ('2023/2024');

INSERT INTO players (full_name_ru, full_name_en, weight, height, jersey_number) VALUES
    ('Иван Иванов', 'Ivan Ivanov', 80, 180, 9),
    ('Пётр Петров', 'Petr Petrov', 75, 175, 7),
    ('Сергей Смирнов', 'Sergey Smirnov', 85, 185, 5),
    ('Алексей Алексеев', 'Alexey Alekseev', 90, 190, 11),
    ('Дмитрий Дмитриев', 'Dmitry Dmitriev', 78, 178, 10);

INSERT INTO season_player_club (season_id, player_id, club_id) VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 3),
    (2, 1, 3),
    (2, 4, 1),
    (2, 5, 2);

