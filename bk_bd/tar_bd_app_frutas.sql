toc.dat                                                                                             0000600 0004000 0002000 00000006654 14716660110 0014454 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP            *            
    |         
   app_frutas    9.2.3    9.5.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                    1262    1277952 
   app_frutas    DATABASE        CREATE DATABASE app_frutas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE app_frutas;
             postgres    false                     2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false                    0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    6                    0    0    public    ACL     ’   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    6                     3079    11727    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false                    0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1         ͺ            1259    1277955    frutas    TABLE     ς   CREATE TABLE frutas (
    id_fruta integer NOT NULL,
    nombre character varying(100),
    created_date timestamp with time zone DEFAULT now() NOT NULL,
    deleted_date timestamp with time zone,
    updated_date timestamp with time zone
);
    DROP TABLE public.frutas;
       public         postgres    false    6         ©            1259    1277953    frutas_id_frutas_seq    SEQUENCE     v   CREATE SEQUENCE frutas_id_frutas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.frutas_id_frutas_seq;
       public       postgres    false    170    6                    0    0    frutas_id_frutas_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE frutas_id_frutas_seq OWNED BY frutas.id_fruta;
            public       postgres    false    169                    2604    1277958    id_fruta    DEFAULT     e   ALTER TABLE ONLY frutas ALTER COLUMN id_fruta SET DEFAULT nextval('frutas_id_frutas_seq'::regclass);
 >   ALTER TABLE public.frutas ALTER COLUMN id_fruta DROP DEFAULT;
       public       postgres    false    169    170    170                   0    1277955    frutas 
   TABLE DATA                     public       postgres    false    170       1921.dat            0    0    frutas_id_frutas_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('frutas_id_frutas_seq', 12, true);
            public       postgres    false    169                    2606    1277961    id_fruta_p_key 
   CONSTRAINT     R   ALTER TABLE ONLY frutas
    ADD CONSTRAINT id_fruta_p_key PRIMARY KEY (id_fruta);
 ?   ALTER TABLE ONLY public.frutas DROP CONSTRAINT id_fruta_p_key;
       public         postgres    false    170    170                                                                                            1921.dat                                                                                            0000600 0004000 0002000 00000001752 14716660110 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        INSERT INTO frutas (id_fruta, nombre, created_date, deleted_date, updated_date) VALUES (1, 'Manzana', '2024-11-15 15:49:39.831-08', NULL, NULL);
INSERT INTO frutas (id_fruta, nombre, created_date, deleted_date, updated_date) VALUES (2, 'Banana', '2024-11-15 15:50:00.091-08', NULL, NULL);
INSERT INTO frutas (id_fruta, nombre, created_date, deleted_date, updated_date) VALUES (9, 'Mandarina V2', '2024-11-15 16:52:47.831-08', '2024-11-15 16:59:54.081-08', '2024-11-15 16:58:44.799-08');
INSERT INTO frutas (id_fruta, nombre, created_date, deleted_date, updated_date) VALUES (11, 'SandΓ­a', '2024-11-15 20:43:57.427-08', '2024-11-15 21:20:54.225-08', NULL);
INSERT INTO frutas (id_fruta, nombre, created_date, deleted_date, updated_date) VALUES (10, 'Pera V2', '2024-11-15 20:43:34.055-08', '2024-11-15 21:26:52.987-08', '2024-11-15 21:26:47.319-08');
INSERT INTO frutas (id_fruta, nombre, created_date, deleted_date, updated_date) VALUES (12, 'Nueva Pera', '2024-11-15 21:26:59.894-08', NULL, NULL);


                      restore.sql                                                                                         0000600 0004000 0002000 00000005711 14716660110 0015372 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.3
-- Dumped by pg_dump version 9.5.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.frutas DROP CONSTRAINT id_fruta_p_key;
ALTER TABLE public.frutas ALTER COLUMN id_fruta DROP DEFAULT;
DROP SEQUENCE public.frutas_id_frutas_seq;
DROP TABLE public.frutas;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: frutas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE frutas (
    id_fruta integer NOT NULL,
    nombre character varying(100),
    created_date timestamp with time zone DEFAULT now() NOT NULL,
    deleted_date timestamp with time zone,
    updated_date timestamp with time zone
);


ALTER TABLE frutas OWNER TO postgres;

--
-- Name: frutas_id_frutas_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE frutas_id_frutas_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE frutas_id_frutas_seq OWNER TO postgres;

--
-- Name: frutas_id_frutas_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE frutas_id_frutas_seq OWNED BY frutas.id_fruta;


--
-- Name: id_fruta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY frutas ALTER COLUMN id_fruta SET DEFAULT nextval('frutas_id_frutas_seq'::regclass);


--
-- Data for Name: frutas; Type: TABLE DATA; Schema: public; Owner: postgres
--

\i $$PATH$$/1921.dat

--
-- Name: frutas_id_frutas_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('frutas_id_frutas_seq', 12, true);


--
-- Name: id_fruta_p_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY frutas
    ADD CONSTRAINT id_fruta_p_key PRIMARY KEY (id_fruta);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       