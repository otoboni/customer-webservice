--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

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
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    accountid integer NOT NULL,
    customerid integer NOT NULL,
    balance numeric(18,2) NOT NULL,
    accountnumber character varying(255) NOT NULL,
    createdat timestamp without time zone NOT NULL,
    modifiedat timestamp without time zone
);


ALTER TABLE public.account OWNER TO postgres;

--
-- Name: account_accountid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.account_accountid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_accountid_seq OWNER TO postgres;

--
-- Name: account_accountid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.account_accountid_seq OWNED BY public.account.accountid;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customerid integer NOT NULL,
    code character varying(50) NOT NULL,
    customername character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    address character varying(255) DEFAULT NULL::character varying,
    phone character varying(50) DEFAULT NULL::character varying,
    city character varying(50) DEFAULT NULL::character varying,
    country character varying(50) DEFAULT NULL::character varying,
    createdat date,
    modifiedat date
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_customerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_customerid_seq OWNER TO postgres;

--
-- Name: customer_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_customerid_seq OWNED BY public.customer.customerid;


--
-- Name: customer_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_user (
    userid integer NOT NULL,
    customerid integer NOT NULL,
    password character varying(50) NOT NULL,
    createdat date,
    modifiedat date
);


ALTER TABLE public.customer_user OWNER TO postgres;

--
-- Name: customer_user_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_user_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_user_userid_seq OWNER TO postgres;

--
-- Name: customer_user_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_user_userid_seq OWNED BY public.customer_user.userid;


--
-- Name: transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction (
    transactionid integer NOT NULL,
    customerid integer NOT NULL,
    code character varying(50) NOT NULL,
    amount numeric(18,2) NOT NULL,
    descriptionid integer NOT NULL,
    createdat date NOT NULL
);


ALTER TABLE public.transaction OWNER TO postgres;

--
-- Name: transaction_description; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaction_description (
    descriptionid integer NOT NULL,
    description character varying(50) NOT NULL,
    createdat date NOT NULL
);


ALTER TABLE public.transaction_description OWNER TO postgres;

--
-- Name: transaction_description_descriptionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_description_descriptionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_description_descriptionid_seq OWNER TO postgres;

--
-- Name: transaction_description_descriptionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_description_descriptionid_seq OWNED BY public.transaction_description.descriptionid;


--
-- Name: transaction_transactionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaction_transactionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transaction_transactionid_seq OWNER TO postgres;

--
-- Name: transaction_transactionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaction_transactionid_seq OWNED BY public.transaction.transactionid;


--
-- Name: account accountid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account ALTER COLUMN accountid SET DEFAULT nextval('public.account_accountid_seq'::regclass);


--
-- Name: customer customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN customerid SET DEFAULT nextval('public.customer_customerid_seq'::regclass);


--
-- Name: customer_user userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user ALTER COLUMN userid SET DEFAULT nextval('public.customer_user_userid_seq'::regclass);


--
-- Name: transaction transactionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction ALTER COLUMN transactionid SET DEFAULT nextval('public.transaction_transactionid_seq'::regclass);


--
-- Name: transaction_description descriptionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_description ALTER COLUMN descriptionid SET DEFAULT nextval('public.transaction_description_descriptionid_seq'::regclass);


