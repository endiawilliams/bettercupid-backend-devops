--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: endiawilliams
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO endiawilliams;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: endiawilliams
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    "user_a_Id" integer,
    "user_b_Id" integer,
    content text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.messages OWNER TO endiawilliams;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: endiawilliams
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO endiawilliams;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: endiawilliams
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: endiawilliams
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    "userId" integer,
    display_name character varying(255),
    gender character varying(255),
    image character varying(255),
    city character varying(255),
    state character varying(255),
    about_me text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.profiles OWNER TO endiawilliams;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: endiawilliams
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO endiawilliams;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: endiawilliams
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: endiawilliams
--

CREATE TABLE public.relationships (
    id integer NOT NULL,
    "userId" integer,
    recipient integer,
    status integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.relationships OWNER TO endiawilliams;

--
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: endiawilliams
--

CREATE SEQUENCE public.relationships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relationships_id_seq OWNER TO endiawilliams;

--
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: endiawilliams
--

ALTER SEQUENCE public.relationships_id_seq OWNED BY public.relationships.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: endiawilliams
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password character varying(255),
    birthday timestamp with time zone NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO endiawilliams;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: endiawilliams
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO endiawilliams;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: endiawilliams
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: relationships id; Type: DEFAULT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.relationships ALTER COLUMN id SET DEFAULT nextval('public.relationships_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: endiawilliams
--

COPY public."SequelizeMeta" (name) FROM stdin;
20201105230047-create-user.js
20201117232145-create-relationship.js
20201118003132-create-profile.js
20201118005715-create-message.js
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: endiawilliams
--

COPY public.messages (id, "user_a_Id", "user_b_Id", content, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: endiawilliams
--

COPY public.profiles (id, "userId", display_name, gender, image, city, state, about_me, "createdAt", "updatedAt") FROM stdin;
15	15	Guy Fieri	male	https://food.fnr.sndimg.com/content/dam/images/food/editorial/talent/guy-fieri/FN-TalentAvatar-Guy-Fieri-colorblock.jpg.rend.hgtvcom.616.616.suffix/1531174403377.jpeg	Santa Rosa	California	I love food.	2020-11-29 21:32:36.174-06	2020-11-30 03:19:21.143-06
12	12	Emma Watson	female	https://static.independent.co.uk/s3fs-public/thumbnails/image/2016/02/19/23/web-emma-watson-getty.jpg	London	England	I like sandwiches.	2020-11-25 19:02:02.252-06	2020-11-30 03:55:03.3-06
13	13	Guy McDude	male	https://cdn.shopify.com/s/files/1/0045/5104/9304/t/27/assets/AC_ECOM_SITE_2020_REFRESH_1_INDEX_M2_THUMBS-V2-1.jpg?v=8913815134086573859	Los Angeles	California	I like tomatoes.	2020-11-25 19:02:55.063-06	2020-11-30 03:57:03.313-06
14	14	Rachel McPerson	female	https://cdn.lifehack.org/wp-content/uploads/2015/01/alpha-woman-1024x768.jpeg	Gary	Indiana	I like strawberries.	2020-11-29 03:46:05.743-06	2020-11-30 04:04:15.566-06
\.


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: endiawilliams
--

COPY public.relationships (id, "userId", recipient, status, "createdAt", "updatedAt") FROM stdin;
12	12	13	0	2020-11-28 20:55:52.486-06	2020-11-28 20:55:52.486-06
20	13	14	0	2020-11-29 17:17:51.516-06	2020-11-29 17:17:51.516-06
22	13	12	0	2020-11-29 17:17:56.656-06	2020-11-29 17:17:56.656-06
24	12	14	0	2020-11-29 17:18:16.201-06	2020-11-29 17:18:16.201-06
27	15	12	0	2020-11-30 03:20:40.304-06	2020-11-30 03:20:40.304-06
28	14	13	0	2020-11-30 03:49:00.8-06	2020-11-30 03:49:00.8-06
29	15	13	0	2020-11-30 03:52:25.483-06	2020-11-30 03:52:25.483-06
35	14	15	0	2020-11-30 13:53:17.72-06	2020-11-30 13:53:17.72-06
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: endiawilliams
--

COPY public.users (id, name, email, password, birthday, "createdAt", "updatedAt") FROM stdin;
12	Test Jones	test2@test.com	$2b$12$Bfxy8/6BVgZj3FBdXkPuTeJ33lbP8cz3oGZZtBOXtcJmkztbTHB1C	1994-01-20 18:00:00-06	2020-11-25 19:02:01.932-06	2020-11-25 19:02:01.932-06
13	Test Brown	test3@test.com	$2b$12$Kd.OeobD/zXggFL2bAslMOHOVpKlnesx.idae80.uai0qf6MpFIsu	1994-01-20 18:00:00-06	2020-11-25 19:02:54.729-06	2020-11-25 19:02:54.729-06
15	Test Anderson	test6@test.com	$2b$12$YWCSgATWj4KmHow3FCUWkOvLOzwT8VcQJAdTxDBmPGqqgdoplfx..	1997-01-20 18:00:00-06	2020-11-29 21:32:35.84-06	2020-11-29 21:32:35.84-06
\.


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: endiawilliams
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: endiawilliams
--

SELECT pg_catalog.setval('public.profiles_id_seq', 15, true);


--
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: endiawilliams
--

SELECT pg_catalog.setval('public.relationships_id_seq', 35, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: endiawilliams
--

SELECT pg_catalog.setval('public.users_id_seq', 15, true);


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: endiawilliams
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

