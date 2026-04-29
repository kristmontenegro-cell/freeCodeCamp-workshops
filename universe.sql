--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    app_magnitude numeric(4,2),
    abs_magnitude integer,
    distance integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    app_magnitude numeric(4,2) NOT NULL,
    abs_magnitude numeric(4,2) NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    app_magnitude numeric(4,2) NOT NULL,
    habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    app_magnitude numeric(4,2) NOT NULL,
    planets integer NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: traveller; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.traveller (
    traveller_id integer NOT NULL,
    name character varying(20) NOT NULL,
    alive boolean,
    nickname text NOT NULL,
    moon_id integer
);


ALTER TABLE public.traveller OWNER TO freecodecamp;

--
-- Name: traveller_traveller_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.traveller_traveller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.traveller_traveller_id_seq OWNER TO freecodecamp;

--
-- Name: traveller_traveller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.traveller_traveller_id_seq OWNED BY public.traveller.traveller_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: traveller traveller_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveller ALTER COLUMN traveller_id SET DEFAULT nextval('public.traveller_traveller_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 20.20, -21, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 3.44, -22, 765);
INSERT INTO public.galaxy VALUES (3, 'Messier 32', 8.08, NULL, 763);
INSERT INTO public.galaxy VALUES (4, 'Messier 110', 8.50, -17, 825);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 5.72, NULL, 883);
INSERT INTO public.galaxy VALUES (6, 'LMC', 0.13, NULL, 50);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 5.23, -2.50, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 5.23, -4.20, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 5.20, -4.20, 4);
INSERT INTO public.moon VALUES (4, 'Io', 4.23, 5.50, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 5.24, 1.20, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 6.21, -8.50, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', -4.20, 9.50, 5);
INSERT INTO public.moon VALUES (8, 'Mimas', 5.23, -5.20, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1.20, 0.50, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', -5.20, 5.50, 6);
INSERT INTO public.moon VALUES (11, 'Dione', -5.50, 4.10, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', -7.40, 1.20, 6);
INSERT INTO public.moon VALUES (13, 'Titan', 3.60, -0.20, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', 7.20, -9.20, 6);
INSERT INTO public.moon VALUES (15, 'Bianca', 8.50, -4.20, 7);
INSERT INTO public.moon VALUES (16, 'Cressida', -0.20, -1.20, 7);
INSERT INTO public.moon VALUES (17, 'Desdemona', -8.20, 5.20, 7);
INSERT INTO public.moon VALUES (18, 'Juliet', 2.50, -4.20, 7);
INSERT INTO public.moon VALUES (19, 'Portia', -4.20, 4.50, 7);
INSERT INTO public.moon VALUES (20, 'Rosalind', -4.20, 0.20, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', -2.48, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', -4.92, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 0.00, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', -2.01, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', -2.70, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 0.46, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 5.30, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 6.90, false, 1);
INSERT INTO public.planet VALUES (9, 'AEgir', 0.00, false, 5);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 0.00, false, 2);
INSERT INTO public.planet VALUES (11, 'Lalande 21185 b', 0.00, false, 4);
INSERT INTO public.planet VALUES (12, 'Acheron', 5.60, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', -26.74, 8, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 10.43, 2, 1);
INSERT INTO public.star VALUES (3, 'Barnards Star', 9.51, 4, 1);
INSERT INTO public.star VALUES (4, 'Lalande 21185', 7.52, 2, 1);
INSERT INTO public.star VALUES (5, 'Epsilon Eridani', 3.73, 1, 1);
INSERT INTO public.star VALUES (6, 'Zeta Reticuli', 5.22, 1, 1);


--
-- Data for Name: traveller; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.traveller VALUES (1, 'John McJohn', true, 'Fili', 1);
INSERT INTO public.traveller VALUES (2, 'Guttenbrod', false, 'Bread', 3);
INSERT INTO public.traveller VALUES (3, 'Martin Fly', true, 'Juju', 5);
INSERT INTO public.traveller VALUES (4, 'Huhjer', true, 'Julik', 6);
INSERT INTO public.traveller VALUES (5, 'Juan Salvador', false, 'Salva', 19);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: traveller_traveller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.traveller_traveller_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: traveller traveller_nickname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveller
    ADD CONSTRAINT traveller_nickname_key UNIQUE (nickname);


--
-- Name: traveller traveller_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveller
    ADD CONSTRAINT traveller_pkey PRIMARY KEY (traveller_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: traveller traveller_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.traveller
    ADD CONSTRAINT traveller_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- PostgreSQL database dump complete
--