--
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account (accountid, customerid, balance, accountnumber, createdat, modifiedat) FROM stdin;
1	1	100000.00	50686c21-0700-bec5-9df1-6e0b66870721	2018-12-20 01:36:10.383764	\N
2	2	100000.00	364a45e8-c726-795e-5596-7ae0aec4d6d9	2018-12-20 01:36:10.383764	\N
3	3	100000.00	4710f863-9076-83fa-dbd1-0b781d6a1415	2018-12-20 01:36:10.383764	\N
4	4	100000.00	ba0c7338-654f-c0cc-b1b5-2484d8424bf2	2018-12-20 01:36:10.383764	\N
5	5	100000.00	d6048684-3bb0-ff29-a92a-815ab2cbffa5	2018-12-20 01:36:10.383764	\N
6	6	100000.00	57cec719-7035-718a-8932-7192fa9ca675	2018-12-20 01:36:10.383764	\N
7	7	100000.00	c26de840-a350-9803-e033-32ce5235ead6	2018-12-20 01:36:10.383764	\N
8	8	100000.00	111eeaaa-c349-914e-ffa6-d30b2b3c490b	2018-12-20 01:36:10.383764	\N
9	9	100000.00	3b452008-b99c-56b1-dfdf-a0515718c425	2018-12-20 01:36:10.383764	\N
10	10	100000.00	37c0e91f-ff02-cb19-c24a-30b3ff47982e	2018-12-20 01:36:10.383764	\N
11	11	100000.00	04b6dd82-dee9-e09f-c508-6eb5c8bda861	2018-12-20 01:36:10.383764	\N
12	12	100000.00	7800f9b9-d52b-42e3-b081-fa1dd6d83c70	2018-12-20 01:36:10.383764	\N
13	13	100000.00	35caa2b5-09f7-bf11-07fe-4210fb5796de	2018-12-20 01:36:10.383764	\N
14	14	100000.00	dff84ab1-8256-c890-06e4-8c0563344a39	2018-12-20 01:36:10.383764	\N
15	15	100000.00	64806b7c-e6df-fa49-50e0-fa5f3e6e986c	2018-12-20 01:36:10.383764	\N
16	16	100000.00	47cf3ffe-b136-2c7f-896e-fdf8541aabf0	2018-12-20 01:36:10.383764	\N
17	17	100000.00	8c00e336-f67c-6665-ffeb-92cf9411788b	2018-12-20 01:36:10.383764	\N
18	18	100000.00	385d6db6-9fea-560b-c65c-3d351ed9c817	2018-12-20 01:36:10.383764	\N
19	19	100000.00	de3508c5-fb11-ca24-eda7-aa3e615375c0	2018-12-20 01:36:10.383764	\N
20	20	100000.00	124bde75-ef87-4712-b748-1055a09edd5f	2018-12-20 01:36:10.383764	\N
21	21	100000.00	9827b784-ac3c-3e86-5104-9354c4d22027	2018-12-20 01:36:10.383764	\N
22	22	100000.00	e885b5aa-0d38-4219-919d-7893676dc050	2018-12-20 01:36:10.383764	\N
23	23	100000.00	291c7373-cf8c-56ba-dc4a-9cb4b8950eff	2018-12-20 01:36:10.383764	\N
24	24	100000.00	6fccdc02-43a8-d726-edf5-fa1ca117f888	2018-12-20 01:36:10.383764	\N
25	25	100000.00	a53c6115-db8c-de7a-fd35-4b807a9d3cb8	2018-12-20 01:36:10.383764	\N
26	26	100000.00	fac06ee1-b299-ba58-5a46-85d50ac3b509	2018-12-20 01:36:10.383764	\N
27	27	100000.00	bac1f61f-8dbb-7d56-39a0-dca725ad9a61	2018-12-20 01:36:10.383764	\N
28	28	100000.00	75bf2192-9624-d9dc-997f-ed1601072678	2018-12-20 01:36:10.383764	\N
29	29	100000.00	03e6305f-38f7-16d7-e8c3-2197de3e87f0	2018-12-20 01:36:10.383764	\N
30	30	100000.00	4f814703-c13a-ba35-f679-2fe49bb7c547	2018-12-20 01:36:10.383764	\N
31	31	100000.00	367330bf-f41f-bc1c-3601-717048f51efe	2018-12-20 01:36:10.383764	\N
32	32	100000.00	229332cc-382f-1776-7a29-506c882a6cd6	2018-12-20 01:36:10.383764	\N
33	33	100000.00	e204030d-b5c3-5ff4-5d52-b71f987aaaeb	2018-12-20 01:36:10.383764	\N
34	34	100000.00	cb3cf637-57b7-3235-602c-e828036a012c	2018-12-20 01:36:10.383764	\N
35	35	100000.00	db866f18-6845-67bd-0cf4-ee354cc96e3d	2018-12-20 01:36:10.383764	\N
36	36	100000.00	50a00e81-23f2-ede6-4b2b-337d31cc1847	2018-12-20 01:36:10.383764	\N
37	37	100000.00	2c259879-f744-f9c8-188b-8a70bafe8a03	2018-12-20 01:36:10.383764	\N
38	38	100000.00	838615c3-bc72-3a87-0739-ac144dc31dca	2018-12-20 01:36:10.383764	\N
39	39	100000.00	67a93b07-9dbb-09c0-2e13-f8d7137260b2	2018-12-20 01:36:10.383764	\N
40	40	100000.00	22457ed9-5044-8bb9-b00e-0a45e27cea74	2018-12-20 01:36:10.383764	\N
41	41	100000.00	d69968bc-bb62-6dae-b47b-7703a64bfd6d	2018-12-20 01:36:10.383764	\N
42	42	100000.00	9230057a-8874-561e-8b82-ab427ea923d0	2018-12-20 01:36:10.383764	\N
43	43	100000.00	d4100438-09c4-7a78-f67b-3bf27328e10e	2018-12-20 01:36:10.383764	\N
44	44	100000.00	660efa7a-d396-a151-7ac2-44be371ac0f1	2018-12-20 01:36:10.383764	\N
45	45	100000.00	7f7df8f9-40b1-dcf8-c735-d8ff67a6f501	2018-12-20 01:36:10.383764	\N
46	46	100000.00	d1910dc2-0425-be2b-cbf0-93301006dd0a	2018-12-20 01:36:10.383764	\N
47	47	100000.00	c04a6303-2984-110e-7818-1aec3757ec47	2018-12-20 01:36:10.383764	\N
48	48	100000.00	b025b67b-e473-a0ec-913a-506664b94736	2018-12-20 01:36:10.383764	\N
49	49	100000.00	af20bb88-d5b3-6c63-6305-fa2d03a6c61c	2018-12-20 01:36:10.383764	\N
50	50	100000.00	8dbde98b-1d9f-f2aa-deef-fe2000fae21f	2018-12-20 01:36:10.383764	\N
51	51	100000.00	9c35b38e-ead5-246e-3b41-0adce9071847	2018-12-20 01:36:10.383764	\N
52	52	100000.00	85e27238-1974-38a9-ec1d-cde50975472a	2018-12-20 01:36:10.383764	\N
53	53	100000.00	a0c73a94-f849-3eea-00f8-723e464c461b	2018-12-20 01:36:10.383764	\N
54	54	100000.00	204b2c78-509d-524c-b50d-67d59899e5a7	2018-12-20 01:36:10.383764	\N
55	55	100000.00	7c0fa1a8-e226-d6dc-a94e-b6191d89cdf1	2018-12-20 01:36:10.383764	\N
56	56	100000.00	92363c0f-8c4b-8157-9a42-8e9688c0d455	2018-12-20 01:36:10.383764	\N
57	57	100000.00	4c979862-20ce-f4f3-71ea-e7df5a602da9	2018-12-20 01:36:10.383764	\N
58	58	100000.00	b261819b-eaa5-8331-db5c-df795eee6173	2018-12-20 01:36:10.383764	\N
59	59	100000.00	367e1eca-c217-077f-50c9-9511ae95dd4d	2018-12-20 01:36:10.383764	\N
60	60	100000.00	35a0328f-b75b-7bf0-17b3-7c9d08cecb1c	2018-12-20 01:36:10.383764	\N
61	61	100000.00	43c65c68-5b5c-b145-aece-881769092c6e	2018-12-20 01:36:10.383764	\N
62	62	100000.00	e00ed5f3-e125-d9b4-c821-6a841255f35a	2018-12-20 01:36:10.383764	\N
63	63	100000.00	37796c40-1f4b-e0d5-0354-37a5eace75d9	2018-12-20 01:36:10.383764	\N
64	64	100000.00	056affa5-7b91-6326-2b5e-bbdc1654f0a3	2018-12-20 01:36:10.383764	\N
65	65	100000.00	13f0f042-21df-8964-22f8-b79b07528f09	2018-12-20 01:36:10.383764	\N
66	66	100000.00	e542269b-b56a-3a7e-f779-fd8c8d977c15	2018-12-20 01:36:10.383764	\N
67	67	100000.00	7be77668-3b9f-b12d-a502-c1162ae09b8c	2018-12-20 01:36:10.383764	\N
68	68	100000.00	bb48ae6a-202f-b51d-ec7a-b4271c7fda39	2018-12-20 01:36:10.383764	\N
69	69	100000.00	a9a202d4-68c5-2dd1-fd5c-ddeafb00c3b8	2018-12-20 01:36:10.383764	\N
70	70	100000.00	89e978b8-3971-55aa-c61d-707e7a5856ae	2018-12-20 01:36:10.383764	\N
71	71	100000.00	e671e5a9-7436-4a5d-7928-9d3d60109013	2018-12-20 01:36:10.383764	\N
72	72	100000.00	c4c5abf5-d406-ef77-5974-a6ead30eb367	2018-12-20 01:36:10.383764	\N
73	73	100000.00	3762e0ef-54e7-839d-e6c3-8f5e7aa6f7b8	2018-12-20 01:36:10.383764	\N
74	74	100000.00	4e917441-6c25-451a-b40e-ecc7717f652a	2018-12-20 01:36:10.383764	\N
75	75	100000.00	14e8c60a-b579-c90a-542d-67394b77492b	2018-12-20 01:36:10.383764	\N
76	76	100000.00	1e258cd2-dee5-5aee-0ddc-fa8ad5a1b3fb	2018-12-20 01:36:10.383764	\N
77	77	100000.00	d1dafa1d-399d-8679-7025-f50411c8fcbc	2018-12-20 01:36:10.383764	\N
78	78	100000.00	1f9fec71-0e72-e6fc-a0f7-75033cee449e	2018-12-20 01:36:10.383764	\N
79	79	100000.00	40f7860b-9026-ac33-a449-0a468133dbdf	2018-12-20 01:36:10.383764	\N
80	80	100000.00	af6b2c0e-9e16-f975-6c87-a5130539a3d0	2018-12-20 01:36:10.383764	\N
81	81	100000.00	4dabb967-b9a0-863b-70e3-a1154a609c85	2018-12-20 01:36:10.383764	\N
82	82	100000.00	ce3a81f0-f8b7-3dd5-a884-7278cf640c16	2018-12-20 01:36:10.383764	\N
83	83	100000.00	6682d909-21ff-9982-8cb5-e3e922574fe9	2018-12-20 01:36:10.383764	\N
84	84	100000.00	4ad56664-3fca-1abe-2361-d74dbf61c376	2018-12-20 01:36:10.383764	\N
85	85	100000.00	37a4e9a2-643e-8dbb-7bd3-ab77d880caf9	2018-12-20 01:36:10.383764	\N
86	86	100000.00	938f382c-7785-1f85-80b2-c8994d9faaaf	2018-12-20 01:36:10.383764	\N
87	87	100000.00	b09e7456-20f8-c6c9-1120-0cac14d99a5e	2018-12-20 01:36:10.383764	\N
88	88	100000.00	082444da-27ff-8a09-5c97-d80395985b1b	2018-12-20 01:36:10.383764	\N
89	89	100000.00	aae34bf4-a03e-f854-8302-464291dd933b	2018-12-20 01:36:10.383764	\N
90	90	100000.00	fd9bc312-eb2b-70b6-14ce-ce73d185c72a	2018-12-20 01:36:10.383764	\N
91	91	100000.00	46943397-dd41-6690-00a5-fb85c32b0905	2018-12-20 01:36:10.383764	\N
92	92	100000.00	d4c35f58-56db-befe-7ad3-a015f3ce853a	2018-12-20 01:36:10.383764	\N
93	93	100000.00	1250c8be-770c-01f3-d4b9-ad6faeb708b1	2018-12-20 01:36:10.383764	\N
94	94	100000.00	aa336494-0872-9686-8758-d6214571c103	2018-12-20 01:36:10.383764	\N
95	95	100000.00	d439eb59-ec5e-679b-abe6-3a1c6344f645	2018-12-20 01:36:10.383764	\N
96	96	100000.00	4b1ff9d0-5a74-d977-46a6-104f7dd62325	2018-12-20 01:36:10.383764	\N
97	97	100000.00	c5562a94-cf94-d3ca-54b0-af83a5a0bf63	2018-12-20 01:36:10.383764	\N
98	98	100000.00	220c5fb6-4279-fa66-b928-873bfb233b69	2018-12-20 01:36:10.383764	\N
99	99	100000.00	d1dbb29f-9115-7d32-6b98-0104f24ea85f	2018-12-20 01:36:10.383764	\N
100	100	100000.00	1527e916-0d4e-b4bc-e2c6-5f4471e120cd	2018-12-20 01:36:10.383764	\N
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customerid, code, customername, email, address, phone, city, country, createdat, modifiedat) FROM stdin;
1	72617006-0C75-2D17-CFDB-9AA418541978	Nam Industries	vitae.sodales.at@Integervulputaterisus.co.uk	2540 Maecenas St.	1-846-713-5691	Bognor Regis	Turks and Caicos Islands	2018-02-27	\N
2	B2928F04-6606-59FA-55CB-2A4AD71FBE3F	Et Lacinia Company	felis@justonecante.ca	P.O. Box 733, 5993 Enim. Road	1-101-697-1540	Beez	Jersey	2019-02-11	\N
3	E2AE2D5E-4C1B-A393-67B8-7C16B6C2928E	Sagittis Semper Associates	eu.placerat@velit.com	521-4174 Lobortis Rd.	1-754-832-6661	Burns Lake	Bonaire, Sint Eustatius and Saba	2019-08-15	\N
4	AE54A08D-E484-B92F-E80B-1671976BF9E4	Mauris A Nunc Corp.	nunc@placerat.co.uk	743-3374 Tortor. Av.	1-441-160-9576	Coatbridge	Liechtenstein	2019-05-27	\N
5	BFD14CE3-BFF4-84D5-FCD6-C11EC1451C3E	Ac Facilisis Facilisis LLC	dictum@in.co.uk	Ap #189-8950 Felis Av.	1-587-337-5662	Helensburgh	Comoros	2019-01-21	\N
6	951FCE6B-8976-A27B-C159-B636CAF3AD10	Tellus Corp.	Aliquam@ipsumSuspendisse.co.uk	Ap #440-6861 At Rd.	979-2195	Bologna	Brazil	2019-08-18	\N
7	473E70BA-67CD-A600-AA27-C7EE8DF1C88B	Aenean Sed Pede Institute	Maecenas.iaculis.aliquet@facilisisnonbibendum.org	4177 Mollis Street	1-342-814-9035	Tramatza	Northern Mariana Islands	2019-03-25	\N
8	74AC23C1-A0A0-63A1-74FD-5D50F3493EFD	Pede Nonummy Ut PC	tincidunt.nunc@eros.org	P.O. Box 313, 6546 Morbi St.	1-614-226-0491	Glain	Panama	2018-10-16	\N
9	431C16BE-CA82-C506-F879-FF872D2B126F	Convallis Ante Corp.	purus.mauris@risusodioauctor.co.uk	P.O. Box 718, 8411 Auctor Ave	1-447-201-5602	Rouvreux	Denmark	2019-02-13	\N
10	40983EEC-1BC7-9CB7-A7F4-14C46A09A869	Volutpat Incorporated	Proin.dolor@Aliquamtinciduntnunc.net	3282 Donec Rd.	712-3384	San Chirico Nuovo	Wallis and Futuna	2019-02-08	\N
11	9E2EE6BA-CB4B-77EE-11B7-1F0EE2F5E43D	Cum LLC	sapien.Nunc@Pellentesquetincidunt.co.uk	4219 Augue St.	1-539-828-3663	Falisolle	Syria	2019-10-12	\N
12	C86109D3-67CB-CA5A-5858-A485887E333B	Ad Litora Torquent Company	nonummy@nonummy.org	112-3972 Fames Avenue	330-1526	Grimbergen	Pakistan	2018-05-10	\N
13	2B3EEEAD-3FE8-40D0-7826-E1E6F6D3D7D7	Interdum Ligula Institute	a.dui.Cras@lacusNullatincidunt.co.uk	510-2712 Ligula Rd.	1-718-213-6276	Episcopia	Samoa	2019-09-05	\N
14	A8074929-22DB-D1A3-93D1-DAAD2AA5D78F	Sed LLP	Quisque.ac@porttitortellusnon.net	Ap #548-2147 Nunc St.	1-526-406-1187	St. John's	British Indian Ocean Territory	2017-12-26	\N
15	D6201326-0364-1B95-84DC-835FB6D16BB6	Sed LLP	Ut.tincidunt.vehicula@ettristique.co.uk	994-1961 Scelerisque, Rd.	1-112-127-6767	Auckland	Kuwait	2019-08-11	\N
16	3C7E2C70-1363-D825-474C-D604C5BB2F50	Sit Amet Risus Company	tellus.Nunc@tacitisociosqu.net	4007 Vitae St.	181-7036	Gressoney-La-Trinitè	Nicaragua	2019-01-07	\N
17	1113B691-3049-D9AA-C0BE-C6828F927B4B	Nunc Sit Amet Foundation	dapibus@placerat.net	314 Ut Ave	1-735-295-3641	Sannazzaro de' Burgondi	Saint Martin	2018-05-18	\N
18	BC105540-D25A-409E-11E1-F6FFF796BBCB	Risus In Consulting	amet.faucibus.ut@Fusce.com	480-4868 Luctus Street	1-745-345-0776	Schriek	Lesotho	2018-10-27	\N
19	223FA318-5DF6-F9CF-1478-A6DA17DC1E28	Elit Corp.	molestie@velitQuisquevarius.edu	5627 Lorem. Street	313-4136	Norfolk County	Papua New Guinea	2018-02-28	\N
20	41FD40A2-55E7-7FE2-63BB-50F9F9A3E8E4	Vitae LLC	dignissim@sitametconsectetuer.net	895-5043 Natoque Avenue	701-3776	Bousval	Marshall Islands	2018-09-04	\N
21	DF8BBF64-49E8-827E-4932-35CCEE6DE207	Cursus Consulting	Mauris.eu@nostraperinceptos.edu	Ap #250-9748 Egestas Ave	653-8454	Sennariolo	Mongolia	2019-04-06	\N
22	9832E263-39C9-8B09-F0EA-7C36FDDA57A4	At Foundation	mollis@utpellentesqueeget.com	9940 Nullam Ave	1-185-473-6535	Delianuova	Guatemala	2018-05-15	\N
23	0E306E4B-16F0-0BF1-D808-8EC6DE3C5200	Nunc Incorporated	Lorem.ipsum@adipiscingelitCurabitur.co.uk	344-7756 Aenean Avenue	820-1799	Guildford	Aruba	2019-08-14	\N
24	A0182B8D-F4FD-B582-7AC6-80A7592B858A	Donec Consulting	urna.Vivamus@aliquamenim.edu	2185 Libero Rd.	923-3015	Faizabad	Pakistan	2019-11-27	\N
26	958AC65F-1590-3523-6E5A-25EE43560A04	Dignissim Lacus Industries	lectus.justo.eu@augue.co.uk	Ap #458-5629 Egestas St.	135-4758	Ronciglione	Gambia	2018-10-24	\N
27	E00293A7-70C0-6B1E-717C-C80DEF2CF7AC	Natoque LLP	non.lacinia@urnaVivamusmolestie.org	P.O. Box 817, 2004 Est. St.	958-4392	Strijtem	Finland	2018-11-09	\N
28	FB376512-FCE4-BEC2-B52C-F35270B29B4F	Metus Institute	eu.nulla@erat.net	5300 Risus. Road	946-5110	Poggiorsini	United States	2018-12-20	\N
29	038DB8BE-FE04-1D68-E98B-ABCB1F92CF55	Dolor Nonummy Ac Inc.	Etiam.gravida.molestie@tinciduntnunc.net	P.O. Box 103, 2050 Nam St.	241-3833	Sint-Michiels	Togo	2019-07-28	\N
30	D0D9C9FA-099F-8C7F-8493-1605607D3C34	Commodo Tincidunt LLP	ipsum@Curabiturvellectus.ca	1729 Blandit Street	797-1930	Colledimacine	Bermuda	2019-02-24	\N
31	7A4E94D1-CC35-5ACE-5121-D64CE07F3430	Eu Neque Pellentesque PC	enim.condimentum@magna.ca	2870 Velit. Ave	743-0359	Vorst	Czech Republic	2018-12-05	\N
32	FCADFDFF-7A3A-11D7-EB17-CCB86E2B355A	Felis Orci LLC	magnis.dis.parturient@risusquis.com	658-4227 Viverra. Rd.	186-6534	Schönebeck	Viet Nam	2019-03-13	\N
33	93186FD5-2752-B469-4099-4BCC97803684	A Facilisis Associates	et.magnis@tinciduntduiaugue.org	632-9341 Egestas, St.	672-7830	Lacombe County	Macao	2019-04-08	\N
34	A52F847D-7898-04E2-2D85-C02C9386E2F5	Pharetra Industries	Proin.sed@aliquet.net	9300 Ut Street	1-724-133-2074	Rouyn-Noranda	Northern Mariana Islands	2019-08-15	\N
35	4E499EAA-351A-7190-EA93-28AF4A0CF22B	A Magna PC	dolor.dapibus.gravida@Craseget.co.uk	7181 Mauris Ave	740-4292	Nanded	Congo, the Democratic Republic of the	2018-03-01	\N
36	5489D006-3254-BCAD-C1F5-B6FBAF74E6DF	Diam Lorem Auctor Limited	Nullam.enim@Maecenas.net	P.O. Box 806, 245 Libero. Ave	128-2353	Tuscaloosa	Nicaragua	2018-11-19	\N
37	DCD30C73-2B62-7ABA-EEF8-AA0F1E517EA1	Pharetra Company	ornare@veliteu.ca	P.O. Box 455, 5010 Hymenaeos. Street	851-8916	Maule	Ethiopia	2019-01-03	\N
38	E3CF04E1-3FC1-E268-CC53-E7433A00A17C	Adipiscing PC	elementum@sagittis.edu	462-5636 Mus. Street	1-975-412-3169	Bridgeport	Zambia	2019-02-02	\N
39	A872DE5B-41D3-6C04-2910-EF2227A72798	Eu Institute	risus@vehiculaPellentesquetincidunt.org	2916 Semper Rd.	256-5533	Enna	Sweden	2018-04-08	\N
40	128EBB16-34C8-36A3-362C-98136A72D67E	Sit Company	dolor.egestas@Phasellus.org	P.O. Box 960, 7441 Ridiculus Ave	1-609-933-5878	Cumberland County	Portugal	2019-05-22	\N
41	6C878ACF-EBF1-1757-0A8B-678910AE31CC	Tortor Corporation	eget.volutpat.ornare@Quisque.ca	758-1580 At St.	248-0276	Kohima	Virgin Islands, British	2018-09-19	\N
42	509893F0-CE09-7519-7B0B-B0A944E319BE	Sapien Company	gravida.sit.amet@odio.org	P.O. Box 682, 4515 Purus. St.	1-192-466-6094	Helchteren	Indonesia	2018-02-09	\N
25	25846561-84F1-2919-B794-4435F4778647	Natoque Consulting	admin@pharetrasedhendrerit.net	7436 Fusce Rd.	658-1640	Chilliwack	Kenya	2018-08-01	2023-09-04
43	39A02221-C0FF-C8F6-8D69-13307349E788	Pharetra Limited	enim.Sed.nulla@risusNullaeget.com	P.O. Box 323, 1003 Praesent Avenue	1-547-788-1897	Toulouse	Macao	2018-11-03	\N
44	3B14461F-60DF-F597-56A2-74FA556B1ABA	Orci Inc.	magna.Lorem@massanon.net	P.O. Box 480, 4115 Sit Ave	523-6115	Çermik	Iran	2019-11-06	\N
45	CEA072A7-CA61-9073-4B70-EF2D4A047A1B	Et Rutrum Eu PC	mauris.sapien.cursus@rutrum.net	716-4749 Nulla Rd.	1-612-730-3949	Geelong	Paraguay	2019-11-28	\N
46	C9DB5110-8E34-9615-7CA1-677E284D9CF6	Eu Metus Inc.	pede@tellusNunclectus.com	Ap #488-5580 Vitae Av.	1-741-583-5887	Etobicoke	Belize	2019-05-19	\N
47	013C5CBE-396F-4BAE-CCD9-8233786DBD72	Nunc Ac Associates	natoque.penatibus@vitaepurusgravida.co.uk	P.O. Box 712, 2936 Sed St.	1-610-747-4814	Naninne	Namibia	2018-03-06	\N
48	A069B7EF-D05B-C697-0E35-F06D37C56BEC	Ac Fermentum Vel LLC	id.blandit@Crasconvallisconvallis.ca	761-9447 Sit St.	1-129-875-7251	Fogo	Nepal	2018-02-16	\N
49	E87C9395-95F9-ED7C-D526-C5F42DAEAB42	Non Sollicitudin A Industries	Sed.eu.eros@mattis.org	Ap #199-2294 Donec Rd.	784-6192	Burntisland	Cyprus	2017-12-02	\N
50	84806E57-ED63-7605-1C16-42E5C84078B1	Dictum Mi Ac Inc.	ipsum.leo@hendreritnequeIn.co.uk	324-5301 Pharetra Rd.	334-0036	Salles	Madagascar	2018-01-26	\N
51	3230D171-C905-205A-1DE8-EE4BAE3CDCA1	Condimentum Donec At Corp.	Cras@turpisegestas.com	4441 Accumsan Av.	878-6606	Tucson	Haiti	2019-07-09	\N
52	C59E6EE7-6DC3-67BD-413F-4F35E6D286A2	Ac Nulla LLP	id.blandit.at@aduiCras.edu	953-5651 Sed Avenue	1-334-530-9130	Pollein	Iraq	2018-02-22	\N
53	81641760-AFB9-B8A3-013F-725ACBA90BCF	Duis At Institute	adipiscing@Vestibulum.co.uk	Ap #201-6731 Tincidunt, St.	647-0662	Mandi Burewala	French Polynesia	2019-02-05	\N
54	7B606148-C96F-FB71-A85D-0FEB74FF7B70	Dis LLC	consectetuer@nec.co.uk	223-8935 Arcu. Rd.	1-634-416-8431	FerriŽres	Spain	2019-10-08	\N
55	B458279E-588D-3D94-54FE-85CC633C01E1	Egestas Duis Consulting	sed.libero@aliquet.org	278-8051 Nisl. Rd.	1-160-244-4998	Ferrazzano	Puerto Rico	2019-09-18	\N
56	EE9661C0-059B-E2C1-A686-D77ADD32E6CA	Quisque Imperdiet Foundation	vel.mauris@Phaselluslibero.net	P.O. Box 487, 2331 Consectetuer Rd.	1-387-382-9218	Ligny	Guinea	2018-09-02	\N
57	17E654F1-97EB-A0D7-4205-9259151B20BF	Duis Sit Consulting	dictum@Aenean.org	619-5442 In Road	1-407-480-3189	Cunco	Monaco	2018-01-06	\N
58	1C7C5D9E-62B7-5E84-B076-FBCE0C5E7210	Sagittis Placerat Institute	pede.malesuada.vel@vel.ca	7327 Eget, Road	1-684-416-9607	Anchorage	United States Minor Outlying Islands	2017-12-12	\N
59	B26BC71D-7010-6A0F-043E-349ECA6F24DB	Metus Urna Corporation	dis.parturient.montes@ligulaconsectetuer.ca	P.O. Box 356, 2662 Commodo Av.	1-130-742-2892	Sanluri	Guernsey	2018-06-28	\N
60	0F92D185-B60E-2D8B-469F-CCF81DE44EE2	Turpis Industries	vitae@nisiAeneaneget.org	7268 Fringilla St.	1-351-763-3523	Lisieux	Nicaragua	2019-10-06	\N
61	ED3A885A-F57D-0097-B6DB-AE546F163BFE	Ante Foundation	vitae@aduiCras.net	P.O. Box 444, 4214 Egestas Rd.	643-2815	Milwaukee	Fiji	2019-02-03	\N
62	610F2D13-D1F9-8241-E5F7-686E446DE925	Dolor Industries	est.arcu.ac@Suspendissesed.net	544-7473 Mauris Rd.	1-953-381-9590	Gouvy	Spain	2019-09-08	\N
63	391771B2-8C48-7BCF-474C-F337BF7C9B7D	Ac Institute	gravida.mauris.ut@egestasnunc.edu	P.O. Box 841, 7042 Lacus. Ave	442-5835	Albury	Côte D'Ivoire (Ivory Coast)	2018-06-14	\N
64	35271A14-A1C2-0F2E-3AF5-3632763301A8	Risus LLC	ac.orci@eueleifendnec.net	P.O. Box 103, 5442 Congue Street	1-751-778-3365	Orroli	Åland Islands	2019-03-31	\N
65	33FB817A-EE6F-BB80-C1D4-1E52E190531B	Molestie Sodales LLC	sapien@parturient.co.uk	P.O. Box 385, 9584 Dolor Av.	1-543-360-8368	Baie-Saint-Paul	France	2018-06-04	\N
66	CE47EBD7-C862-BE14-573E-04D71C9BABD6	Tellus Non Magna Consulting	Proin.vel.arcu@risus.co.uk	P.O. Box 590, 8162 Eget St.	1-628-246-5921	San Luca	Liberia	2017-12-01	\N
67	4E078317-CCB9-F68B-081A-CDC3D8F41644	Augue Sed Molestie Incorporated	Maecenas.ornare.egestas@lectus.edu	P.O. Box 864, 5398 Et, Road	959-1980	Lloydminster	Sweden	2018-04-13	\N
68	6E33E1F4-3F22-D24F-1D63-631FEF7A10D4	Quis Inc.	sit.amet.ante@Craslorem.ca	P.O. Box 271, 486 Lorem, St.	1-139-259-0443	Łódź	Sudan	2018-01-30	\N
69	6E1D7F96-28B5-8174-231C-240B5D778294	Amet Industries	vitae@Nullam.com	Ap #419-6093 Purus. Ave	831-3716	Mannekensvere	Saint Lucia	2018-03-31	\N
70	7FDC2D25-15DE-E778-B487-0E7929700D03	Metus Vitae Velit PC	fringilla.euismod.enim@luctuset.edu	3588 Purus. St.	683-0007	Muzaffarpur	Argentina	2018-06-24	\N
71	70D7D1B2-7E5E-AD79-9569-F37BD55F449D	Fusce Mi Lorem Industries	vulputate.posuere.vulputate@massa.com	Ap #260-4768 Quisque St.	435-3327	Thames	Cook Islands	2018-12-27	\N
72	6494251D-0429-7FFD-C6FA-4EB009843E0B	Iaculis Institute	Praesent.eu@sem.edu	Ap #966-9895 Dolor Street	369-2661	Arviat	Belarus	2018-07-31	\N
73	898C6ECE-9B9B-08AA-B7A3-C2562C1DDCF4	Volutpat Nulla Facilisis Foundation	ligula.consectetuer.rhoncus@hymenaeos.ca	3305 Morbi Road	1-541-903-0533	Bruckneudorf	Tonga	2018-05-26	\N
74	78ED9C9F-92E4-411E-6DA1-B64398DA0826	Hendrerit Company	Ut@necurnasuscipit.ca	681-7526 At St.	1-223-999-2877	Bay Roberts	Bonaire, Sint Eustatius and Saba	2018-04-30	\N
75	15A02016-C178-D618-93D8-71EB73D82E80	Fermentum Vel Mauris Industries	urna.convallis@ategestasa.com	P.O. Box 851, 4380 Amet, Road	1-864-996-4371	Burns Lake	Honduras	2017-12-08	\N
76	E78E0A62-3401-C7D0-D096-511B7505E9ED	Magna Nam Ligula LLC	ut@mattisCraseget.net	Ap #222-6444 Tempor St.	975-3427	Albi	Ecuador	2018-06-11	\N
77	414021F3-04A1-CE6A-5999-BCF260EEDAB8	Natoque Penatibus Et Ltd	sociis.natoque@massa.net	9545 Egestas, Street	687-8580	Las Condes	Papua New Guinea	2018-11-30	\N
78	E6ED5DFD-B8E1-D996-301B-6A0255068012	Nec Urna Foundation	consequat@velarcu.ca	Ap #110-1807 Ligula. Av.	402-3891	Airdrie	Saint Vincent and The Grenadines	2019-03-06	\N
79	E887FEE4-C830-769E-6E05-11B05E1617B8	Vestibulum Accumsan Neque Limited	orci@euduiCum.edu	P.O. Box 241, 1474 At St.	1-826-780-4024	Velletri	Cayman Islands	2018-09-28	\N
80	2869EFC6-6D3D-7D91-9D0E-7CC53F8205E3	Vivamus Sit Amet LLC	consectetuer@Maecenasmifelis.net	P.O. Box 745, 6414 Nam Avenue	1-282-779-0171	Russell	India	2018-04-10	\N
81	68F51657-E6D5-9E75-97A7-EA878F893AC5	Adipiscing Institute	auctor.velit.eget@tempor.com	649-8199 Fusce Ave	683-0569	Monceau-sur-Sambre	Hungary	2018-03-10	\N
82	CBBC923D-7227-630D-138E-E07D25ECC8F3	Sed Neque Consulting	dui.Cum@Fuscealiquam.co.uk	Ap #821-3988 Rutrum St.	1-178-882-6951	McCallum	Algeria	2018-05-07	\N
83	4C8B85B4-AD4D-531D-D262-C01BAA9B3767	Libero Mauris Inc.	eros.Nam.consequat@id.ca	2638 Donec Rd.	119-5667	Achalpur	Luxembourg	2019-08-19	\N
84	0D11A45E-94F3-8151-2848-64D91F6B3435	Imperdiet Non Incorporated	lacinia.at.iaculis@Donectincidunt.ca	Ap #289-7493 Posuere, Ave	1-119-610-9192	Chestermere	New Caledonia	2019-09-19	\N
85	29E6C088-7330-CCAF-BABB-DF0508E0063B	Nec LLC	et@sapienAenean.edu	Ap #396-3584 Non St.	173-2597	San Cesario di Lecce	Saint Helena, Ascension and Tristan da Cunha	2018-06-07	\N
86	9F51713C-6771-9A44-0980-092CC31B61FF	Luctus Corporation	Aliquam.adipiscing@velesttempor.net	8770 Metus. Rd.	354-6513	Paignton	Bermuda	2018-06-08	\N
87	B9FCD048-BE79-53DB-D76D-5255942AA905	Dui Semper Corp.	lacus.Ut.nec@idanteNunc.co.uk	Ap #234-8835 Aliquam Rd.	584-8529	Polpenazze del Garda	Panama	2018-02-12	\N
88	48D74011-DF34-9601-192F-FD66FA44B2DD	Arcu Vestibulum Ante Corp.	nisl@eleifendvitaeerat.com	232-6028 Donec Rd.	1-345-908-6522	Akron	Tuvalu	2018-03-04	\N
89	8011A901-6FBC-7AE8-F758-BD9EA7785F74	Arcu Vestibulum Limited	luctus@erat.edu	390-2206 Morbi Road	884-5839	Juneau	Viet Nam	2018-07-13	\N
90	C9BB08A9-8360-AC95-EEE8-85F60D3AE7D5	Nibh Aliquam Industries	amet.diam.eu@temporbibendum.co.uk	155-389 Curabitur Street	900-3410	Braives	Aruba	2018-06-21	\N
91	4C6EFE7F-81DE-B8DC-E5BB-8BA6829422FF	Morbi Metus LLP	diam.eu@parturientmontesnascetur.co.uk	554-1164 In Av.	1-830-145-9136	Independence	Kyrgyzstan	2019-02-22	\N
92	FDF36B53-1605-9EAF-9556-AC8B06736DAC	Egestas Duis Ac Corporation	Donec.feugiat@egestas.ca	4175 Sapien Ave	1-841-924-2372	Quemchi	Tanzania	2019-10-01	\N
93	AA075B46-01E2-EAE7-21F2-21F23AAB5EF7	Sit Inc.	Phasellus.libero@velitjustonec.edu	P.O. Box 452, 1113 Sem, Road	642-7347	Río Hurtado	Sudan	2019-03-09	\N
94	B21B860A-3397-97DD-FB5D-F53FE9F90486	Rutrum Justo Limited	et.rutrum@ligula.com	Ap #206-5459 Quisque St.	186-9309	Prince Albert	Liberia	2019-03-28	\N
95	63B70A4B-DFC6-DC47-DEAF-B890C7E7CBEF	Et Risus Quisque Corporation	facilisis.vitae@dapibus.edu	Ap #482-3671 Ipsum Ave	1-448-764-7740	Karnal	Somalia	2018-01-17	\N
96	AD1EE4CE-36EB-70DD-2B6B-BB89269C478D	Arcu Morbi PC	amet.lorem.semper@quisdiam.co.uk	P.O. Box 323, 2041 Molestie Av.	1-199-404-0907	Sant'Egidio alla Vibrata	United States Minor Outlying Islands	2017-12-18	\N
97	1DDAE7B6-B101-CEA3-EBA4-1FEE050B65F6	Nascetur Consulting	Curabitur.consequat.lectus@lobortisquama.net	3824 Sed Rd.	660-4976	Shillong	Russian Federation	2018-08-25	\N
98	B5478DEC-A0C0-17CD-C8EE-1138459AAD2E	Sed Foundation	Quisque.ornare@placerat.com	Ap #169-6002 Aliquet St.	1-401-422-9517	Mâcon	Georgia	2018-01-02	\N
99	0F9AA1EB-B1FB-93B9-0710-814CB8091BED	Sagittis Ltd	venenatis@Sednullaante.com	Ap #472-3563 Vitae, St.	470-1005	Pointe-Claire	Georgia	2018-02-25	\N
100	B797614B-1690-E9E1-1B8F-C5A523D8DD80	Vestibulum Neque Foundation	Duis@Nunc.com	Ap #274-6538 Nec Road	940-1109	Limbach-Oberfrohna	Guinea	2017-12-17	\N
110	3AE03B7C-2737-4AD3-A196-6850556BC8AB	Microcrápula Inc.	contact@mcinc.com	Ap #274-6538 Nec Road	525-25-25	São Paulo	Brazil	2021-09-23	2021-09-23
\.


