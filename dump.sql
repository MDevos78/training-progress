--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg120+1)
-- Dumped by pg_dump version 15.3 (Debian 15.3-1.pgdg120+1)

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
    "idExercice" integer NOT NULL,
    weight integer NOT NULL,
    "exerciceDate" date NOT NULL,
    remark character varying(100)
);


ALTER TABLE public.exercice OWNER TO postgres;

--
-- Name: exercice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.exercice ALTER COLUMN "idExercice" ADD GENERATED ALWAYS AS IDENTITY (
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
    "idMachines" integer NOT NULL,
    "machineName" character varying(45) NOT NULL,
    "targetMuscle" character varying(45) NOT NULL
);


ALTER TABLE public.machines OWNER TO postgres;

--
-- Name: machines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.machines ALTER COLUMN "idMachines" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: training; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.training (
    "idExercice" integer NOT NULL,
    "idUsers" integer NOT NULL,
    "idMachines" integer NOT NULL
);


ALTER TABLE public.training OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "idUsers" integer NOT NULL,
    create_time date NOT NULL,
    firstname character varying(45) NOT NULL,
    lastname character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN "idUsers" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);



--
-- Name: exercice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.exercice_id_seq', 1, false);


--
-- Name: machines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.machines_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: exercice exercice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exercice
    ADD CONSTRAINT exercice_pkey PRIMARY KEY ("idExercice");


--
-- Name: machines machines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.machines
    ADD CONSTRAINT machines_pkey PRIMARY KEY ("idMachines");


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("idUsers");


--
-- Name: training idexercice; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training
    ADD CONSTRAINT idexercice FOREIGN KEY ("idExercice") REFERENCES public.exercice("idExercice") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: training idmachines; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training
    ADD CONSTRAINT idmachines FOREIGN KEY ("idMachines") REFERENCES public.machines("idMachines") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: training idusers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.training
    ADD CONSTRAINT idusers FOREIGN KEY ("idUsers") REFERENCES public.users("idUsers") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

