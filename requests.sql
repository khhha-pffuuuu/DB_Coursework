----ПРОСТЫЕ ЗАПРОСЫ----
/*Вывод всех уровней, имеющих оценку 2 или 3. Сортируем в первую очередь по убыванию оценки, 
затем по убыванию лайков.*/
SELECT level_name, level_rate, level_likes_amount FROM levels
WHERE (level_rate = 2 OR level_rate = 3)
ORDER BY level_rate DESC, level_likes_amount DESC;

/*Вывод топ 5 игроков. Сортируем по рангу от 1-ого места.*/
SELECT player_nickname, player_rank FROM players
WHERE player_rank <= 5
ORDER BY player_rank;

/*Вывод песен, время которых больше или равно двум минутам и (строго) меньше трех.*/
SELECT song_name, song_time FROM songs
WHERE song_time / 60 = 2
ORDER BY song_name;

/*Выводим айди игроков, количество их пройденных уровней, общее и среднее количество попыток.*/
SELECT player_id, 
    COUNT(level_id) AS levels_count, 
    SUM(player_attempts) AS attempts, 
    ROUND(SUM(player_attempts) / COUNT(level_id), 2) AS avg_attempts 
FROM records
GROUP BY player_id
ORDER BY ROUND(SUM(player_attempts) / COUNT(level_id), 2);
-----------------------



----СРЕДНИЕ ЗАПРОСЫ----
/*Выводим топ 5 игроков по наименьшему количеству попыток.*/
SELECT player_nickname, ROUND(AVG(player_attempts), 0) AS avg_attempts FROM
    players RIGHT JOIN records USING(player_id)
GROUP BY player_nickname
ORDER BY ROUND(AVG(player_attempts), 0)
LIMIT 5;

/*Соединяем таблицы уровней и песен. Выводим только те кортежи, в которых песни длиной от 130 
секунд до 210. Сортируем по убыванию длины песни*/
SELECT level_name, song_name FROM
    levels INNER JOIN songs USING(level_id)
WHERE song_time BETWEEN 130 AND 210 
ORDER BY song_time DESC;

/*Выводим никнейм тех игроков, которые присутствуют в таблице рекордов.*/
SELECT player_nickname, player_points FROM
    players LEFT JOIN records USING(player_id)
WHERE player_attempts IS NULL
ORDER BY player_points DESC;
-----------------------



----СЛОЖНЫЕ ЗАПРОСЫ-----
/*Выводим название уровней, их песни, количество игроков, рекорд которых зафиксирован на уровне 
и у которых есть ютюб канал, и количество лайков на уровне. Сортируем сначала по количеству игроков, 
игравших в уровень, затем по количеству лайков.*/


SELECT level_name, song_name, COUNT(player_id), SUM(level_likes_amount) FROM 
    levels
    RIGHT JOIN records USING(level_id)
    INNER JOIN songs USING(level_id)
WHERE records.player_id IN (
    SELECT player_id FROM players WHERE player_youtube = TRUE
)
GROUP BY level_name, song_name
ORDER BY COUNT(player_id) DESC, SUM(level_likes_amount) DESC;

/*Выводим ник игрока, его рекорд, попытки на уровень и название уровня, длина песни которого больше 
170 секунд.*/


SELECT level_name, player_nickname, player_record, player_attempts FROM
    levels 
    RIGHT JOIN records USING(level_id)
    LEFT JOIN players USING(player_id)
WHERE records.level_id IN (
    SELECT levels.level_id FROM
        levels INNER JOIN songs USinG(level_id)
    WHERE song_time > 170
)
ORDER BY player_record, player_attempts;

/*Выводим ник игрока, название уровня, называние музыки и рекорд игрока на уровне при условии,
что общее количество попыток игроков на всех уровнях больше 100000.*/


SELECT player_nickname, level_name, song_name, player_record FROM
    levels
    RIGHT JOIN records USING(level_id)
    INNER JOIN songs USING(level_id)
    LEFT JOIN players USING(player_id)
WHERE player_nickname IN (
    SELECT player_nickname FROM
        players INNER JOIN records USING(player_id)
    GROUP BY player_nickname HAVING SUM(player_attempts) > 100000
)
ORDER BY player_record DESC, level_name ASC;


-----------------------

SELECT level_name, song_time, 420 / song_time AS music_repeat_times FROM
    levels INNER JOIN songs USING (level_id);

