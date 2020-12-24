--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5
-- Dumped by pg_dump version 12.5

-- Started on 2020-12-23 20:56:13

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

--DROP DATABASE audios;
--
-- TOC entry 3013 (class 1262 OID 17159)
-- Name: audios; Type: DATABASE; Schema: -; Owner: postgres
--

--CREATE DATABASE audios WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_El Salvador.1252' LC_CTYPE = 'Spanish_El Salvador.1252';


ALTER DATABASE audios OWNER TO postgres;

--\connect audios

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
-- TOC entry 213 (class 1259 OID 17235)
-- Name: SistemaAudios_categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SistemaAudios_categoria" (
    "idCategoria" integer NOT NULL,
    nombre character varying(16) NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public."SistemaAudios_categoria" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17233)
-- Name: SistemaAudios_categoria_idCategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SistemaAudios_categoria_idCategoria_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SistemaAudios_categoria_idCategoria_seq" OWNER TO postgres;

--
-- TOC entry 3014 (class 0 OID 0)
-- Dependencies: 212
-- Name: SistemaAudios_categoria_idCategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SistemaAudios_categoria_idCategoria_seq" OWNED BY public."SistemaAudios_categoria"."idCategoria";


--
-- TOC entry 225 (class 1259 OID 17288)
-- Name: SistemaAudios_detallelista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SistemaAudios_detallelista" (
    "idDetalle" integer NOT NULL,
    lista_id integer,
    recurso_id integer
);


ALTER TABLE public."SistemaAudios_detallelista" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17286)
-- Name: SistemaAudios_detallelista_idDetalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SistemaAudios_detallelista_idDetalle_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SistemaAudios_detallelista_idDetalle_seq" OWNER TO postgres;

--
-- TOC entry 3015 (class 0 OID 0)
-- Dependencies: 224
-- Name: SistemaAudios_detallelista_idDetalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SistemaAudios_detallelista_idDetalle_seq" OWNED BY public."SistemaAudios_detallelista"."idDetalle";


--
-- TOC entry 223 (class 1259 OID 17280)
-- Name: SistemaAudios_lista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SistemaAudios_lista" (
    "idLista" integer NOT NULL,
    descripcion character varying(56) NOT NULL,
    tipo boolean NOT NULL,
    usuario_id integer
);


ALTER TABLE public."SistemaAudios_lista" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17278)
-- Name: SistemaAudios_lista_idLista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SistemaAudios_lista_idLista_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SistemaAudios_lista_idLista_seq" OWNER TO postgres;

--
-- TOC entry 3016 (class 0 OID 0)
-- Dependencies: 222
-- Name: SistemaAudios_lista_idLista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SistemaAudios_lista_idLista_seq" OWNED BY public."SistemaAudios_lista"."idLista";


--
-- TOC entry 221 (class 1259 OID 17272)
-- Name: SistemaAudios_recurso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SistemaAudios_recurso" (
    "idRecurso" integer NOT NULL,
    nombre character varying(16) NOT NULL,
    descripcion character varying(56) NOT NULL,
    archivo character varying(150) NOT NULL,
    categoria_id integer,
    usuario_id integer
);


ALTER TABLE public."SistemaAudios_recurso" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17270)
-- Name: SistemaAudios_recurso_idRecurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SistemaAudios_recurso_idRecurso_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SistemaAudios_recurso_idRecurso_seq" OWNER TO postgres;

--
-- TOC entry 3017 (class 0 OID 0)
-- Dependencies: 220
-- Name: SistemaAudios_recurso_idRecurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SistemaAudios_recurso_idRecurso_seq" OWNED BY public."SistemaAudios_recurso"."idRecurso";


--
-- TOC entry 215 (class 1259 OID 17243)
-- Name: SistemaAudios_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SistemaAudios_user" (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    "codigoSeguridad" character varying(20)
);


ALTER TABLE public."SistemaAudios_user" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17256)
-- Name: SistemaAudios_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SistemaAudios_user_groups" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public."SistemaAudios_user_groups" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17254)
-- Name: SistemaAudios_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SistemaAudios_user_groups_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SistemaAudios_user_groups_id_seq" OWNER TO postgres;

--
-- TOC entry 3018 (class 0 OID 0)
-- Dependencies: 216
-- Name: SistemaAudios_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SistemaAudios_user_groups_id_seq" OWNED BY public."SistemaAudios_user_groups".id;


