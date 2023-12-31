--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: levels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.levels (
    level_id integer NOT NULL,
    level_name character(20) NOT NULL,
    level_place numeric(2,0) NOT NULL,
    level_rate numeric(1,0) NOT NULL,
    level_likes_amount integer NOT NULL,
    CONSTRAINT levels_level_rate_check CHECK (((level_rate >= (1)::numeric) AND (level_rate <= (3)::numeric)))
);


ALTER TABLE public.levels OWNER TO postgres;

--
-- Name: levels_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.levels_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.levels_level_id_seq OWNER TO postgres;

--
-- Name: levels_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.levels_level_id_seq OWNED BY public.levels.level_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    player_nickname character(21) NOT NULL,
    player_rank integer NOT NULL,
    player_points numeric(5,1) NOT NULL,
    player_youtube boolean DEFAULT false NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.players_player_id_seq OWNER TO postgres;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.records (
    record_id integer NOT NULL,
    level_id integer NOT NULL,
    player_id integer NOT NULL,
    player_record numeric(3,0) NOT NULL,
    player_attempts integer NOT NULL,
    CONSTRAINT records_player_attempts_check CHECK ((player_attempts >= 1)),
    CONSTRAINT records_player_record_check CHECK ((player_record >= (50)::numeric))
);


ALTER TABLE public.records OWNER TO postgres;

--
-- Name: records_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.records_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.records_record_id_seq OWNER TO postgres;

--
-- Name: records_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.records_record_id_seq OWNED BY public.records.record_id;


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    level_id integer,
    song_name character(30) NOT NULL,
    song_time integer NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_song_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_song_id_seq OWNER TO postgres;

--
-- Name: songs_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_song_id_seq OWNED BY public.songs.song_id;


--
-- Name: levels level_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels ALTER COLUMN level_id SET DEFAULT nextval('public.levels_level_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Name: records record_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.records ALTER COLUMN record_id SET DEFAULT nextval('public.records_record_id_seq'::regclass);


--
-- Name: songs song_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN song_id SET DEFAULT nextval('public.songs_song_id_seq'::regclass);


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.levels (level_id, level_name, level_place, level_rate, level_likes_amount) FROM stdin;
1	Avernus             	1	1	14809
2	Sakupen Circles     	7	1	128165
3	Codependence        	8	2	7142
4	Abyss of Darkness   	5	1	66136
5	Kyouki              	6	2	16445
6	Firework            	9	1	102093
7	The Lightning Rod   	13	2	1620
8	Deimos              	14	2	6303
9	poocubed            	15	2	7311
10	Acheron             	2	2	103424
11	Silent clubstep     	3	1	71027
12	Slaughterhouse      	4	1	626561
13	KOCMOC              	10	3	68911
14	MINUSdry            	11	2	3325
15	LIMBO               	12	3	118680
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (player_id, player_nickname, player_rank, player_points, player_youtube) FROM stdin;
1	Thnnder              	3	3887.2	t
2	SnowBallerr          	4	3501.5	t
3	Doggie               	9	2815.4	t
4	[PRIME] Amity        	5	3497.7	t
5	[PRIME] cobrablitz   	6	3245.0	t
6	wPopoff              	11	2678.8	f
7	[PRIME] Bigthunder556	12	2634.0	t
8	Laniakea             	13	2563.1	f
9	[AUF] Zoink          	1	6350.1	t
10	Trick                	2	4508.4	t
11	Baeru                	14	2542.6	t
12	Tunax                	15	2523.2	f
13	Taiago               	7	3048.9	f
14	[PRIME] skzyl        	8	2954.3	t
15	Cursed               	10	2801.0	t
\.


--
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.records (record_id, level_id, player_id, player_record, player_attempts) FROM stdin;
1	10	3	100	121749
2	10	10	100	71380
3	11	9	100	22199
4	11	15	54	67334
5	12	6	100	134985
6	6	11	57	27891
7	13	10	98	45679
8	15	7	67	33715
9	9	9	100	14872
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.songs (song_id, level_id, song_name, song_time) FROM stdin;
1	10	{DJ-N} Thermodynamix          	163
2	6	NK - Classical VIP            	195
3	13	SLEEPING HUMMAINGBIRD - LONDON	106
4	15	NH - Isolation                	199
5	12	Tennobyte - Fly away          	170
6	1	F-777 Dark Dragon Fire        	156
7	4	Death Note Dubstep [SB]       	241
8	7	Beauty In Chaos               	168
9	5	Creo - Crazy                  	217
\.


--
-- Name: levels_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.levels_level_id_seq', 15, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_player_id_seq', 15, true);


--
-- Name: records_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.records_record_id_seq', 9, true);


--
-- Name: songs_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_song_id_seq', 9, true);


--
-- Name: levels levels_level_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_level_name_key UNIQUE (level_name);


--
-- Name: levels levels_level_place_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_level_place_key UNIQUE (level_place);


--
-- Name: levels levels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (level_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: players players_player_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_player_nickname_key UNIQUE (player_nickname);


--
-- Name: players players_player_rank_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_player_rank_key UNIQUE (player_rank);


--
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (record_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- Name: songs songs_song_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_song_name_key UNIQUE (song_name);


--
-- Name: level_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX level_id_index ON public.levels USING btree (level_id);


--
-- Name: levels_level_rate_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX levels_level_rate_index ON public.levels USING btree (level_rate);


--
-- Name: players_player_rank_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX players_player_rank_index ON public.players USING btree (player_rank);


--
-- Name: records_player_attempts_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX records_player_attempts_index ON public.records USING btree (player_attempts);


--
-- Name: songs_song_time_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX songs_song_time_index ON public.songs USING btree (song_time);


--
-- Name: records records_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_level_id_fkey FOREIGN KEY (level_id) REFERENCES public.levels(level_id);


--
-- Name: records records_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- Name: songs songs_level_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_level_id_fkey FOREIGN KEY (level_id) REFERENCES public.levels(level_id);


--
-- PostgreSQL database dump complete
--

