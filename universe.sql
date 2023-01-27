--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: distance; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.distance (
    distance_id integer NOT NULL,
    name character varying(40) NOT NULL,
    number_of_moon integer,
    distance_from_sun_miles numeric,
    planet_id integer
);


ALTER TABLE public.distance OWNER TO freecodecamp;

--
-- Name: distance_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.distance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.distance_id_seq OWNER TO freecodecamp;

--
-- Name: distance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.distance_id_seq OWNED BY public.distance.distance_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    galaxy_types text,
    star_id integer
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
    name character varying(40) NOT NULL,
    is_spherical boolean,
    on_earth text,
    not_on_earth text
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
    name character varying(40) NOT NULL,
    has_life boolean,
    number_of_stars integer,
    distance_from_earth numeric,
    planet_types text,
    description text,
    moon_id integer
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
    name character varying(40),
    description text,
    planet_id integer,
    many_galaxy boolean NOT NULL
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
-- Name: distance distance_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance ALTER COLUMN distance_id SET DEFAULT nextval('public.distance_id_seq'::regclass);


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
-- Data for Name: distance; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.distance VALUES (3, 'Mercury', 0, 35000000, 1);
INSERT INTO public.distance VALUES (4, 'Earth', 1, 93000000, 2);
INSERT INTO public.distance VALUES (5, 'Jupiter', 80, 484000000, 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Spiral', 13, 25000000, 'Hot', 5);
INSERT INTO public.galaxy VALUES (2, 'Elliptical', 3, 125000000, 'Hot', 4);
INSERT INTO public.galaxy VALUES (3, 'SO', 36, 1695000000, 'Cold', 1);
INSERT INTO public.galaxy VALUES (4, 'SQ', 963, 169000000, 'Hot', 6);
INSERT INTO public.galaxy VALUES (5, 'SB', 96, 1000000, 'Hot', 2);
INSERT INTO public.galaxy VALUES (6, 'SA', 9, 189000000, 'Hot', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Full Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Wolf Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'New Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Waxing Crescent Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'First Quarter Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Waxing Gibbous Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Waning Gibbous Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Last Quarter Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Waning Crescent Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Third Quarter Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Gibbous Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Waning Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Worm Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Pink Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Flower Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Strawberry Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Buck Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Sturgeon Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Full Corn Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Hunters Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Beaver Moon', true, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Cold Moon', false, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'No Moon', false, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, 58000000, 'Terrestial', 'Mercury is the smallest planet in the solar system', 23);
INSERT INTO public.planet VALUES (2, 'Earth', true, 1, 0, 'Terrestial', 'Earth is ellipsoid with a circumference of about 40,000 km', 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 80, 445000000, 'Gas Giant', 'Jupiter is the fifth planet from the sun and the largest in the solar system', 15);
INSERT INTO public.planet VALUES (4, 'Jupiter', false, 80, 445000000, 'Gas Giant', 'Jupiter is the fifth planet from the sun and the largest in the solar system', 14);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 80, 445000000, 'Gas Giant', 'Jupiter is the fifth planet from the sun and the largest in the solar system', 21);
INSERT INTO public.planet VALUES (6, 'Jupiter', false, 80, 445000000, 'Gas Giant', 'Jupiter is the fifth planet from the sun and the largest in the solar system', 19);
INSERT INTO public.planet VALUES (7, 'Jupiter', false, 80, 445000000, 'Gas Giant', 'Jupiter is the fifth planet from the sun and the largest in the solar system', 12);
INSERT INTO public.planet VALUES (8, 'Jupiter', false, 80, 445000000, 'Gas Giant', 'Jupiter is the fifth planet from the sun and the largest in the solar system', 2);
INSERT INTO public.planet VALUES (9, 'Saturn', false, 83, 1737000000, 'Neptune-Like', 'Neptune is the eight planet from the sun and the farthest known planet in the solar system', 2);
INSERT INTO public.planet VALUES (10, 'Saturn', false, 83, 1737000000, 'Neptune-Like', 'Neptune is the eight planet from the sun and the farthest known planet in the solar system', 6);
INSERT INTO public.planet VALUES (11, 'Saturn', false, 83, 1737000000, 'Neptune-Like', 'Neptune is the eight planet from the sun and the farthest known planet in the solar system', 8);
INSERT INTO public.planet VALUES (12, 'Saturn', false, 83, 1737000000, 'Neptune-Like', 'Neptune is the eight planet from the sun and the farthest known planet in the solar system', 3);
INSERT INTO public.planet VALUES (13, 'Saturn', false, 83, 1737000000, 'Neptune-Like', 'Neptune is the eight planet from the sun and the farthest known planet in the solar system', 9);
INSERT INTO public.planet VALUES (14, 'Saturn', false, 83, 1737000000, 'Neptune-Like', 'Neptune is the eight planet from the sun and the farthest known planet in the solar system', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'The name comes from the Greek word meaning glowing', 2, true);
INSERT INTO public.star VALUES (2, 'Sirius', 'The name comes from the Greek word meaning glowing', 3, true);
INSERT INTO public.star VALUES (3, 'Situla', 'The name comes from the latin meaning bucket or water jar', 2, false);
INSERT INTO public.star VALUES (4, 'Spica', 'The name comes from the latin meaning virgin ear of grain', 10, true);
INSERT INTO public.star VALUES (5, 'Spica', 'The name comes from the latin meaning virgin ear of grain', 9, true);
INSERT INTO public.star VALUES (6, 'Spica', 'The name comes from the latin meaning virgin ear of grain', 7, true);


--
-- Name: distance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.distance_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: distance distance_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_pkey PRIMARY KEY (distance_id);


--
-- Name: distance distance_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_unq UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unq UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unq UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unq UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unq UNIQUE (star_id);


--
-- Name: distance distance_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.distance
    ADD CONSTRAINT distance_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