--
-- TOC entry 214 (class 1259 OID 17241)
-- Name: SistemaAudios_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SistemaAudios_user_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SistemaAudios_user_id_seq" OWNER TO postgres;

--
-- TOC entry 3019 (class 0 OID 0)
-- Dependencies: 214
-- Name: SistemaAudios_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SistemaAudios_user_id_seq" OWNED BY public."SistemaAudios_user".id;


--
-- TOC entry 219 (class 1259 OID 17264)
-- Name: SistemaAudios_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SistemaAudios_user_user_permissions" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public."SistemaAudios_user_user_permissions" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17262)
-- Name: SistemaAudios_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SistemaAudios_user_user_permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SistemaAudios_user_user_permissions_id_seq" OWNER TO postgres;

--
-- TOC entry 3020 (class 0 OID 0)
-- Dependencies: 218
-- Name: SistemaAudios_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SistemaAudios_user_user_permissions_id_seq" OWNED BY public."SistemaAudios_user_user_permissions".id;


--
-- TOC entry 209 (class 1259 OID 17191)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17189)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- TOC entry 3021 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 211 (class 1259 OID 17201)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17199)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3022 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 207 (class 1259 OID 17183)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17181)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- TOC entry 3023 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 227 (class 1259 OID 17355)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17353)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- TOC entry 3024 (class 0 OID 0)
-- Dependencies: 226
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 205 (class 1259 OID 17173)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17171)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- TOC entry 3025 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 203 (class 1259 OID 17162)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17160)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3026 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 228 (class 1259 OID 17377)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 2772 (class 2604 OID 17238)
-- Name: SistemaAudios_categoria idCategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_categoria" ALTER COLUMN "idCategoria" SET DEFAULT nextval('public."SistemaAudios_categoria_idCategoria_seq"'::regclass);


--
-- TOC entry 2778 (class 2604 OID 17291)
-- Name: SistemaAudios_detallelista idDetalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_detallelista" ALTER COLUMN "idDetalle" SET DEFAULT nextval('public."SistemaAudios_detallelista_idDetalle_seq"'::regclass);


--
-- TOC entry 2777 (class 2604 OID 17283)
-- Name: SistemaAudios_lista idLista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_lista" ALTER COLUMN "idLista" SET DEFAULT nextval('public."SistemaAudios_lista_idLista_seq"'::regclass);


--
-- TOC entry 2776 (class 2604 OID 17275)
-- Name: SistemaAudios_recurso idRecurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_recurso" ALTER COLUMN "idRecurso" SET DEFAULT nextval('public."SistemaAudios_recurso_idRecurso_seq"'::regclass);


--
-- TOC entry 2773 (class 2604 OID 17246)
-- Name: SistemaAudios_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user" ALTER COLUMN id SET DEFAULT nextval('public."SistemaAudios_user_id_seq"'::regclass);


--
-- TOC entry 2774 (class 2604 OID 17259)
-- Name: SistemaAudios_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_groups" ALTER COLUMN id SET DEFAULT nextval('public."SistemaAudios_user_groups_id_seq"'::regclass);


--
-- TOC entry 2775 (class 2604 OID 17267)
-- Name: SistemaAudios_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_user_permissions" ALTER COLUMN id SET DEFAULT nextval('public."SistemaAudios_user_user_permissions_id_seq"'::regclass);


--
-- TOC entry 2770 (class 2604 OID 17194)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 17204)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 17186)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 17358)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 17176)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 17165)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 2992 (class 0 OID 17235)
-- Dependencies: 213
-- Data for Name: SistemaAudios_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3004 (class 0 OID 17288)
-- Dependencies: 225
-- Data for Name: SistemaAudios_detallelista; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3002 (class 0 OID 17280)
-- Dependencies: 223
-- Data for Name: SistemaAudios_lista; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SistemaAudios_lista" VALUES (1, 'Lista de Favoritos', false, 1);
INSERT INTO public."SistemaAudios_lista" VALUES (2, 'Lista de Escuchar Mas Tarde', true, 1);
INSERT INTO public."SistemaAudios_lista" VALUES (3, 'Lista de Favoritos', false, 2);
INSERT INTO public."SistemaAudios_lista" VALUES (4, 'Lista de Escuchar Mas Tarde', true, 2);


