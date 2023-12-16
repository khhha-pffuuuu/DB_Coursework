INSERT INTO players (player_nickname, player_rank, player_points, player_youtube) VALUES 
    ('Thnnder', 3, 3887.2, TRUE),
    ('SnowBallerr', 4, 3501.5, TRUE),
    ('Doggie', 9, 2815.4, TRUE),
    ('[PRIME] Amity', 5, 3497.7, TRUE),
    ('[PRIME] cobrablitz', 6, 3245.0, TRUE),
    ('wPopoff', 11, 2678.8, FALSE),
    ('[PRIME] Bigthunder556', 12, 2634.0, TRUE),
    ('Laniakea', 13, 2563.1, FALSE),
    ('[AUF] Zoink', 1, 6350.1, TRUE),
    ('Trick', 2, 4508.4, TRUE),
    ('Baeru', 14, 2542.6, TRUE),
    ('Tunax', 15, 2523.2, FALSE),
    ('Taiago', 7, 3048.9, FALSE),
    ('[PRIME] skzyl', 8, 2954.3, TRUE),
    ('Cursed', 10, 2801.0, TRUE);

INSERT INTO levels (level_name, level_place, level_rate, level_likes_amount) VALUES 
    ('Avernus', 1, 1, 14809),
    ('Sakupen Circles', 7, 1, 128165),
    ('Codependence', 8, 2, 7142),
    ('Abyss of Darkness', 5, 1, 66136),
    ('Kyouki', 6, 2, 16445),
    ('Firework', 9, 1, 102093),
    ('The Lightning Rod', 13, 2, 1620),
    ('Deimos', 14, 2, 6303),
    ('poocubed', 15, 2, 7311),
    ('Acheron', 2, 2, 103424),
    ('Silent clubstep', 3, 1, 71027),
    ('Slaughterhouse', 4, 1, 626561),
    ('KOCMOC', 10, 3, 68911),
    ('MINUSdry', 11, 2, 3325),
    ('LIMBO', 12, 3, 118680);

INSERT INTO records (level_id, player_id, player_record, player_attempts) VALUES 
    (10, 3, 100, 121749),
    (10, 10, 100, 71380),
    (11, 9, 100, 22199),
    (11, 15, 54, 67334),
    (12, 6, 100, 134985),
    (6, 11, 57, 27891),
    (13, 10, 98, 45679),
    (15, 7, 67, 33715),
    (9, 9, 100, 14872);

INSERT INTO songs (level_id, song_name, song_time) VALUES 
    (10, '{DJ-N} Thermodynamix', 163),
    (6, 'NK - Classical VIP', 195),
    (13, 'SLEEPING HUMMAINGBIRD - LONDON', 106),
    (15, 'NH - Isolation', 199),
    (12, 'Tennobyte - Fly away', 170),
    (1, 'F-777 Dark Dragon Fire', 156),
    (4, 'Death Note Dubstep [SB]', 241),
    (7, 'Beauty In Chaos', 168),
    (5, 'Creo - Crazy', 217);
