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
    description character varying(999) NOT NULL,
    user_id integer,
    preparation character varying(9999)
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
-- Name: kdb_user; Type: TABLE; Schema: public; Owner: raphael
--

CREATE TABLE public.kdb_user (
    id integer NOT NULL,
    username character varying(99) NOT NULL,
    email character varying(99) NOT NULL,
    password character varying(999) NOT NULL
);


ALTER TABLE public.kdb_user OWNER TO raphael;

--
-- Name: kdb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: raphael
--

CREATE SEQUENCE public.kdb_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kdb_user_id_seq OWNER TO raphael;

--
-- Name: kdb_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: raphael
--

ALTER SEQUENCE public.kdb_user_id_seq OWNED BY public.kdb_user.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: raphael
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(99) NOT NULL,
    description character varying(999) NOT NULL,
    user_id integer
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
-- Name: kdb_user id; Type: DEFAULT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.kdb_user ALTER COLUMN id SET DEFAULT nextval('public.kdb_user_id_seq'::regclass);


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

COPY public.dish (id, name, description, user_id, preparation) FROM stdin;
23	Lasagna	Just like grandma used to make.\n\nServes 3 to 5.	3	\N
29	Lasagna	Just like grandma used to make.\n\nServes 3 to 25.	3	\N
30	noodle tower	enormous!\n\n\n\nwow.	3	\N
31	Jon's bonbons	very sweet!	5	\N
32	pudding	it's just the best!	3	Weave noodles. Apply cheese. Heat and serve.
\.


--
-- Data for Name: ingredient; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.ingredient (id, name, description) FROM stdin;
13	four gallons of shredded cheese	...
14	pallet of noodles	...
15	extra noodles	...
16	lots of chocolate	...
17	vat of sugar	...
18	pud	...
19	ding	...
\.


--
-- Data for Name: ingredient_dish; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.ingredient_dish (id, ingredient_id, dish_id) FROM stdin;
16	13	23
17	14	23
18	13	29
19	14	29
20	13	30
21	14	30
22	15	30
23	16	31
24	17	31
25	18	32
26	19	32
\.


--
-- Data for Name: kdb_user; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.kdb_user (id, username, email, password) FROM stdin;
3	jan	jan.smith@gmail.com	$2a$11$qn3aMM.2kFb3gciLslaCDOD6.P.AufXccyIapwLekRr6AQmZ17YwC
5	jon	jon.smith@gmail.com	$2a$11$wQET4jLRlvBE0bK4NqxBbe0KutIh87SSSJYjLARwnO4vA9P4sBbWC
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.menu (id, name, description, user_id) FROM stdin;
1	Four course feast	yum yum yum... yum.	3
\.


--
-- Data for Name: menu_dish; Type: TABLE DATA; Schema: public; Owner: raphael
--

COPY public.menu_dish (id, menu_id, dish_id) FROM stdin;
\.


--
-- Name: dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.dish_id_seq', 32, true);


--
-- Name: ingredient_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.ingredient_dish_id_seq', 26, true);


--
-- Name: ingredient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.ingredient_id_seq', 19, true);


--
-- Name: kdb_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.kdb_user_id_seq', 5, true);


--
-- Name: menu_dish_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.menu_dish_id_seq', 1, false);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: raphael
--

SELECT pg_catalog.setval('public.menu_id_seq', 3, true);


--
-- Name: dish dish_description_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_description_key UNIQUE (description);


--
-- Name: dish dish_pkey; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id);


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
-- Name: kdb_user kdb_user_email_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.kdb_user
    ADD CONSTRAINT kdb_user_email_key UNIQUE (email);


--
-- Name: kdb_user kdb_user_password_key; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.kdb_user
    ADD CONSTRAINT kdb_user_password_key UNIQUE (password);


--
-- Name: kdb_user kdb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.kdb_user
    ADD CONSTRAINT kdb_user_pkey PRIMARY KEY (id);


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
-- Name: dish dish_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.kdb_user(id);


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
-- Name: menu menu_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: raphael
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.kdb_user(id);


--
-- PostgreSQL database dump complete
--

