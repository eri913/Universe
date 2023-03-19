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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    constellation text,
    shape character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_galaxy_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_galaxy_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_galaxy_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    planet_id integer NOT NULL,
    distance_from_planet_mi_km numeric(10,0),
    discovered_by character varying(20)
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean,
    has_life boolean,
    size integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_planet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_planet_seq OWNER TO freecodecamp;

--
-- Name: planet_id_planet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_planet_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type character varying(30),
    asterism character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: type_of_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_of_planet (
    type_of_planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    has_ring boolean
);


ALTER TABLE public.type_of_planet OWNER TO freecodecamp;

--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_of_planet_type_of_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_planet_type_of_planet_id_seq OWNER TO freecodecamp;

--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_of_planet_type_of_planet_id_seq OWNED BY public.type_of_planet.type_of_planet_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_galaxy_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_planet_seq'::regclass);


--
-- Name: type_of_planet type_of_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet ALTER COLUMN type_of_planet_id SET DEFAULT nextval('public.type_of_planet_type_of_planet_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Adromeda galaxy', NULL, 'Adromeda', 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Antenae galaxies', NULL, 'Corvus', NULL);
INSERT INTO public.galaxy VALUES (3, 'Backward galaxy', NULL, 'Centaurus', NULL);
INSERT INTO public.galaxy VALUES (4, 'Black eye galaxy', NULL, 'Coma Berenices', NULL);
INSERT INTO public.galaxy VALUES (5, 'Butterfly galaxies', NULL, 'Vigro', NULL);
INSERT INTO public.galaxy VALUES (6, 'Circinus galaxy', NULL, 'Circinus', NULL);
INSERT INTO public.galaxy VALUES (7, 'Milky way', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (6, 'Ariel', 7, 190900, NULL);
INSERT INTO public.moon VALUES (7, 'Oberon', 7, 582600, NULL);
INSERT INTO public.moon VALUES (8, 'Titania', 7, 436000, NULL);
INSERT INTO public.moon VALUES (9, 'Puck', 7, 86004, NULL);
INSERT INTO public.moon VALUES (10, 'Charon', 9, 19640, NULL);
INSERT INTO public.moon VALUES (11, 'Hydra', 9, 64738, NULL);
INSERT INTO public.moon VALUES (12, 'Kerberos', 9, 60000, NULL);
INSERT INTO public.moon VALUES (13, 'Nix', 9, 48694, NULL);
INSERT INTO public.moon VALUES (14, 'Phobos', 4, 3700, NULL);
INSERT INTO public.moon VALUES (15, 'Deimos', 4, 23460, NULL);
INSERT INTO public.moon VALUES (16, 'Atlas', 6, 137640, NULL);
INSERT INTO public.moon VALUES (17, 'Pandora', 6, 142000, NULL);
INSERT INTO public.moon VALUES (18, 'Enceladus', 6, 148000, NULL);
INSERT INTO public.moon VALUES (19, 'Titan', 6, 759000, NULL);
INSERT INTO public.moon VALUES (20, 'Umbriel', 7, 266000, NULL);
INSERT INTO public.moon VALUES (1, 'Selene', 3, 239406, NULL);
INSERT INTO public.moon VALUES (2, 'Io', 5, 262665, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 418888, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 666441, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1170000, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, false, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', true, false, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, false, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', true, false, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', true, false, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', false, false, NULL);
INSERT INTO public.planet VALUES (10, 'Ceres', true, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Planet_X', true, false, NULL);
INSERT INTO public.planet VALUES (12, 'Haumea', false, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 'Manus Catenata', 'B8', 'Fredericks glory', 1);
INSERT INTO public.star VALUES (3, 'Hadar', 'B1', 'Centauri', 3);
INSERT INTO public.star VALUES (1, 'Sirrah', 'A0p class', 'Pegasus', 1);
INSERT INTO public.star VALUES (2, 'Mirach', 'M0', 'girdle', 1);
INSERT INTO public.star VALUES (5, 'Mimosa', 'B2V', 'Crux', 2);
INSERT INTO public.star VALUES (6, 'Nunki', 'B2.5V', 'Sagittarius', 7);


--
-- Data for Name: type_of_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_of_planet VALUES (1, 'Gas Giant', false);
INSERT INTO public.type_of_planet VALUES (2, 'Terrestrial', false);
INSERT INTO public.type_of_planet VALUES (3, 'Neptune-like', false);


--
-- Name: galaxy_id_galaxy_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_galaxy_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_id_planet_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_planet_seq', 1, false);


--
-- Name: type_of_planet_type_of_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_of_planet_type_of_planet_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy id_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT id_unq UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: type_of_planet type_of_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet
    ADD CONSTRAINT type_of_planet_pkey PRIMARY KEY (type_of_planet_id);


--
-- Name: moon unq_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unq_moon UNIQUE (moon_id);


--
-- Name: planet unq_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unq_planet UNIQUE (planet_id);


--
-- Name: star unq_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unq_star UNIQUE (star_id, name);


--
-- Name: type_of_planet unq_type; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_planet
    ADD CONSTRAINT unq_type UNIQUE (type_of_planet_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