--
-- TOC entry 3000 (class 0 OID 17272)
-- Dependencies: 221
-- Data for Name: SistemaAudios_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2994 (class 0 OID 17243)
-- Dependencies: 215
-- Data for Name: SistemaAudios_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."SistemaAudios_user" VALUES (1, 'pbkdf2_sha256$216000$EoN5iCybdURc$1nRU4u34MHQ9Qn34gDVbKJopF+cVQwmZnu3/fxYZ+x4=', '2020-12-23 20:53:08.983224-06', true, 'admin', '', '', 'admin@gmail.com', true, true, '2020-12-23 20:52:21.420897-06', NULL);
INSERT INTO public."SistemaAudios_user" VALUES (2, 'pbkdf2_sha256$216000$Wy84R1rMSZLT$S85bGowCkSPRL8ZUvUL4YcnSSjq8wEQ6M0+cXQ9v7F8=', '2020-12-23 20:54:41.114748-06', false, 'franganuza', 'Francisco', 'Ganuza', 'jganuzaramirez@gmail.com', false, true, '2020-12-23 20:53:37.922367-06', '');


--
-- TOC entry 2996 (class 0 OID 17256)
-- Dependencies: 217
-- Data for Name: SistemaAudios_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2998 (class 0 OID 17264)
-- Dependencies: 219
-- Data for Name: SistemaAudios_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2988 (class 0 OID 17191)
-- Dependencies: 209
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2990 (class 0 OID 17201)
-- Dependencies: 211
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2986 (class 0 OID 17183)
-- Dependencies: 207
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO public.auth_permission VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO public.auth_permission VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO public.auth_permission VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO public.auth_permission VALUES (21, 'Can add categoria', 6, 'add_categoria');
INSERT INTO public.auth_permission VALUES (22, 'Can change categoria', 6, 'change_categoria');
INSERT INTO public.auth_permission VALUES (23, 'Can delete categoria', 6, 'delete_categoria');
INSERT INTO public.auth_permission VALUES (24, 'Can view categoria', 6, 'view_categoria');
INSERT INTO public.auth_permission VALUES (25, 'Can add user', 7, 'add_user');
INSERT INTO public.auth_permission VALUES (26, 'Can change user', 7, 'change_user');
INSERT INTO public.auth_permission VALUES (27, 'Can delete user', 7, 'delete_user');
INSERT INTO public.auth_permission VALUES (28, 'Can view user', 7, 'view_user');
INSERT INTO public.auth_permission VALUES (29, 'Can add recurso', 8, 'add_recurso');
INSERT INTO public.auth_permission VALUES (30, 'Can change recurso', 8, 'change_recurso');
INSERT INTO public.auth_permission VALUES (31, 'Can delete recurso', 8, 'delete_recurso');
INSERT INTO public.auth_permission VALUES (32, 'Can view recurso', 8, 'view_recurso');
INSERT INTO public.auth_permission VALUES (33, 'Can add lista', 9, 'add_lista');
INSERT INTO public.auth_permission VALUES (34, 'Can change lista', 9, 'change_lista');
INSERT INTO public.auth_permission VALUES (35, 'Can delete lista', 9, 'delete_lista');
INSERT INTO public.auth_permission VALUES (36, 'Can view lista', 9, 'view_lista');
INSERT INTO public.auth_permission VALUES (37, 'Can add detalle lista', 10, 'add_detallelista');
INSERT INTO public.auth_permission VALUES (38, 'Can change detalle lista', 10, 'change_detallelista');
INSERT INTO public.auth_permission VALUES (39, 'Can delete detalle lista', 10, 'delete_detallelista');
INSERT INTO public.auth_permission VALUES (40, 'Can view detalle lista', 10, 'view_detallelista');


