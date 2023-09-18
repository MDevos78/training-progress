--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Debian 15.4-1.pgdg120+1)
-- Dumped by pg_dump version 15.4 (Debian 15.4-1.pgdg120+1)

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
-- Name: exercice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exercice (
    id_exercice integer NOT NULL,
    weight character varying(255) NOT NULL,
    exercice_date date NOT NULL,
    remark character varying(100),
    id_machines integer NOT NULL,
    id_users integer NOT NULL
);


ALTER TABLE public.exercice OWNER TO postgres;

--
-- Name: exercice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.exercice ALTER COLUMN id_exercice ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.exercice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: machines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.machines (
    id_machines integer NOT NULL,
    machine_name character varying(45) NOT NULL,
    target_muscle character varying(45) NOT NULL
);


ALTER TABLE public.machines OWNER TO postgres;

--
-- Name: machines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.machines ALTER COLUMN id_machines ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id_users integer NOT NULL,
    firstname character varying(45) NOT NULL,
    name character varying(45) NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password bytea NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id_users ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: exercice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exercice (id_exercice, weight, exercice_date, remark, id_machines, id_users) FROM stdin;
13	18 kg	2023-09-14	Test	3	25
14	107 kg	2023-09-14	Test	2	25
15	113 kg	2023-09-16	Test	1	25
16	107 kg	2023-09-19	Test	3	25
17	23 kg	2023-09-14	ff	3	25
18	23 kg	2023-09-18	Test	3	25
19	23 kg	2023-09-15	Test	3	25
20	23 kg	2023-09-20	gg	3	25
21	113 kg	2023-09-20	fccc	1	25
22	23 kg	2023-09-20	mm	2	25
23	14 kg	2023-09-27	dsf	2	25
\.


--
-- Data for Name: machines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.machines (id_machines, machine_name, target_muscle) FROM stdin;
1	CHEST PRESS	PECTORAUX
2	SEATED DIP	TRICEPS BRACHIAL
3	ABDOMINAL	ABDOMINAUX
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id_users, firstname, name, email, username, password) FROM stdin;
25	Michael	Devos	mdevos.mld@gmail.com	migdev	\\x2432622431322463563937552e5a6c4d4459587250794e6a626270676534624a6938736c473530705858395077386a4544704454522e46487944304b
\.


--
-- Name: exercice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercice_id_seq', 23, true);


--
-- Name: machines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.machines_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- Name: exercice exercice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT exercice_pkey PRIMARY KEY (id_exercice);


--
-- Name: machines machines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY (id_machines);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_users);


--
-- Name: exercice exercice_id_machines_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT exercice_id_machines_fkey FOREIGN KEY (id_machines) REFERENCES public.machines(id_machines);


--
-- Name: exercice exercice_id_users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT exercice_id_users_fkey FOREIGN KEY (id_users) REFERENCES public.users(id_users) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

