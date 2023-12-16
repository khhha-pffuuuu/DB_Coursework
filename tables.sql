-------------PLAYERS-------------
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY NOT NULL,
    player_nickname CHAR(21) NOT NULL UNIQUE,
    player_rank INT NOT NULL UNIQUE,
    player_points NUMERIC(5, 1) NOT NULL,
    player_youtube BOOLEAN NOT NULL DEFAULT FALSE
);

---------------------------------


-------------LEVELS-------------
CREATE TABLE levels (
    level_id SERIAL PRIMARY KEY NOT NULL,
    level_name CHAR(20) NOT NULL UNIQUE,
    level_place NUMERIC(2) NOT NULL UNIQUE,
    level_rate NUMERIC(1) NOT NULL CHECK (level_rate BETWEEN 1 AND 3),
    level_likes_amount INT NOT NULL
);

CREATE INDEX level_id_index ON levels(level_id);
--------------------------------


-------------RECORDS-------------
CREATE TABLE records (
    record_id SERIAL PRIMARY KEY NOT NULL,
    level_id INT NOT NULL,
    player_id INT NOT NULL,
    player_record NUMERIC(3) NOT NULL CHECK (player_record >= 50),
    player_attempts INT NOT NULL CHECK (player_attempts >= 1),

    FOREIGN KEY(level_id) REFERENCES levels(level_id),
    FOREIGN KEY(player_id) REFERENCES players(player_id)
);
---------------------------------

-------------SONGS-------------
CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY NOT NULL,
    level_id INT,
    song_name CHAR(30) NOT NULL UNIQUE,
    song_time INT NOT NULL,

    FOREIGN KEY(level_id) REFERENCES levels(level_id)
);

-------------------------------


CREATE INDEX levels_level_rate_index ON levels(level_rate);
CREATE INDEX players_player_rank_index ON players(player_rank);
CREATE INDEX songs_song_time_index ON songs(song_time);
CREATE INDEX records_player_attempts_index ON records(player_attempts);