--
-- TOC entry 3006 (class 0 OID 17355)
-- Dependencies: 227
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2984 (class 0 OID 17173)
-- Dependencies: 205
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (5, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (6, 'SistemaAudios', 'categoria');
INSERT INTO public.django_content_type VALUES (7, 'SistemaAudios', 'user');
INSERT INTO public.django_content_type VALUES (8, 'SistemaAudios', 'recurso');
INSERT INTO public.django_content_type VALUES (9, 'SistemaAudios', 'lista');
INSERT INTO public.django_content_type VALUES (10, 'SistemaAudios', 'detallelista');


--
-- TOC entry 2982 (class 0 OID 17162)
-- Dependencies: 203
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2020-12-23 20:50:53.954966-06');
INSERT INTO public.django_migrations VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2020-12-23 20:50:53.982655-06');
INSERT INTO public.django_migrations VALUES (3, 'auth', '0001_initial', '2020-12-23 20:50:54.08524-06');
INSERT INTO public.django_migrations VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2020-12-23 20:50:54.21538-06');
INSERT INTO public.django_migrations VALUES (5, 'auth', '0003_alter_user_email_max_length', '2020-12-23 20:50:54.243386-06');
INSERT INTO public.django_migrations VALUES (6, 'auth', '0004_alter_user_username_opts', '2020-12-23 20:50:54.259388-06');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0005_alter_user_last_login_null', '2020-12-23 20:50:54.271379-06');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0006_require_contenttypes_0002', '2020-12-23 20:50:54.271379-06');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2020-12-23 20:50:54.291393-06');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0008_alter_user_username_max_length', '2020-12-23 20:50:54.303373-06');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2020-12-23 20:50:54.311396-06');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0010_alter_group_name_max_length', '2020-12-23 20:50:54.343381-06');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0011_update_proxy_permissions', '2020-12-23 20:50:54.355386-06');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2020-12-23 20:50:54.367387-06');
INSERT INTO public.django_migrations VALUES (15, 'SistemaAudios', '0001_initial', '2020-12-23 20:50:54.569656-06');
INSERT INTO public.django_migrations VALUES (16, 'admin', '0001_initial', '2020-12-23 20:50:54.911552-06');
INSERT INTO public.django_migrations VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2020-12-23 20:50:54.963565-06');
INSERT INTO public.django_migrations VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2020-12-23 20:50:54.979568-06');
INSERT INTO public.django_migrations VALUES (19, 'sessions', '0001_initial', '2020-12-23 20:50:55.023579-06');


--
-- TOC entry 3007 (class 0 OID 17377)
-- Dependencies: 228
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3027 (class 0 OID 0)
-- Dependencies: 212
-- Name: SistemaAudios_categoria_idCategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SistemaAudios_categoria_idCategoria_seq"', 1, false);


--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 224
-- Name: SistemaAudios_detallelista_idDetalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SistemaAudios_detallelista_idDetalle_seq"', 1, false);


--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 222
-- Name: SistemaAudios_lista_idLista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SistemaAudios_lista_idLista_seq"', 4, true);


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 220
-- Name: SistemaAudios_recurso_idRecurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SistemaAudios_recurso_idRecurso_seq"', 1, false);


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 216
-- Name: SistemaAudios_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SistemaAudios_user_groups_id_seq"', 1, false);


--
-- TOC entry 3032 (class 0 OID 0)
-- Dependencies: 214
-- Name: SistemaAudios_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SistemaAudios_user_id_seq"', 2, true);


--
-- TOC entry 3033 (class 0 OID 0)
-- Dependencies: 218
-- Name: SistemaAudios_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SistemaAudios_user_user_permissions_id_seq"', 1, false);


--
-- TOC entry 3034 (class 0 OID 0)
-- Dependencies: 208
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3035 (class 0 OID 0)
-- Dependencies: 210
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3036 (class 0 OID 0)
-- Dependencies: 206
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- TOC entry 3037 (class 0 OID 0)
-- Dependencies: 226
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- TOC entry 3038 (class 0 OID 0)
-- Dependencies: 204
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- TOC entry 3039 (class 0 OID 0)
-- Dependencies: 202
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- TOC entry 2804 (class 2606 OID 17240)
-- Name: SistemaAudios_categoria SistemaAudios_categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_categoria"
    ADD CONSTRAINT "SistemaAudios_categoria_pkey" PRIMARY KEY ("idCategoria");


--
-- TOC entry 2831 (class 2606 OID 17293)
-- Name: SistemaAudios_detallelista SistemaAudios_detallelista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_detallelista"
    ADD CONSTRAINT "SistemaAudios_detallelista_pkey" PRIMARY KEY ("idDetalle");


--
-- TOC entry 2827 (class 2606 OID 17285)
-- Name: SistemaAudios_lista SistemaAudios_lista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_lista"
    ADD CONSTRAINT "SistemaAudios_lista_pkey" PRIMARY KEY ("idLista");


