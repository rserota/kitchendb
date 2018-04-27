--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: dish; Type: TABLE; Schema: public; Owner: raphael
--

CREATE TABLE public.dish (
    id integer NOT NULL,
    name character varying(99) NOT NULL,
    description character varying(999) NOT NULL
);


ALTER TABLE public.dish OWNER TO raphael;

--
-- Name: dish_id_seq; Type: SEQUENCE; Schema: public; Owner: raphael
--

CREATE SEQUENCE public.dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dish_id_seq OWNER TO raphael;

--
-- Name: dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raphael
--

ALTER SEQUENCE public.dish_id_seq OWNED BY public.dish.id;


--
-- Name: ingredient; Type: TABLE; Schema: public; Owner: raphael
--

CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character varying(99) NOT NULL,
    description character varying(999) NOT NULL
);


ALTER TABLE public.ingredient OWNER TO raphael;

--
-- Name: ingredient_dish; Type: TABLE; Schema: public; Owner: raphael
--

CREATE TABLE public.ingredient_dish (
    id integer NOT NULL,
    ingredient_id integer,
    dish_id integer
);


ALTER TABLE public.ingredient_dish OWNER TO raphael;

--
-- Name: ingredient_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: raphael
--

CREATE SEQUENCE public.ingredient_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_dish_id_seq OWNER TO raphael;

--
-- Name: ingredient_dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raphael
--

ALTER SEQUENCE public.ingredient_dish_id_seq OWNED BY public.ingredient_dish.id;


--
-- Name: ingredient_id_seq; Type: SEQUENCE; Schema: public; Owner: raphael
--

CREATE SEQUENCE public.ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredient_id_seq OWNER TO raphael;

--
-- Name: ingredient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raphael
--

ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: raphael
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(99) NOT NULL,
    description character varying(999) NOT NULL
);


ALTER TABLE public.menu OWNER TO raphael;

--
-- Name: menu_dish; Type: TABLE; Schema: public; Owner: raphael
--

CREATE TABLE public.menu_dish (
    id integer NOT NULL,
    menu_id integer,
    dish_id integer
);


ALTER TABLE public.menu_dish OWNER TO raphael;

--
-- Name: menu_dish_id_seq; Type: SEQUENCE; Schema: public; Owner: raphael
--

CREATE SEQUENCE public.menu_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_dish_id_seq OWNER TO raphael;

--
-- Name: menu_dish_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raphael
--

ALTER SEQUENCE public.menu_dish_id_seq OWNED BY public.menu_dish.id;


--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: raphael
--

CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO raphael;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raphael
--

ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;


--
-- Name: dish id; Type: DEFAULT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.dish ALTER COLUMN id SET DEFAULT nextval('public.dish_id_seq'::regclass);


--
-- Name: ingredient id; Type: DEFAULT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);


--
-- Name: ingredient_dish id; Type: DEFAULT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient_dish ALTER COLUMN id SET DEFAULT nextval('public.ingredient_dish_id_seq'::regclass);


--
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);


--
-- Name: menu_dish id; Type: DEFAULT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu_dish ALTER COLUMN id SET DEFAULT nextval('public.menu_dish_id_seq'::regclass);


--
-- Data for Name: dish; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.dish (id, name, description) FROM stdin;
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.ingredient (id, name, description) FROM stdin;
\.


--
-- Data for Name: ingredient_dish; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.ingredient_dish (id, ingredient_id, dish_id) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.menu (id, name, description) FROM stdin;
\.


--
-- Data for Name: menu_dish; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.menu_dish (id, menu_id, dish_id) FROM stdin;
\.


--
-- Name: dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.dish_id_seq', 1, false);


--
-- Name: ingredient_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.ingredient_dish_id_seq', 1, false);


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 1, false);


--
-- Name: menu_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.menu_dish_id_seq', 1, false);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.menu_id_seq', 1, false);


--
-- Name: dish dish_description_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_description_key UNIQUE (description);


--
-- Name: dish dish_name_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_name_key UNIQUE (name);


--
-- Name: dish dish_pkey; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id);


--
-- Name: ingredient ingredient_description_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_description_key UNIQUE (description);


--
-- Name: ingredient_dish ingredient_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient_dish
    ADD CONSTRAINT ingredient_dish_pkey PRIMARY KEY (id);


--
-- Name: ingredient ingredient_name_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_name_key UNIQUE (name);


--
-- Name: ingredient ingredient_pkey; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);


--
-- Name: menu menu_description_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_description_key UNIQUE (description);


--
-- Name: menu_dish menu_dish_pkey; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_pkey PRIMARY KEY (id);


--
-- Name: menu menu_name_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_name_key UNIQUE (name);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: ingredient_dish ingredient_dish_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient_dish
    ADD CONSTRAINT ingredient_dish_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dish(id);


--
-- Name: ingredient_dish ingredient_dish_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.ingredient_dish
    ADD CONSTRAINT ingredient_dish_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);


--
-- Name: menu_dish menu_dish_dish_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dish(id);


--
-- Name: menu_dish menu_dish_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menu(id);


--
-- PostgreSQL database dump complete
--

