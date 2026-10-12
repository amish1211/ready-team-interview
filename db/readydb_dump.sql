--
-- PostgreSQL database dump
--

\restrict jgPGzzVSdCWUTEueVkL8mK6AXa3vdxRjmqJMEMyae5ZYJAXINqYHaJkhlzR0xc3

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.companies (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    address text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.companies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.companies_id_seq OWNED BY public.companies.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    company_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: companies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies ALTER COLUMN id SET DEFAULT nextval('public.companies_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: companies; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.companies (id, name, address, created_at, updated_at) FROM stdin;
1	Acme Corp	12 MG Road, Bengaluru, Karnataka 560001	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
2	Globex Industries	45 Nariman Point, Mumbai, Maharashtra 400021	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
3	Initech	8 Connaught Place, New Delhi 110001	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
4	Umbrella Systems	221 Park Street, Kolkata, West Bengal 700016	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
5	Stark Solutions	19 Anna Salai, Chennai, Tamil Nadu 600002	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
6	Wayne Enterprises	77 Banjara Hills, Hyderabad, Telangana 500034	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
7	Hooli Technologies	5 Hinjewadi Phase 1, Pune, Maharashtra 411057	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
8	Soylent Foods	31 CG Road, Ahmedabad, Gujarat 380009	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
9	Wonka Confectionery	9 Civil Lines, Jaipur, Rajasthan 302006	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
10	Cyberdyne Labs	64 Sector 62, Noida, Uttar Pradesh 201301	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
11	Tyrell Robotics	23 Gachibowli, Hyderabad, Telangana 500032	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
12	Vandelay Imports	102 Mundra Port Road, Kutch, Gujarat 370421	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
13	Pied Piper Inc	14 Koregaon Park, Pune, Maharashtra 411001	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
14	Aperture Science	56 Sector 17, Chandigarh 160017	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
15	Massive Dynamic	3 Ring Road, Surat, Gujarat 395002	2026-10-12 14:38:22.152656	2026-10-12 14:38:22.152656
16	Ready team	Australia	2026-10-12 10:24:55.721765	2026-10-12 10:24:55.721765
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, company_id, created_at, updated_at) FROM stdin;
1	Aarav Sharma	aarav.sharma@acme.com	1	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
2	Priya Patel	priya.patel@globex.com	2	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
3	Rohan Mehta	rohan.mehta@initech.com	3	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
4	Ananya Iyer	ananya.iyer@umbrella.com	4	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
5	Vikram Singh	vikram.singh@stark.com	5	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
6	Neha Gupta	neha.gupta@wayne.com	6	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
7	Karan Joshi	karan.joshi@hooli.com	7	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
8	Isha Reddy	isha.reddy@soylent.com	8	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
9	Arjun Nair	arjun.nair@wonka.com	9	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
10	Meera Desai	meera.desai@cyberdyne.com	10	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
11	Siddharth Rao	siddharth.rao@tyrell.com	11	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
12	Divya Kapoor	divya.kapoor@vandelay.com	12	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
13	Rahul Verma	rahul.verma@piedpiper.com	13	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
14	Kavya Menon	kavya.menon@aperture.com	14	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
15	Aditya Shah	aditya.shah@massive.com	15	2026-10-12 14:42:37.72927	2026-10-12 14:42:37.72927
16	Test User	test.user@acme.com	1	2026-10-12 11:29:45.920781	2026-10-12 11:29:45.920781
\.


--
-- Name: companies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.companies_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 16, true);


--
-- Name: companies companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users fk_company; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_company FOREIGN KEY (company_id) REFERENCES public.companies(id);


--
-- PostgreSQL database dump complete
--

\unrestrict jgPGzzVSdCWUTEueVkL8mK6AXa3vdxRjmqJMEMyae5ZYJAXINqYHaJkhlzR0xc3