--
-- TOC entry 2824 (class 2606 OID 17277)
-- Name: SistemaAudios_recurso SistemaAudios_recurso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_recurso"
    ADD CONSTRAINT "SistemaAudios_recurso_pkey" PRIMARY KEY ("idRecurso");


--
-- TOC entry 2812 (class 2606 OID 17261)
-- Name: SistemaAudios_user_groups SistemaAudios_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_groups"
    ADD CONSTRAINT "SistemaAudios_user_groups_pkey" PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 17296)
-- Name: SistemaAudios_user_groups SistemaAudios_user_groups_user_id_group_id_1f839cad_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_groups"
    ADD CONSTRAINT "SistemaAudios_user_groups_user_id_group_id_1f839cad_uniq" UNIQUE (user_id, group_id);


--
-- TOC entry 2806 (class 2606 OID 17251)
-- Name: SistemaAudios_user SistemaAudios_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user"
    ADD CONSTRAINT "SistemaAudios_user_pkey" PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 17310)
-- Name: SistemaAudios_user_user_permissions SistemaAudios_user_user__user_id_permission_id_8d399ef3_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_user_permissions"
    ADD CONSTRAINT "SistemaAudios_user_user__user_id_permission_id_8d399ef3_uniq" UNIQUE (user_id, permission_id);


--
-- TOC entry 2820 (class 2606 OID 17269)
-- Name: SistemaAudios_user_user_permissions SistemaAudios_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_user_permissions"
    ADD CONSTRAINT "SistemaAudios_user_user_permissions_pkey" PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 17253)
-- Name: SistemaAudios_user SistemaAudios_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user"
    ADD CONSTRAINT "SistemaAudios_user_username_key" UNIQUE (username);


--
-- TOC entry 2794 (class 2606 OID 17231)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2799 (class 2606 OID 17217)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2802 (class 2606 OID 17206)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 17196)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 17208)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2791 (class 2606 OID 17188)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 17364)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 17180)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2786 (class 2606 OID 17178)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 17170)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 17384)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2829 (class 1259 OID 17351)
-- Name: SistemaAudios_detallelista_lista_id_d2cffa1a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_detallelista_lista_id_d2cffa1a" ON public."SistemaAudios_detallelista" USING btree (lista_id);


--
-- TOC entry 2832 (class 1259 OID 17352)
-- Name: SistemaAudios_detallelista_recurso_id_6049e675; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_detallelista_recurso_id_6049e675" ON public."SistemaAudios_detallelista" USING btree (recurso_id);


--
-- TOC entry 2828 (class 1259 OID 17340)
-- Name: SistemaAudios_lista_usuario_id_2ffd989e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_lista_usuario_id_2ffd989e" ON public."SistemaAudios_lista" USING btree (usuario_id);


--
-- TOC entry 2822 (class 1259 OID 17333)
-- Name: SistemaAudios_recurso_categoria_id_aa0134bb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_recurso_categoria_id_aa0134bb" ON public."SistemaAudios_recurso" USING btree (categoria_id);


--
-- TOC entry 2825 (class 1259 OID 17334)
-- Name: SistemaAudios_recurso_usuario_id_618c3df9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_recurso_usuario_id_618c3df9" ON public."SistemaAudios_recurso" USING btree (usuario_id);


--
-- TOC entry 2810 (class 1259 OID 17308)
-- Name: SistemaAudios_user_groups_group_id_5b70bfbe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_user_groups_group_id_5b70bfbe" ON public."SistemaAudios_user_groups" USING btree (group_id);


--
-- TOC entry 2813 (class 1259 OID 17307)
-- Name: SistemaAudios_user_groups_user_id_d8389675; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_user_groups_user_id_d8389675" ON public."SistemaAudios_user_groups" USING btree (user_id);


--
-- TOC entry 2818 (class 1259 OID 17322)
-- Name: SistemaAudios_user_user_permissions_permission_id_daed41b0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_user_user_permissions_permission_id_daed41b0" ON public."SistemaAudios_user_user_permissions" USING btree (permission_id);


--
-- TOC entry 2821 (class 1259 OID 17321)
-- Name: SistemaAudios_user_user_permissions_user_id_cf923def; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_user_user_permissions_user_id_cf923def" ON public."SistemaAudios_user_user_permissions" USING btree (user_id);