--
-- Data for Name: customer_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_user (userid, customerid, password, createdat, modifiedat) FROM stdin;
1	1	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
2	2	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
3	3	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
4	4	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
5	5	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
6	6	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
7	7	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
8	8	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
9	9	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
10	10	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
11	11	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
12	12	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
13	13	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
14	14	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
15	15	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
16	16	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
17	17	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
18	18	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
19	19	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
20	20	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
21	21	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
22	22	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
23	23	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
24	24	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
25	25	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
26	26	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
27	27	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
28	28	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
29	29	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
30	30	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
31	31	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
32	32	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
33	33	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
34	34	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
35	35	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
36	36	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
37	37	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
38	38	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
39	39	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
40	40	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
41	41	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
42	42	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
43	43	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
44	44	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
45	45	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
46	46	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
47	47	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
48	48	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
49	49	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
50	50	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
51	51	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
52	52	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
53	53	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
54	54	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
55	55	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
56	56	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
57	57	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
58	58	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
59	59	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
60	60	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
61	61	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
62	62	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
63	63	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
64	64	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
65	65	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
66	66	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
67	67	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
68	68	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
69	69	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
70	70	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
71	71	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
72	72	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
73	73	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
74	74	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
75	75	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
76	76	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
77	77	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
78	78	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
79	79	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
80	80	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
81	81	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
82	82	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
83	83	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
84	84	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
85	85	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
86	86	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
87	87	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
88	88	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
89	89	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
90	90	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
91	91	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
92	92	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
93	93	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
94	94	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
95	95	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
96	96	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
97	97	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
98	98	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
99	99	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
100	100	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
101	110	e10adc3949ba59abbe56e057f20f883e	2023-03-20	\N
\.


--
-- Data for Name: transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction (transactionid, customerid, code, amount, descriptionid, createdat) FROM stdin;
\.


--
-- Data for Name: transaction_description; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaction_description (descriptionid, description, createdat) FROM stdin;
1	Purchases	2018-12-01
2	Mortgage	2018-12-01
3	Loan	2018-12-01
4	Debit card	2018-12-01
5	Credit card	2018-12-01
6	Bank account	2018-12-01
\.


--
-- Name: account_accountid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.account_accountid_seq', 100, true);


--
-- Name: customer_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_customerid_seq', 110, true);


--
-- Name: customer_user_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_user_userid_seq', 101, true);


--
-- Name: transaction_description_descriptionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_description_descriptionid_seq', 6, true);


--
-- Name: transaction_transactionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaction_transactionid_seq', 1000, true);


--
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (accountid);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customerid);


--
-- Name: customer_user customer_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_user
    ADD CONSTRAINT customer_user_pkey PRIMARY KEY (userid);


--
-- Name: transaction_description transaction_description_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction_description
    ADD CONSTRAINT transaction_description_pkey PRIMARY KEY (descriptionid);


--
-- Name: transaction transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transactionid);


--
-- PostgreSQL database dump complete
--

