--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Ubuntu 15.13-1.pgdg24.04+1)
-- Dumped by pg_dump version 15.13 (Ubuntu 15.13-1.pgdg24.04+1)

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
-- Name: clubs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clubs (
    id integer NOT NULL,
    name_ru character varying(255) NOT NULL,
    name_en character varying(255) NOT NULL,
    city_ru character varying(255) NOT NULL,
    city_en character varying(255) NOT NULL
);


--
-- Name: clubs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clubs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clubs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clubs_id_seq OWNED BY public.clubs.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    id integer NOT NULL,
    full_name_ru character varying(255) NOT NULL,
    full_name_en character varying(255) NOT NULL,
    weight integer,
    height integer,
    jersey_number integer
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: season_player_club; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.season_player_club (
    id integer NOT NULL,
    season_id integer NOT NULL,
    player_id integer NOT NULL,
    club_id integer NOT NULL
);


--
-- Name: season_player_club_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.season_player_club_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: season_player_club_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.season_player_club_id_seq OWNED BY public.season_player_club.id;


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.seasons (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.seasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.seasons_id_seq OWNED BY public.seasons.id;


--
-- Name: clubs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clubs ALTER COLUMN id SET DEFAULT nextval('public.clubs_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: season_player_club id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season_player_club ALTER COLUMN id SET DEFAULT nextval('public.season_player_club_id_seq'::regclass);


--
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seasons ALTER COLUMN id SET DEFAULT nextval('public.seasons_id_seq'::regclass);


--
-- Data for Name: clubs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.clubs (id, name_ru, name_en, city_ru, city_en) FROM stdin;
1	Динамо	Dynamo	Москва	Moscow
2	Спартак	Spartak	Санкт-Петербург	Saint Petersburg
3	Зенит	Zenit	Казань	Kazan
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.players (id, full_name_ru, full_name_en, weight, height, jersey_number) FROM stdin;
1	Иван Иванов	Ivan Ivanov	80	180	9
2	Пётр Петров	Petr Petrov	75	175	7
3	Сергей Смирнов	Sergey Smirnov	85	185	5
4	Алексей Алексеев	Alexey Alekseev	90	190	11
5	Дмитрий Дмитриев	Dmitry Dmitriev	78	178	10
\.


--
-- Data for Name: season_player_club; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.season_player_club (id, season_id, player_id, club_id) FROM stdin;
1	1	1	1
2	1	2	2
3	1	3	3
4	2	1	3
5	2	4	1
6	2	5	2
\.


--
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.seasons (id, name) FROM stdin;
1	2022/2023
2	2023/2024
\.


--
-- Name: clubs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.clubs_id_seq', 3, true);


--
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.players_id_seq', 5, true);


--
-- Name: season_player_club_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.season_player_club_id_seq', 6, true);


--
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.seasons_id_seq', 2, true);


--
-- Name: clubs clubs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clubs
    ADD CONSTRAINT clubs_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: season_player_club season_player_club_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season_player_club
    ADD CONSTRAINT season_player_club_pkey PRIMARY KEY (id);


--
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: season_player_club season_player_club_club_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season_player_club
    ADD CONSTRAINT season_player_club_club_id_fkey FOREIGN KEY (club_id) REFERENCES public.clubs(id);


--
-- Name: season_player_club season_player_club_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season_player_club
    ADD CONSTRAINT season_player_club_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: season_player_club season_player_club_season_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.season_player_club
    ADD CONSTRAINT season_player_club_season_id_fkey FOREIGN KEY (season_id) REFERENCES public.seasons(id);


--
-- PostgreSQL database dump complete
--