--
-- TOC entry 2807 (class 1259 OID 17294)
-- Name: SistemaAudios_user_username_437f67b9_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SistemaAudios_user_username_437f67b9_like" ON public."SistemaAudios_user" USING btree (username varchar_pattern_ops);


--
-- TOC entry 2792 (class 1259 OID 17232)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2797 (class 1259 OID 17228)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2800 (class 1259 OID 17229)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2787 (class 1259 OID 17214)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2833 (class 1259 OID 17375)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2836 (class 1259 OID 17376)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2837 (class 1259 OID 17386)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2840 (class 1259 OID 17385)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2851 (class 2606 OID 17341)
-- Name: SistemaAudios_detallelista SistemaAudios_detall_lista_id_d2cffa1a_fk_SistemaAu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_detallelista"
    ADD CONSTRAINT "SistemaAudios_detall_lista_id_d2cffa1a_fk_SistemaAu" FOREIGN KEY (lista_id) REFERENCES public."SistemaAudios_lista"("idLista") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2852 (class 2606 OID 17346)
-- Name: SistemaAudios_detallelista SistemaAudios_detall_recurso_id_6049e675_fk_SistemaAu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_detallelista"
    ADD CONSTRAINT "SistemaAudios_detall_recurso_id_6049e675_fk_SistemaAu" FOREIGN KEY (recurso_id) REFERENCES public."SistemaAudios_recurso"("idRecurso") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2850 (class 2606 OID 17335)
-- Name: SistemaAudios_lista SistemaAudios_lista_usuario_id_2ffd989e_fk_SistemaAu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_lista"
    ADD CONSTRAINT "SistemaAudios_lista_usuario_id_2ffd989e_fk_SistemaAu" FOREIGN KEY (usuario_id) REFERENCES public."SistemaAudios_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2848 (class 2606 OID 17323)
-- Name: SistemaAudios_recurso SistemaAudios_recurs_categoria_id_aa0134bb_fk_SistemaAu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_recurso"
    ADD CONSTRAINT "SistemaAudios_recurs_categoria_id_aa0134bb_fk_SistemaAu" FOREIGN KEY (categoria_id) REFERENCES public."SistemaAudios_categoria"("idCategoria") DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2849 (class 2606 OID 17328)
-- Name: SistemaAudios_recurso SistemaAudios_recurs_usuario_id_618c3df9_fk_SistemaAu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_recurso"
    ADD CONSTRAINT "SistemaAudios_recurs_usuario_id_618c3df9_fk_SistemaAu" FOREIGN KEY (usuario_id) REFERENCES public."SistemaAudios_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2844 (class 2606 OID 17297)
-- Name: SistemaAudios_user_groups SistemaAudios_user_g_user_id_d8389675_fk_SistemaAu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_groups"
    ADD CONSTRAINT "SistemaAudios_user_g_user_id_d8389675_fk_SistemaAu" FOREIGN KEY (user_id) REFERENCES public."SistemaAudios_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2845 (class 2606 OID 17302)
-- Name: SistemaAudios_user_groups SistemaAudios_user_groups_group_id_5b70bfbe_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_groups"
    ADD CONSTRAINT "SistemaAudios_user_groups_group_id_5b70bfbe_fk_auth_group_id" FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2847 (class 2606 OID 17316)
-- Name: SistemaAudios_user_user_permissions SistemaAudios_user_u_permission_id_daed41b0_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_user_permissions"
    ADD CONSTRAINT "SistemaAudios_user_u_permission_id_daed41b0_fk_auth_perm" FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2846 (class 2606 OID 17311)
-- Name: SistemaAudios_user_user_permissions SistemaAudios_user_u_user_id_cf923def_fk_SistemaAu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SistemaAudios_user_user_permissions"
    ADD CONSTRAINT "SistemaAudios_user_u_user_id_cf923def_fk_SistemaAu" FOREIGN KEY (user_id) REFERENCES public."SistemaAudios_user"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2843 (class 2606 OID 17223)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2842 (class 2606 OID 17218)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2841 (class 2606 OID 17209)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2853 (class 2606 OID 17365)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2854 (class 2606 OID 17370)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_SistemaAudios_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT "django_admin_log_user_id_c564eba6_fk_SistemaAudios_user_id" FOREIGN KEY (user_id) REFERENCES public."SistemaAudios_user"(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2020-12-23 20:56:13

--
-- PostgreSQL database dump complete
--

