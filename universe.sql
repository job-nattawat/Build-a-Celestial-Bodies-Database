--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    has_life boolean,
    visible_from_earth boolean,
    discovery_year numeric
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
    name character varying(255) NOT NULL,
    is_inhabitable boolean,
    has_water boolean,
    planet_id integer,
    discovery_year integer
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
    name character varying(255) NOT NULL,
    has_atmosphere boolean,
    star_id integer,
    orbit_period numeric NOT NULL,
    mass integer NOT NULL
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
-- Name: spacecraft; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spacecraft (
    spacecraft_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mission_details text,
    manufacturer character varying(255) NOT NULL,
    is_active boolean,
    launch_year integer
);


ALTER TABLE public.spacecraft OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spacecraft_spacecraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spacecraft_spacecraft_id_seq OWNER TO freecodecamp;

--
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spacecraft_spacecraft_id_seq OWNED BY public.spacecraft.spacecraft_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    size integer NOT NULL,
    is_night_visible boolean,
    galaxy_id integer,
    age numeric NOT NULL
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
-- Name: spacecraft spacecraft_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft ALTER COLUMN spacecraft_id SET DEFAULT nextval('public.spacecraft_spacecraft_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, true, true, 1700);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, false, true, 964);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, false, false, 1850);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 60000, false, true, 1773);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 70000, false, true, 1781);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 50000, false, true, 1767);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, false, 1, 1610);
INSERT INTO public.moon VALUES (2, 'Deimos', false, false, 4, 1877);
INSERT INTO public.moon VALUES (3, 'Phobos', false, false, 4, 1877);
INSERT INTO public.moon VALUES (4, 'Io', false, false, 5, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', false, true, 5, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, false, 5, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', false, false, 5, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', false, true, 6, 1655);
INSERT INTO public.moon VALUES (9, 'Rhea', false, false, 6, 1672);
INSERT INTO public.moon VALUES (10, 'Iapetus', false, false, 6, 1671);
INSERT INTO public.moon VALUES (11, 'Dione', false, false, 6, 1684);
INSERT INTO public.moon VALUES (12, 'Tethys', false, false, 6, 1684);
INSERT INTO public.moon VALUES (13, 'Enceladus', false, true, 6, 1789);
INSERT INTO public.moon VALUES (14, 'Mimas', false, false, 6, 1789);
INSERT INTO public.moon VALUES (15, 'Oberon', false, false, 7, 1787);
INSERT INTO public.moon VALUES (16, 'Titania', false, false, 7, 1787);
INSERT INTO public.moon VALUES (17, 'Umbriel', false, false, 7, 1851);
INSERT INTO public.moon VALUES (18, 'Ariel', false, false, 7, 1851);
INSERT INTO public.moon VALUES (19, 'Miranda', false, false, 7, 1948);
INSERT INTO public.moon VALUES (20, 'Triton', false, true, 8, 1846);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 1, 88, 0);
INSERT INTO public.planet VALUES (2, 'Venus', true, 1, 225, 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 1, 365, 1);
INSERT INTO public.planet VALUES (4, 'Mars', true, 1, 687, 0);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, 1, 4331, 318);
INSERT INTO public.planet VALUES (6, 'Saturn', true, 1, 10747, 95);
INSERT INTO public.planet VALUES (7, 'Uranus', true, 1, 30589, 15);
INSERT INTO public.planet VALUES (8, 'Neptune', true, 1, 59800, 17);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 1, 90560, 0);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', true, 2, 290, 14);
INSERT INTO public.planet VALUES (11, 'Kepler-69c', true, 2, 242, 8);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', true, 3, 11.186, 0);


--
-- Data for Name: spacecraft; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spacecraft VALUES (1, 'Voyager 1', 'Voyager 1 is a space probe launched by NASA on September 5, 1977.', 'NASA', false, 1977);
INSERT INTO public.spacecraft VALUES (2, 'Voyager 2', 'Part of the Voyager program to study the outer Solar System.', 'NASA', false, 1977);
INSERT INTO public.spacecraft VALUES (3, 'Hubble Space Telescope', 'The HST is a space telescope that was launched into low Earth orbit in 1990.', 'NASA', true, 1990);
INSERT INTO public.spacecraft VALUES (4, 'Cassini–Huygens', 'A Flagship-class NASA–ESA–ASI robotic spacecraft.', 'NASA', false, 1997);
INSERT INTO public.spacecraft VALUES (5, 'New Horizons', 'A space probe that was launched as a part of NASA''s New Frontiers program.', 'NASA', true, 2006);
INSERT INTO public.spacecraft VALUES (6, 'Juno', 'A NASA space probe orbiting the planet Jupiter.', 'NASA', true, 2011);
INSERT INTO public.spacecraft VALUES (7, 'Curiosity rover', 'A car-sized rover designed to explore the crater Gale on Mars.', 'NASA', true, 2011);
INSERT INTO public.spacecraft VALUES (8, 'Parker Solar Probe', 'A NASA space probe designed to study the outer corona of the Sun.', 'NASA', true, 2018);
INSERT INTO public.spacecraft VALUES (9, 'James Webb Space Telescope', 'Space telescope developed in coordination among NASA, ESA, and CSA.', 'NASA', true, 2021);
INSERT INTO public.spacecraft VALUES (10, 'Perseverance rover', 'A rover designed to explore the crater Jezero on Mars.', 'NASA', true, 2020);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, true, 1, 4.603);
INSERT INTO public.star VALUES (2, 'Sirius', 2, true, 1, 0.242);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, true, 1, 4.367);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 0, false, 1, 4.853);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 887, false, 1, 8.0);
INSERT INTO public.star VALUES (6, 'Rigel', 78, true, 1, 7.5);


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
-- Name: spacecraft_spacecraft_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spacecraft_spacecraft_id_seq', 10, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: spacecraft spacecraft_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_name_key UNIQUE (name);


--
-- Name: spacecraft spacecraft_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spacecraft
    ADD CONSTRAINT spacecraft_pkey PRIMARY KEY (spacecraft_id);


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
-- PostgreSQL database dump complete
--

