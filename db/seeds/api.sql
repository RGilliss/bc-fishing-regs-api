--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.pins DROP CONSTRAINT pins_user_id_fkey;
ALTER TABLE ONLY public.pins DROP CONSTRAINT pins_species_id_fkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.species DROP CONSTRAINT species_pkey;
ALTER TABLE ONLY public.regulations DROP CONSTRAINT regulations_pkey;
ALTER TABLE ONLY public.pins DROP CONSTRAINT pins_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.species ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.regulations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pins ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users;
DROP SEQUENCE public.species_id_seq;
DROP TABLE public.species;
DROP SEQUENCE public.regulations_id_seq;
DROP TABLE public.regulations;
DROP SEQUENCE public.pins_id_seq;
DROP TABLE public.pins;
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pins; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.pins (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    date date,
    image character varying(255),
    rating numeric,
    location point NOT NULL,
    species_id integer,
    user_id integer
);


ALTER TABLE public.pins OWNER TO me;

--
-- Name: pins_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.pins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pins_id_seq OWNER TO me;

--
-- Name: pins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.pins_id_seq OWNED BY public.pins.id;


--
-- Name: regulations; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.regulations (
    id integer NOT NULL,
    water_body character varying(255) NOT NULL,
    class_water boolean DEFAULT false,
    tributary boolean DEFAULT false,
    stocked boolean DEFAULT false,
    accessible boolean DEFAULT false,
    date_range character varying(255),
    regulation text,
    location point
);


ALTER TABLE public.regulations OWNER TO me;

--
-- Name: regulations_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.regulations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regulations_id_seq OWNER TO me;

--
-- Name: regulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.regulations_id_seq OWNED BY public.regulations.id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.species (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.species OWNER TO me;

--
-- Name: species_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.species_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_id_seq OWNER TO me;

--
-- Name: species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.species_id_seq OWNED BY public.species.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    avatar character varying(255)
);


ALTER TABLE public.users OWNER TO me;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: me
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO me;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: me
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.pins ALTER COLUMN id SET DEFAULT nextval('public.pins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.regulations ALTER COLUMN id SET DEFAULT nextval('public.regulations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.species ALTER COLUMN id SET DEFAULT nextval('public.species_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: pins; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.pins (id, title, description, date, image, rating, location, species_id, user_id) FROM stdin;
1	Alan's Spot	Best spot ever, but be aware of the bears !	2019-05-12	https://uwm.edu/field-station/wp-content/uploads/sites/380/2008/10/crayfish-1.jpg	5	(49.1037290000000013,-123.865095999999994)	9	3
2	Harris Lake tail stream	Great spot to fish! lots of midges	2020-06-24	https://imgur.com/gallery/SSWGH	5	(49.7009329019903774,-125.39192512922456)	1	1
3	Alice's favourite spot	This place is great. I go here every year.	2018-12-12	https://i.imgur.com/WNbwwfR.jpg	4.5	(50.4677999999999969,-127.409000000000006)	3	2
4	Busy Stream	Way too many people fishing here	2020-07-24	https://i.imgur.com/ZeDXXb3.jpg	2	(49.5,-125.39192512922456)	12	1
5	Tom's Sturgeon Spot	Lots of fish here!	2020-06-27	https://i.imgur.com/SxP3Rfk.jpg	4.5	(49.5,-125.5)	7	1
8	D	\N	2021-04-13	\N	\N	(49.8917554582593539,-126.370239257812514)	1	\N
9	developer	\N	2021-04-13	\N	\N	(54.7767511570995111,-124.716796875000014)	1	\N
10	d	\N	2021-04-13	\N	\N	(52.4218023168523999,-122.491598725318923)	1	\N
11	e	\N	2021-04-13	\N	\N	(50.5069382613488429,-123.464355468750014)	1	\N
12	d	\N	2021-04-13	\N	\N	(51.5161584344644794,-123.205290287733106)	1	\N
13	software	\N	2021-04-13	\N	\N	(51.6815730650009471,-117.774842977523818)	1	\N
\.


--
-- Name: pins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.pins_id_seq', 13, true);


--
-- Data for Name: regulations; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.regulations (id, water_body, class_water, tributary, stocked, accessible, date_range, regulation, location) FROM stdin;
1	AHNUHATI RIVER	t	\N	\N	\N	Apr 1-Oct 31	Class II water	(50.8938839999999999,-125.647036999999997)
2	AHNUHATI RIVER	\N	\N	\N	\N	Apr 1-June 30	Steelhead Stamp mandatory 	(50.8938839999999999,-125.647036999999997)
3	ALICE LAKE	\N	\N	\N	\N	\N	Bait ban, single barbless hook, no trout over 50 cm	(50.454182000000003,-127.401670999999993)
4	AMOR LAKE	\N	\N	\N	\N	\N	Trout daily quota = 2	(50.159829000000002,-125.559268000000003)
5	AMOR DE COSMOS CREEK	\N	\N	\N	\N	\N	No Fishing upper falls downstream 1 km to (Bear River) logging road bridge 3 km from tidewater	(50.2810300000000012,-125.649358000000007)
6	AMOR DE COSMOS CREEK	\N	\N	\N	\N	Dec 1-May 31	No Fishing from mouth to falls about 4 km upstream	(50.2810300000000012,-125.649358000000007)
7	“ANDERSON” LAKE	\N	\N	\N	\N	\N	Artificial fly only, bait ban, single barbless hook	(49.729370000000003,-125.197012000000001)
8	“ANDERSON” LAKE	\N	\N	\N	\N	\N	Trout and kokanee release at Unnamed lake in the Walbran Creek Watershed approximately 7 km west/southwest of Mt. Walbran	(49.729370000000003,-125.197012000000001)
9	ANTLER LAKE	\N	\N	t	\N	\N	No powered boats	(49.8038859999999985,-126.051309000000003)
10	ARTLISH RIVER	\N	t	\N	\N	Nov 1-Apr 30	No Fishing upstream of the boundary signs at the bridge crossing approximately 10 km from the mouth	(50.117165,-127.082854999999995)
11	ASH RIVER	\N	\N	\N	\N	\N	No Fishing from Elsie Lake to Dickson Lake	(49.3656000000000006,-124.980400000000003)
12	ASH RIVER	\N	\N	\N	\N	Dec 1-Apr 30	No Fishing from Dickson Lake to signs 200 m downstream of Lanternman Falls	(49.3656000000000006,-124.980400000000003)
13	ASH RIVER	\N	\N	\N	\N	\N	No Fishing from Dickson Falls downstream 30 m to signs	(49.3656000000000006,-124.980400000000003)
14	BAINBRIDGE LAKE	\N	\N	\N	\N	\N	No angling from boats; Youth/Disabled Accompanied Water year round	(49.204585999999999,-124.731661000000003)
15	BEAR LAKE	\N	\N	\N	\N	\N	See Cowichan Lake	(48.8143189999999976,-124.127195999999998)
16	BEAR RIVER	\N	\N	\N	\N	\N	See Amor de Cosmos Creek	(50.2810300000000012,-125.649358000000007)
17	BEAVER LAKE	\N	\N	t	\N	\N	Smallmouth bass daily quota = 4; Engine power restriction - 7.5 kW (10 hp), no towing on parts	(48.5142150000000001,-123.391712999999996)
18	BENSON RIVER	\N	t	\N	\N	\N	Fly fishing only	(50.4179960000000023,-127.371104000000003)
19	“BIG QUALICUM” RIVER	\N	\N	\N	\N	\N	See Qualicum River	(49.395465999999999,-124.617130000000003)
20	BLACK CREEK	\N	t	\N	\N	Dec 1-May 31	No Fishing	(49.8889229999999984,-125.139369000000002)
21	BLACK CREEK	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(49.8889229999999984,-125.139369000000002)
22	BLACKBURN LAKE	\N	\N	\N	\N	\N	No powered boats	(48.8219240000000028,-123.484387999999996)
23	BLACKWATER LAKE	\N	\N	\N	\N	\N	Trout daily quota = 2	(50.1675449999999969,-125.592194000000006)
24	BONANZA LAKE	\N	\N	\N	\N	\N	Bait ban, single barbless hook, no trout over 50 cm	(50.3636410000000012,-126.769857999999999)
25	BOOT LAKE	\N	\N	t	\N	\N	Bait ban, single barbless hook, trout daily quota = 2	(55.1896109999999993,-120.459877000000006)
26	BRANNEN LAKE	\N	\N	t	\N	\N	Speed restriction on parts (60 km/h)	(49.2116869999999977,-124.056109000000006)
27	BROWNS RIVER	\N	\N	\N	\N	\N	No Fishing	(49.6916060000000002,-125.061879000000005)
28	BUTTLE LAKE’S TRIBUTARIES	\N	\N	\N	\N	\N	Fly fishing only; except Thelwood Creek is closed all year	(49.814546,-125.609325999999996)
29	Thelwood Creek	\N	\N	\N	\N	\N	No fishing	(49.5662459999999996,-125.554824999999994)
30	(Lower) CAMPBELL LAKE’S TRIBUTARIES	\N	\N	\N	\N	Feb 1-July 15	No Fishing, including Campbell River between Strathcona Dam and (Lower) Campbell Lake	(49.9924170000000032,-125.447464999999994)
31	CAMPBELL RIVER	\N	\N	\N	\N	\N	No Fishing between Elk Falls and John Hart Dam Power Station	(50.0372770000000031,-125.285450999999995)
32	CAMPBELL RIVER	\N	\N	\N	\N	\N	No Fishing from Strathcona Dam downstream 100 m	(50.0372770000000031,-125.285450999999995)
33	CAMPBELL RIVER	\N	\N	\N	\N	Aug 1-Oct 31	No Fishing from the boundary sign at the end of Maple Street downstream to the boundary sign at the cement block	(50.0372770000000031,-125.285450999999995)
34	CAMPBELL RIVER	\N	\N	\N	\N	Dec 1-May 31	No Fishing in any tributaries (except Quinsam River)	(50.0372770000000031,-125.285450999999995)
35	CAMPBELL RIVER	\N	\N	\N	\N	\N	From John Hart Dam Power Station to power line crossing approximately 200 m upstream of Quinsam River confluence: fly fishing only year-round	(50.0372770000000031,-125.285450999999995)
36	CAMPBELL RIVER	\N	\N	\N	\N	Dec 1-May 31	Artificial fly only downstream of power line crossing approximately 200 m upstream of Quinsam River	(50.0372770000000031,-125.285450999999995)
37	CAMPBELL RIVER	\N	\N	\N	\N	Aug 1-Oct 31	From a fishing boundary sign at the end of Maple Street downstream to the fishing boundary sign at the cement block: No fishing for salmon Aug 1 to Oct 31	(50.0372770000000031,-125.285450999999995)
38	CAMPBELL RIVER	\N	\N	\N	\N	Oct 1-Dec 31	downstream of the confluence with the Quinsam River: 4 coho salmon per day in the aggregate, only 2 of which may be greater than 35 cm and those 2 must be hatchery marked.	(50.0372770000000031,-125.285450999999995)
39	CAMPBELL RIVER	\N	\N	\N	\N	Jul 15-Sep 15	downstream of the confluence with the Quinsam River: 4 pink salmon per day	(50.0372770000000031,-125.285450999999995)
40	CAMPBELL RIVER	\N	\N	\N	\N	\N	downstream of the confluence with the Quinsam River to the fishing boundary sign at the end of Maple Street: Chinook TBD	(50.0372770000000031,-125.285450999999995)
41	CAMPBELL RIVER	\N	\N	\N	\N	\N	No vessels between Elk Falls and John Hart Dam Power Station	(50.0372770000000031,-125.285450999999995)
42	CARNATION CREEK	\N	t	\N	\N	\N	No Fishing	(48.9140999999999977,-125.002899999999997)
43	CATHERINE CREEK	\N	\N	\N	\N	\N	No Fishing	(50.4331019999999981,-126.587087999999994)
44	CAYCUSE RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing, fly fishing only upstream of and including Hatton Creek	(48.799038000000003,-124.677597000000006)
45	CHEMAINUS RIVER	\N	\N	\N	\N	July 1-Sept 30	No Fishing downstream of Bannon Creek	(48.8414780000000022,-123.829061999999993)
46	CHEMAINUS RIVER	\N	\N	\N	\N	Oct 15-Mar 31	Coho salmon 1 per day, none over 35 cm.	(48.8414780000000022,-123.829061999999993)
47	CHEMAINUS RIVER	\N	\N	\N	\N	Dec 1-Sept 30	No Fishing upstream of Bannon Creek	(48.8414780000000022,-123.829061999999993)
48	CHEMAINUS RIVER	\N	\N	\N	\N	\N	No Fishing from Copper Canyon Falls downstream 100 m to the fishing boundary signs	(48.8414780000000022,-123.829061999999993)
49	Cayeghle River	\N	\N	\N	\N	Apr 1-Mar 31	Coho Salmon 1 per day	(50.3245799999999974,-127.428169999999994)
50	CHICADEE LAKE	\N	\N	t	\N	\N	Electric motors only	(49.3513769999999994,-122.827912999999995)
51	CLAUD ELLIOTT CREEK	\N	\N	\N	\N	\N	No Fishing	(50.3234039999999965,-126.570024000000004)
52	CLAUD ELLIOTT LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(50.3057190000000034,-126.553391000000005)
53	CLEAR LAKE (Quadra Island)	\N	\N	\N	\N	\N	Electric motors only	(50.2260800000000032,-125.247701000000006)
54	CLUXEWE RIVER	\N	t	t	\N	Dec 1-May 31	No Fishing upstream of the West Main logging road bridge (approximately 7.5 km upstream of the Hwy 19 bridge)	(50.6111580000000032,-127.176810000000003)
55	CLUXEWE RIVER	\N	\N	\N	\N	Apr 1-Mar 31	Coho Salmon 2 per day, hatchery marked fish only.	(50.6111580000000032,-127.176810000000003)
56	Conuma River	\N	\N	\N	\N	Aug 25-Dec 31	Chinook 2 per day, only 1 over 77 cm.	(49.7935000000000016,-126.440899999999999)
57	Conuma River	\N	\N	\N	\N	Aug 25-Dec 31	Coho 2 per day, hatchery marked only	(49.7935000000000016,-126.440899999999999)
58	COLQUITZ RIVER	\N	t	\N	\N	\N	No Fishing	(48.4594439999999977,-123.411111000000005)
59	COMOX LAKE	\N	\N	\N	\N	\N	No wild rainbow trout over 50 cm	(49.6188000000000002,-125.165800000000004)
60	CONSORT CREEK	\N	t	\N	\N	\N	No Fishing	(50.0979049999999972,-126.051678999999993)
61	COPPER CREEK	t	\N	\N	\N	Feb 1-Apr 30	No Fishing from Skidegate Lake to signs at second bridge 6 km upstream of tidal boundary,\nCutthroat trout release	(50.7903540000000007,-120.767323000000005)
62	COPPER CREEK	\N	\N	\N	\N	Sept 1-Apr 30	Class II water	(50.7903540000000007,-120.767323000000005)
63	COPPER CREEK	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(50.7903540000000007,-120.767323000000005)
64	COURTENAY RIVER	\N	\N	\N	\N	Dec 1-Sept 30	No Fishing; speed restriction on part (8 km/h),	(49.6811089999999993,-124.979017999999996)
65	COURTENAY RIVER	\N	\N	\N	\N	Oct 1-Dec 31	Chum Salmon 2 per day	(49.6811089999999993,-124.979017999999996)
66	COURTENAY RIVER	\N	\N	\N	\N	Oct 1-Nov 30	downstream from a fishing boundary sign located 75m downstream of the weir at the lower hatchery (excluding the Morrison Creek closure below), Chinook TBD Coho 1 per day, hatchery marked only	(49.6811089999999993,-124.979017999999996)
67	COUS CREEK	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing 	(49.1850000000000023,-124.831800000000001)
68	COWICHAN LAKE (including Bear Lake)	\N	\N	\N	\N	\N	Cutthroat trout daily quota = 2 (none over 50 cm)	(48.8797470000000018,-124.297081000000006)
69	COWICHAN LAKE (including Bear Lake)	\N	\N	\N	\N	Nov 15-Apr 15	Bait ban and single barbless hook	(48.8797470000000018,-124.297081000000006)
70	COWICHAN LAKE (including Bear Lake)	\N	\N	\N	\N	\N	Speed restriction on parts (8 km/h), plus overall 10 km/h speed restriction within 60 m of shore	(48.8797470000000018,-124.297081000000006)
71	COWICHAN RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing July 15-Aug 31\n	(48.825251999999999,-124.049460999999994)
72	COWICHAN RIVER	\N	t	\N	\N	Apr 1-Mar 31	including tributaries and Cowichan Lake, No fishing for chinook	(48.825251999999999,-124.049460999999994)
73	COWICHAN RIVER	\N	\N	\N	\N	\N	from 66 Mile Trestle downstream to the white triangle boundary sign located in Sandy Pool Regional Park Coho salmon TBD	(48.825251999999999,-124.049460999999994)
74	COWICHAN RIVER	\N	\N	\N	\N	Sep 1-Nov 15	No Fishing from the white triangle boundary sign located in Sandy Pool Regional Park, downstream to the tidal boundary.	(48.825251999999999,-124.049460999999994)
75	COWICHAN RIVER	\N	\N	\N	\N	Nov 15-Apr 15	No Fishing from weir (dam) at Cowichan Lake’s outlet to Greendale Trestle	(48.825251999999999,-124.049460999999994)
76	COWICHAN RIVER	\N	\N	\N	\N	Sept 1-Nov 15	No Fishing in tributaries upstream of and including Holt Creek Fly fishing only upstream of CNR Trestle (Mile 66)	(48.825251999999999,-124.049460999999994)
77	COWICHAN RIVER	\N	\N	\N	\N	Sept 1-Nov 15	No Fishing downstream of the CNR Mile 66 Trestle. Fly fishing only from signs at Greendale Trestle to CNR Bridge (mile 70.2)	(48.825251999999999,-124.049460999999994)
78	COWICHAN RIVER	\N	\N	\N	\N	\N	Speed restriction (8 km/h) and engine power restriction - 7.5 kW  (10 hp) on parts	(48.825251999999999,-124.049460999999994)
79	COWICHAN RIVER	\N	\N	\N	\N	Sep 1-Nov 15	downstream of the weir on Cowichan Lake to 66 Mile Trestle, Fly-Fishing Only	(48.825251999999999,-124.049460999999994)
80	CRAIGFLOWER CREEK	\N	t	\N	\N	\N	No Fishing	(48.4729710000000011,-123.458243999999993)
81	CRANE LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.1419780000000017,-125.464952999999994)
82	CRESCENT LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.120244999999997,-125.524657000000005)
83	CRUICKSHANK RIVER	\N	t	\N	\N	\N	No Fishing	(49.5800550000000015,-125.192346000000001)
84	CUSHEON LAKE	\N	\N	t	\N	\N	Electric motors only	(48.8158779999999979,-123.469519000000005)
85	DATLAMEN CREEK	t	t	\N	\N	Sept 1-Apr 30	Class II water	(53.5672429999999977,-132.488262999999989)
86	DATLAMEN CREEK	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(53.5672429999999977,-132.488262999999989)
87	DAVIE RIVER	\N	t	\N	\N	Dec 1-May 31	No Fishing downstream of Schoen Lake	(50.198678000000001,-126.572400999999999)
88	DEENA CREEK	t	\N	\N	\N	Feb 1-May 31	No Fishing upstream of fishing boundary signs posted at second bridge approximately 5 km upstream of the tidal boundary	(53.1438890000000015,-132.134444000000002)
89	DEENA CREEK	\N	\N	\N	\N	Sept 1-Apr 30	Cutthroat trout release Class II water	(53.1438890000000015,-132.134444000000002)
90	DEENA CREEK	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(53.1438890000000015,-132.134444000000002)
91	DICKSON LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(49.3975000000000009,-125.085832999999994)
92	DIMPLE LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(48.6833329999999975,-124.125556000000003)
93	DIVER LAKE	\N	\N	t	t	\N	Electric motors only;     wheelchair accessible fishing platform located in Diver Lake Park	(49.2038889999999967,-124.013610999999997)
94	DONNER LAKE	\N	\N	\N	\N	\N	No powered boats	(49.7197219999999973,-125.901667000000003)
95	DOUGAN LAKE	\N	\N	t	\N	\N	Electric motors only	(48.7150000000000034,-123.613332999999997)
96	DURRANCE LAKE	\N	\N	t	\N	\N	Electric motors only	(48.5480560000000025,-123.477778000000001)
97	ECHO LAKE	\N	\N	t	\N	\N	Electric motors only	(49.9866669999999971,-125.410278000000005)
98	ELK LAKE	\N	\N	t	t	\N	Smallmouth bass daily quota = 4	(48.5291750000000022,-123.395302000000001)
99	ELK LAKE	\N	\N	\N	\N	\N	Engine power restriction on parts - 7.5 kW (10 hp); no vessels on parts, no powered boats on parts, no towing on parts	(48.5291750000000022,-123.395302000000001)
100	ELK LAKE	\N	\N	\N	\N	\N	A wheelchair accessible fishing pier is located on the lake’s northwest shore via Brookleigh Road	(48.5291750000000022,-123.395302000000001)
101	ELK RIVER (Also see Buttle Lake)	\N	\N	\N	\N	\N	Fly fishing only	(49.8738889999999984,-125.743611000000001)
102	ENGLISHMAN RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(49.3252779999999973,-124.291388999999995)
103	ENGLISHMAN RIVER	\N	\N	\N	\N	\N	No Fishing from lower falls in Englishman River Park to signs approximately 100 m downstream	(49.3252779999999973,-124.291388999999995)
104	ENGLISHMAN RIVER	\N	\N	\N	\N	Dec 1-May 31	No Fishing downstream of the lower falls in Englishman River Falls Provincial Park to the Top Bridge crossing at the end of Allsbrook Road	(49.3252779999999973,-124.291388999999995)
105	ESARY LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(49.3222219999999965,-124.776111)
106	EVE RIVER	\N	t	\N	\N	Dec 1-May 31	No Fishing upstream of the fishing boundary signs (near the South Main Bridge crossing) located approximately 5.4 km downstream of the Hwy 19 bridge	(50.4377780000000016,-126.246667000000002)
107	FAIRY LAKE	\N	\N	\N	\N	\N	Trout daily quota = 1 (none over 50 cm); bait ban, single barbless hook; engine power restriction - 7.5 kW (10 hp)	(48.5850000000000009,-124.346110999999993)
108	FAREWELL LAKE	\N	\N	\N	\N	\N	Trout daily quota = 1 (none over 50 cm); artificial fly only, bait ban, single barbless hook	(50.2001810000000006,-125.591375999999997)
109	FICKLE LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(50.3297219999999967,-126.544721999999993)
110	FLORA LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(49.1138679999999965,-121.415412000000003)
111	FORBUSH LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(49.509444000000002,-125.229167000000004)
112	FRENCH CREEK	\N	\N	\N	\N	Dec 1-May 31	No Fishing	(49.3500000000000014,-124.349999999999994)
113	FRENCH CREEK	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(49.3500000000000014,-124.349999999999994)
114	FULLER LAKE	\N	\N	t	t	\N	Smallmouth bass daily quota = 4; electric motors only;     wheelchair accessible fishing platform is located in Fuller Lake Park	(48.9086110000000005,-123.720832999999999)
115	GLEN LAKE	\N	\N	t	\N	\N	Electric motors only; fishing platform is located in Glen Lake Park	(48.4333329999999975,-123.516670000000005)
116	GOLD LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(49.980832999999997,-125.990278000000004)
117	GOLD RIVER	\N	\N	\N	\N	\N	No Fishing upstream of the Muchalat River\n	(49.6811110000000014,-126.112499999999997)
118	GOLD RIVER	\N	\N	\N	\N	Dec 1-May 31	No Fishing downstream of the Muchalat River, but not including the Muchalat or Heber Rivers	(49.6811110000000014,-126.112499999999997)
119	GOLD RIVER	\N	\N	\N	\N	\N	No Fishing between the cascade falls (located approximately 6.5 km upstream of Muchalat Inlet, UTM 709137E, 5512420N) and fishing boundary signs approximately 80 m downstream	(49.6811110000000014,-126.112499999999997)
120	GOLD RIVER	\N	\N	\N	\N	\N	No powered boats	(49.6811110000000014,-126.112499999999997)
121	GOLDSTREAM RIVER	\N	t	\N	\N	\N	No Fishing	(51.6516670000000033,-118.622221999999994)
122	GOLDSTREAM RIVER	\N	\N	\N	\N	Apr 1-Mar 31	No Fishing for Salmon	(51.6516670000000033,-118.622221999999994)
123	GORDON RIVER 	\N	t	\N	\N	July 15-Aug 31	No Fishing 	(48.5761109999999974,-124.414444000000003)
124	GORDON RIVER 	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing upstream of Bugaboo Creek;  artificial fly only upstream of Bugaboo Creek when open	(48.5761109999999974,-124.414444000000003)
125	GRACIE LAKE	\N	\N	t	\N	\N	Electric motors only	(49.2127780000000001,-125.085555999999997)
126	GRAHAM LAKE	\N	\N	\N	\N	\N	Electric motors only	(49.5113890000000012,-124.757499999999993)
127	GREEN LAKE	\N	\N	t	\N	\N	Electric motors only	(51.4166669999999968,-121.209721999999999)
128	GREENSTONE CREEK	\N	t	\N	\N	\N	No Fishing	(50.0172219999999967,-125.571667000000005)
129	GUNFLINT LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook; electric motors only	(50.0711110000000019,-124.954443999999995)
130	HAGUE LAKE	\N	\N	\N	\N	\N	Electric motors only	(50.0616669999999999,-124.968610999999996)
131	HARRIS CREEK	\N	t	\N	\N	July 15-Aug 31	No Fishing	(48.5822220000000016,-124.275555999999995)
132	HARRIS CREEK	\N	\N	\N	\N	\N	No Fishing upstream of and including Hemmingsen Creek	(48.5822220000000016,-124.275555999999995)
133	HAREWOOD (Extension) LAKE	\N	\N	\N	\N	\N	Trout daily quota = 2	(49.0944440000000029,-123.943055999999999)
134	HASLAM CREEK	\N	\N	\N	\N	\N	No Fishing	(49.0799999999999983,-123.862499999999997)
135	HAWARTH LAKE	\N	\N	\N	\N	\N	No Fishing	(49.9277780000000035,-125.753332999999998)
136	HEALY (Panther) LAKE	\N	\N	\N	\N	\N	Trout release; fly fishing only, bait ban, single barbless hook	(49.139721999999999,-124.319166999999993)
137	HEALY LAKE’S OUTLET STREAM	\N	\N	\N	\N	\N	No Fishing	(49.139721999999999,-124.319166999999993)
138	HEBER RIVER	\N	\N	\N	\N	\N	No Fishing downstream of top of the lower canyon, located approximately 1.3 km upstream of the Gold River confluence	(49.7738889999999969,-126.051666999999995)
139	HEBER RIVER	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing upstream of top of the lower canyon	(49.7738889999999969,-126.051666999999995)
140	HEBER RIVER	\N	\N	\N	\N	May 1-Oct 31	Fly fishing only downstream of Saunders Creek to the top of the lower canyon	(49.7738889999999969,-126.051666999999995)
141	HEMMINGSEN CREEK	\N	t	\N	\N	\N	No Fishing	(48.6313889999999986,-124.254166999999995)
142	HENRY LAKE	\N	\N	\N	\N	\N	Trout release; artificial fly only, bait ban, single barbless hook	(53.7713889999999992,-123.249167)
143	HIGGENS LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.0750000000000028,-125.509721999999996)
144	HOLLAND LAKE	\N	\N	\N	\N	\N	No powered boats	(48.9480560000000011,-123.865278000000004)
145	IDA LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(50.4513889999999989,-126.813056000000003)
146	ILLUSION LAKES	\N	\N	\N	\N	\N	No powered boats	(49.3524999999999991,-124.637777999999997)
147	JASPER LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.1719440000000034,-125.405000000000001)
148	JOHN HART LAKE’S TRIBUTARIES	\N	\N	\N	\N	Apr 15-July 15	No Fishing (includes channel downstream of Ladore Dam)	(50.0463889999999978,-125.372777999999997)
149	JUNE LAKE	\N	\N	\N	\N	\N	Trout daily quota = 2	(49.4758330000000015,-125.261944)
150	KAKWEIKEN LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.8852779999999996,-125.958611000000005)
151	KAKWEIKEN RIVER	\N	t	\N	\N	Apr 1-Oct 31	Class II water	(50.8066669999999974,-126.024167000000006)
152	KAKWEIKEN RIVER	\N	\N	\N	\N	Apr 1-June 30	Steelhead Stamp mandatory	(50.8066669999999974,-126.024167000000006)
153	GREAT CENTRAL LAKE	\N	\N	\N	\N	Jan 1-Apr 30	No Fishing, from the dam to fishing boundary signs approximately 50 m upstream (southwest) of the Ash Main Bridge	(49.3500000000000014,-125.25)
154	GREAT CENTRAL LAKE	\N	\N	\N	\N	\N	Single barbless hook, no wild rainbow trout over 50 cm	(49.3500000000000014,-125.25)
155	HONNA RIVER	\N	t	\N	\N	\N	Cutthroat trout release	(53.2488889999999984,-132.131666999999993)
156	HONNA RIVER	\N	\N	\N	\N	Sept 1-Apr 30	Class II water	(53.2488889999999984,-132.131666999999993)
157	HONNA RIVER	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(53.2488889999999984,-132.131666999999993)
158	KEMP LAKE	\N	\N	t	\N	\N	No powered boats	(48.3791670000000025,-123.780833999999999)
159	KEOGH RIVER	\N	\N	\N	\N	\N	 No Fishing downstream of lower fish counting fence near tidewater\n	(50.677500000000002,-127.348332999999997)
160	KEOGH RIVER	\N	\N	\N	\N	Dec 1-May 31	No Fishing in all parts	(50.677500000000002,-127.348332999999997)
161	KINGCOME RIVER 	t	t	\N	\N	Apr 1-Oct 31	Class II water	(50.9272220000000004,-126.187222000000006)
162	KINGCOME RIVER 	\N	\N	\N	\N	Apr 1-June 30	Steelhead Stamp mandatory 	(50.9272220000000004,-126.187222000000006)
163	KOKISH RIVER	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing from boundary signs in Kokish canyon to Ida Lake	(50.5313889999999972,-126.871388999999994)
164	KOKISH RIVER	\N	\N	\N	\N	\N	No Fishing from the log boom located approximately 100 m upstream of the IPP intake to signs at the tail of the canyon pool located approximately 250 m downstream	(50.5313889999999972,-126.871388999999994)
165	KOKISH RIVER	\N	\N	\N	\N	\N	No Fishing between signs at the IPP tail race confluence downstream approximately 500 m to signs	(50.5313889999999972,-126.871388999999994)
166	KOKSILAH RIVER 	\N	t	\N	\N	Dec 1-May 31	No Fishing	(48.7508330000000001,-123.641389000000004)
167	KOKSILAH RIVER 	\N	\N	\N	\N	July 1-Sept 30	No Fishing	(48.7508330000000001,-123.641389000000004)
168	KOKSILAH RIVER 	\N	\N	\N	\N	\N	Chinook TBD	(48.7508330000000001,-123.641389000000004)
169	KOKSILAH RIVER 	\N	\N	\N	\N	Apr 1-Mar 31	Coho Salmon 1 per day, maximum size 35 cm	(48.7508330000000001,-123.641389000000004)
170	LAKE WESTON (“Weston Lake”)	\N	\N	\N	\N	\N	Trout daily quota = 1 (none over 50 cm); bait ban, single barbless hook; electric motors only	(48.7847220000000021,-123.424443999999994)
171	LANGFORD LAKE	\N	\N	t	\N	\N	Smallmouth bass daily quota = 4	(48.4480560000000011,-123.530277999999996)
172	LANGFORD LAKE	\N	\N	\N	\N	\N	Electric motors only; fishing platforms are available off Leigh Road and the Nixon Trail	(48.4480560000000011,-123.530277999999996)
173	“LINK” RIVER	\N	\N	\N	\N	\N	See Marble River	(52.3513889999999975,-127.685277999999997)
174	LITTLE MAIN LAKE (Quadra Island)	\N	\N	\N	\N	Nov 1-Apr 30	Bait ban and single barbless hook	(50.2097219999999993,-125.253056000000001)
175	LITTLE MAIN LAKE (Quadra Island)	\N	\N	\N	\N	\N	electric motors only	(50.2097219999999993,-125.253056000000001)
176	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(49.365000000000002,-124.494721999999996)
177	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	\N	 No Fishing - All tributaries	(49.365000000000002,-124.494721999999996)
178	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	Dec 1-May 31	No Fishing from the falls in Little Qualicum Falls Provincial Park downstream to the hatchery fence	(49.365000000000002,-124.494721999999996)
179	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	\N	The standard 100 m closure around a fish rearing facility has been reduced to a no fishing area from the hatchery fence to signs approximately 35 m downstream	(49.365000000000002,-124.494721999999996)
180	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	Sept 1-Nov 30	Fly fishing only (where open)	(49.365000000000002,-124.494721999999996)
181	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	Sept 1-Nov 30	All Salmon species Fly FIshing Only	(49.365000000000002,-124.494721999999996)
182	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	Apr 1-Mar 31	No Fishing from the hatchery fence to signs located approximately 35 meters downstream 	(49.365000000000002,-124.494721999999996)
183	LITTLE QUALICUM RIVER 	\N	\N	\N	\N	Dec 1 to May 31	No fishing from the falls in Little Qualicum Falls Provincial Park downstream to the hatchery fence	(49.365000000000002,-124.494721999999996)
184	LIZARD LAKE	\N	\N	t	\N	\N	Trout daily quota = 2; bait ban, single barbless hook; electric motors only	(51.0733329999999981,-123.166111000000001)
185	LIZARD POND	\N	\N	\N	\N	\N	Trout daily quota = 1; artificial fly only, bait ban, single barbless hook	(47.1917380000000009,-67.0516180000000048)
186	LOIS LAKE	\N	\N	t	\N	\N	Trout daily quota = 1; artificial fly only, bait ban, single barbless hook	(49.4210449999999994,-125.134991999999997)
187	LONG LAKE (Nanaimo)	\N	\N	t	t	\N	Speed restriction on parts (60 km/h);     wheelchair accessible fishing platform is located in Loudon Park	(49.2113799999999983,-124.019419999999997)
188	LOON LAKE	\N	\N	t	\N	\N	Electric motors only	(49.2531419999999969,-124.700176999999996)
189	MACKTUSH CREEK	\N	\N	\N	\N	\N	No Fishing	(49.1111110000000011,-124.826389000000006)
190	MAGGIE LAKE	\N	\N	\N	\N	\N	No wild rainbow trout over 50 cm; bait ban, single barbless hook	(49.0102400000000031,-125.436592000000005)
191	MAHATTA RIVER	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing	(50.4666670000000011,-127.799999999999997)
192	MAIN LAKE (Quadra Island)	\N	\N	\N	\N	Nov 1-Apr 30	Bait ban and single barbless hook	(50.2148370000000028,-125.209170999999998)
193	MAIN LAKE (Quadra Island)	\N	\N	\N	\N	\N	Engine power restriction - 7.5 kW (10 hp)	(50.2148370000000028,-125.209170999999998)
194	MAMIN RIVER	t	t	\N	\N	Sept 1-Apr 30	Class II water	(53.6211109999999991,-132.310278000000011)
195	MAMIN RIVER	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(53.6211109999999991,-132.310278000000011)
196	MAMIN RIVER	\N	\N	\N	\N	Feb 1-Apr 30	No Fishing upstream of fishing boundary signs posted on third bridge approximately 10 km upstream of the tidal boundary	(53.6211109999999991,-132.310278000000011)
197	MAPLE LAKE	\N	\N	t	\N	\N	Electric motors only	(49.6381670000000028,-125.016414999999995)
198	MARBLE (“Link”) RIVER (only between\nVictoria and Alice lakes)	\N	\N	\N	\N	\N	Fly fishing only ■	(50.4358969999999971,-127.392883999999995)
199	MARTHA LAKE	\N	\N	t	\N	\N	Trout release; bait ban, single barbless hook	(50.0300999999999974,-125.627469000000005)
200	MATHESON LAKE 	\N	\N	t	\N	\N	Electric motors only	(48.3639700000000019,-123.601033999999999)
201	“MAXWELL LAKE” (Lake Maxwell)	\N	\N	\N	\N	\N	Electric motors only	(48.8230780000000024,-123.545928000000004)
202	MAYO LAKE	\N	\N	t	\N	\N	Youth/Disabled Accompanied Water 	(48.8025019999999969,-123.954179999999994)
203	MCKENZIE LAKE	\N	\N	\N	\N	\N	No powered boats	(49.6838890000000006,-125.263056000000006)
204	MCNAIR LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.2263110000000026,-125.576544999999996)
205	MEGIN LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(49.4917310000000015,-126.074346000000006)
206	MICHAEL LAKE 	\N	\N	\N	\N	\N	  No powered boats	(49.0408899999999974,-123.810355999999999)
207	MILLER CREEK	\N	t	\N	\N	\N	No Fishing	(49.9858329999999995,-125.451110999999997)
208	MOHUN CREEK     	\N	t	\N	\N	Dec 1-May 31	No Fishing	(50.1119440000000012,-125.373889000000005)
209	MOHUN CREEK     	\N	\N	\N	\N	\N	No Fishing from Menzies Bay logging mainline bridge crossing to Morton Lake.	(50.1119440000000012,-125.373889000000005)
210	MISTY LAKE	\N	\N	\N	\N	\N	No Fishing (located in an Ecological Reserve)	(50.6072220000000002,-127.263056000000006)
211	MORTE LAKE	\N	\N	\N	\N	\N	Electric motors only	(50.144444,-125.298889000000003)
212	MUCHALAT RIVER	\N	t	\N	\N	Dec 1-May 15	No Fishing	(49.8425000000000011,-126.093333000000001)
213	MUCHALAT RIVER	\N	\N	\N	\N	\N	No wild rainbow trout over 50 cm	(49.8425000000000011,-126.093333000000001)
214	MYRA LAKE	\N	\N	\N	\N	\N	No Fishing	(49.9830559999999977,-125.750833)
215	NAHMINT LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook; engine power restriction 7.5 kW (10 hp)	(49.1602779999999981,-125.022778000000002)
216	NAHMINT RIVER	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing Nahmint River (upstream and downstream of the lake)	(49.0622219999999984,-124.884167000000005)
217	NAHMINT RIVER	\N	\N	\N	\N	\N	fly fishing only upstream of Nahmint Lake when open	(49.0622219999999984,-124.884167000000005)
218	NAHMINT RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(49.0622219999999984,-124.884167000000005)
219	NAHMINT RIVER	\N	\N	\N	\N	\N	No Fishing from power line crossing at “Bore Hole” upstream to fishing boundary signs at the mouth of Boulder Creek	(49.0622219999999984,-124.884167000000005)
220	Nahwitti River	\N	\N	\N	\N	Apr 1-Mar 31	Coho one per day	(50.8586110000000033,-128.00805600000001)
221	NANAIMO RIVER	\N	\N	\N	\N	Sept 15-Oct 30	No Fishing from the Cedar Road Bridge upstream approximately 400 m to the white square boundary signs near the Hwy 19 bridge	(49.1383330000000029,-123.895555999999999)
222	NANAIMO RIVER	\N	\N	\N	\N	Dec 1-May 31	No Fishing upstream of the Hwy 1 bridge■	(49.1383330000000029,-123.895555999999999)
223	NANAIMO RIVER	\N	\N	\N	\N	\N	Artificial fly only upstream of the westernmost of the two Nanaimo Lakes, known locally as “Second” Lake, including tributaries	(49.1383330000000029,-123.895555999999999)
224	NANAIMO RIVER	\N	\N	\N	\N	\N	Engine power restriction on parts - 7.5 kW (10 hp)	(49.1383330000000029,-123.895555999999999)
225	NANAIMO RIVER	\N	\N	\N	\N	Oct 15-Mar 31	including tributaries, except in the area described below. 1 Coho per day, maximum size 35 cm	(49.1383330000000029,-123.895555999999999)
226	NANAIMO RIVER	\N	\N	\N	\N	Jan 1-Dec 31	No fishing Salmon from the power line crossing at "Bore Hole" upstream to the fishing boundary signs at the mouth of Boulder Creek	(49.1383330000000029,-123.895555999999999)
227	NANAIMO RIVER	\N	\N	\N	\N	Sep 15-Oct 30	No fishing salmon Cedar Road Bridge upstream approx. 400 m to the fishing boundary sign located near the Hwy 19 bridge crossing	(49.1383330000000029,-123.895555999999999)
228	NANAIMO RIVER	\N	\N	\N	\N	Nov 1-Dec 31	Coho 2 per day, hatchery marked only, Chum 2 per day from the upstream side of the Cedar Road Bridge, upstream to the downstream side of the Highway 1 overpass.	(49.1383330000000029,-123.895555999999999)
229	NIMPKISH RIVER	\N	t	\N	\N	Dec 1-May 15	No Fishing upstream of Davie River	(50.5663890000000009,-126.981943999999999)
230	NITINAT LAKE	\N	\N	\N	\N	\N	Note: Nitinat Lake is tidal water; tidal regulations apply and a (federal) Tidal Waters Sport Fishing Licence is required	(48.7386109999999988,-124.760833000000005)
231	NITINAT RIVER	\N	t	\N	\N	\N	Exempt from July 15-Aug 31 summer closure	(48.8213890000000035,-124.681944000000001)
232	NITINAT RIVER	\N	\N	\N	\N	\N	No Fishing upstream of Parker Creek	(48.8213890000000035,-124.681944000000001)
233	NITINAT RIVER	\N	\N	\N	\N	Aug 25-Dec 31	No Fishing between fishing boundary signs approximately 100 m upstream of and downstream of “Red Rock Pool,” approximately 2 km (by road) south of the Nitinat River Bridge	(48.8213890000000035,-124.681944000000001)
234	NITINAT RIVER	\N	\N	\N	\N	Aug 25-Oct 15	No Fishing between boundary signs approximately 50 m upstream of and downstream of the Nitinat River Bridge	(48.8213890000000035,-124.681944000000001)
235	NITINAT RIVER	\N	\N	\N	\N	Apr 1-Mar 31	No fishing for salmon upstream of Parker Creek	(48.8213890000000035,-124.681944000000001)
236	NITINAT RIVER	\N	\N	\N	\N	Aug 25-Sep 30	Chinook 2 per day, only 1 over 77 cm downstream of Parker Creek, except for areas with finfish closure	(48.8213890000000035,-124.681944000000001)
237	NITINAT RIVER	\N	\N	\N	\N	Oct 16-Dec 31	Coho 2 per day downstream of Parker Creek, except for areas with finfish closure	(48.8213890000000035,-124.681944000000001)
238	NITINAT RIVER	\N	\N	\N	\N	Oct 16-Dec 31	Chum 2 per day downstream of Parker Creek, except for areas with finfish closure	(48.8213890000000035,-124.681944000000001)
239	NITINAT RIVER	\N	\N	\N	\N	Aug 25-Oct 15	Finfish closure at Nitinat River from 50m upstream to 50m downstream of the Nitinat River bridge.	(48.8213890000000035,-124.681944000000001)
240	NITINAT RIVER	\N	\N	\N	\N	Apr 1-Mar 31	Finfish closure from the powerline crossing upstream of the Nitinat River Hatchery water intake, downstream to the lowest point of confluence with the Little Nitinat River and then perpendicular to the flow of the Nitinat River, to the opposite shore	(48.8213890000000035,-124.681944000000001)
241	NITINAT RIVER	\N	\N	\N	\N	Aug 25-Dec 31	Finfish closure between fishing boundary signs located approximately 100m above and below Red Rock Pool.	(48.8213890000000035,-124.681944000000001)
242	NOLA LAKE	\N	\N	\N	\N	\N	No Fishing	(49.9641670000000033,-125.750277999999994)
243	OYSTER RIVER	\N	\N	t	\N	Dec 1-June 30	No Fishing upstream of the confluence with Little Oyster River■	(49.8725000000000023,-125.115832999999995)
244	OYSTER RIVER	\N	\N	\N	\N	\N	Exempt from July 15-Aug 31 summer closure. 	(49.8725000000000023,-125.115832999999995)
245	O’CONNELL LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(50.3919440000000023,-127.723889)
246	PALLANT CREEK 	t	t	\N	\N	Sept 1-Apr 30	Class II water	(53.0519439999999989,-132.03222199999999)
247	PALLANT CREEK 	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(53.0519439999999989,-132.03222199999999)
248	PANTHER LAKE	\N	\N	\N	\N	\N	See Healy Lake	(49.6852779999999967,-125.316389000000001)
249	PERRY LAKE	\N	\N	\N	\N	\N	Trout daily quota = 1 (none over 50 cm); bait ban, single barbless hook	(49.8838890000000035,-126.581666999999996)
250	“PETE’S POND” Unnamed lake at the\nhead of San Juan River	\N	\N	\N	\N	\N	Trout release; artificial fly only, bait ban, single barbless hook	(48.7209900000000005,-123.980019999999996)
251	PRIOR LAKE	\N	\N	t	\N	\N	No powered boats	(48.4763889999999975,-123.466943999999998)
252	PROSPECT LAKE 	\N	\N	t	\N	\N	Smallmouth bass daily quota = 4; speed restriction on parts (8 and 60 km/h)	(53.9747219999999999,-131.750278000000009)
253	PROVOST DAM	\N	\N	\N	\N	\N	No powered boats	(48.8471959999999967,-123.749852000000004)
254	PUNTLEDGE RIVER	\N	\N	\N	\N	\N	Exempt from July 15-Aug 31 summer closure	(49.6977990000000034,-124.996210000000005)
255	PUNTLEDGE RIVER	\N	\N	\N	\N	\N	Fly fishing only upstream of the BC Hydro diversion dam (approximately 3.5 km downstream of Comox Lake), including tributaries	(49.6977990000000034,-124.996210000000005)
256	PUNTLEDGE RIVER	\N	\N	\N	\N	\N	No Fishing tributaries	(49.6977990000000034,-124.996210000000005)
257	PUNTLEDGE RIVER	\N	\N	\N	\N	\N	No Fishing from fishing boundary signs located 50 m upstream of the BC Hydro generating station tailrace to signs located 75 m downstream of the Puntledge River hatchery fence (total distance approximately 500 m)	(49.6977990000000034,-124.996210000000005)
258	PUNTLEDGE RIVER	\N	\N	\N	\N	\N	No Fishing between fishing boundary signs approximately 100 m upstream and downstream of the confluence with Morrison Creek	(49.6977990000000034,-124.996210000000005)
259	PUNTLEDGE RIVER	\N	\N	\N	\N	\N	No Fishing downstream of the BC Hydro diversion dam (approximately 3.5 km downstream of Comox Lake) to the base of Stotan Falls (approximately 450 m downstream of the Duncan Bay Mainline logging road bridge)	(49.6977990000000034,-124.996210000000005)
260	PUNTLEDGE RIVER	\N	\N	\N	\N	Apr 1 to Mar 31	No fishing for salmon from the weir at the lower hatchery to fishing boundary signs approximately 75m downstream of the weir.	(49.6977990000000034,-124.996210000000005)
261	PUNTLEDGE RIVER	\N	\N	\N	\N	Oct 1 to Nov 30	Coho Salmon 1 per day, hatchery marked only downstream from a fishing boundary sign located 75m downstream of the weir at the lower hatchery (excluding the Morrison Creek closure below).	(49.6977990000000034,-124.996210000000005)
262	PUNTLEDGE RIVER	\N	\N	\N	\N	Oct 1 to Dec 31	Chum 2 per day downstream from a fishing boundary sign located 75m downstream of the weir at the lower hatchery (excluding the Morrison Creek closure below).	(49.6977990000000034,-124.996210000000005)
263	PUNTLEDGE RIVER	\N	\N	\N	\N	Apr 1 to Mar 31	Finfish closure at Morrison Creek closure: between fishing boundary signs located 100m upstream and downstream of the confluence with Morrison Creek.	(49.6977990000000034,-124.996210000000005)
264	QUALICUM RIVER	\N	\N	\N	\N	\N	No Fishing downstream of boundary signs located approximately 100 m downstream of the hatchery counting fence	(49.3980559999999969,-124.610277999999994)
265	QUALICUM RIVER	\N	\N	\N	\N	Aug 15-Oct 15	No Fishing from the upper hatchery weir (located 125 m downstream of the E&N Trestle) to boundary sign: located approximately 100 m downstream of the hatchery counting fence	(49.3980559999999969,-124.610277999999994)
266	QUALICUM RIVER	\N	\N	\N	\N	\N	No Fishing tributaries	(49.3980559999999969,-124.610277999999994)
267	QUALICUM RIVER	\N	\N	\N	\N	\N	Single barbless hook, no hooks greater than 15 mm from point to shank	(49.3980559999999969,-124.610277999999994)
268	QUALICUM RIVER	\N	\N	\N	t	\N	Exempt from July 15-Aug 31 summer closure	(49.3980559999999969,-124.610277999999994)
269	QUALICUM RIVER	\N	\N	\N	\N	\N	wheelchair accessible fishing platform is located at the hatchery	(49.3980559999999969,-124.610277999999994)
270	QUALICUM RIVER	\N	\N	\N	\N	Sept 30 to Dec 31	Coho 2 per day at those waters upstream of the Big Qualicum Hatchery upper weir (located approximately 125 m downstream of the E&N railway bridge).	(49.3980559999999969,-124.610277999999994)
271	QUALICUM RIVER	\N	\N	\N	\N	Aug 15 to Oct 15	Pink Salmon 4 per day at those waters upstream of the Big Qualicum Hatchery upper weir (located approximately 125 m downstream of the E&N railway bridge).	(49.3980559999999969,-124.610277999999994)
272	QUALICUM RIVER	\N	\N	\N	\N	Aug 15 to Oct 15	No fishing for salmon downstream of the upper weir (located approximately 125 m downstream of the E&N railway bridge) to the QFN boundary fence located approximately 100 m downstream of the hatchery counting fence	(49.3980559999999969,-124.610277999999994)
273	QUALICUM RIVER	\N	\N	\N	\N	Apr 1 to Mar 31	No fishing for salmon from the Reserve boundary below the Big Qualicum hatchery downstream to the Hwy 19A bridge	(49.3980559999999969,-124.610277999999994)
274	QUALICUM RIVER	\N	\N	\N	\N	\N	\N	(49.3980559999999969,-124.610277999999994)
275	QUATSE RIVER	\N	t	t	\N	May 1-June 15	No Fishing	(50.6997220000000013,-127.480000000000004)
276	QUATSE RIVER	\N	\N	\N	\N	\N	Hatchery steelhead daily quota = 1	(50.6997220000000013,-127.480000000000004)
277	QUATSE RIVER	\N	\N	\N	\N	Dec 1-June 15	No Fishing upstream of the Quatse River fishway (approximately 1.4 km upstream of Dick Booth Creek)	(50.6997220000000013,-127.480000000000004)
278	QUATSE RIVER	\N	\N	\N	\N	May 1-Nov 30	Bait ban	(50.6997220000000013,-127.480000000000004)
279	QUATSE RIVER	\N	\N	\N	\N	Jun 15 to Mar 31	Coho 2 per day, hatchery marked fish only.	(50.6997220000000013,-127.480000000000004)
280	QUATSE RIVER	\N	\N	\N	\N	Apr 1 to Mar 31	No fishing 100m upstream and downstream of the Quatse River Hatchery weir	(50.6997220000000013,-127.480000000000004)
281	QUENNELL LAKE	\N	\N	t	\N	\N	Smallmouth bass daily quota = 4; speed restriction on parts (8 km/h)	(49.067222000000001,-123.819721999999999)
282	QUINSAM RIVER	\N	t	\N	t	\N	No Fishing from the fishing boundary signs at power line crossing (approximately 25 m upstream of Quinsam Hatchery weir) to fishing boundary signs approximately 300 m downstream of weir\n	(50.0375000000000014,-125.293888999999993)
283	QUINSAM RIVER	\N	\N	\N	\N	Dec 1-June 30	No Fishing from the falls situated downstream of Middle Quinsam Lake to the fishing boundary signs at power line crossing (approximately 25 m upstream of the Quinsam hatchery weir)	(50.0375000000000014,-125.293888999999993)
284	QUINSAM RIVER	\N	\N	\N	\N	\N	Exempt from July 15-Aug 31 summer closure	(50.0375000000000014,-125.293888999999993)
285	QUINSAM RIVER	\N	\N	\N	\N	\N	wheelchair accessible fishing platform is located near the Hwy 28 Bridge	(50.0375000000000014,-125.293888999999993)
286	QUINSAM RIVER	\N	\N	\N	\N	Oct 1-Dec 31	4 coho per day in the aggregate, only two of which may be greater than 35 cm and those two must be hatchery marked.	(50.0375000000000014,-125.293888999999993)
287	QUINSAM RIVER	\N	\N	\N	\N	July 24-Sep 15	4 Pink salmon per day	(50.0375000000000014,-125.293888999999993)
288	REAY CREEK	\N	\N	\N	\N	Apr 1-Mar 31	No fishing for salmon	(48.6336110000000019,-123.406666999999999)
289	REGAN LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(49.8194439999999972,-125.314443999999995)
290	REGINALD LAKE	\N	\N	t	\N	\N	Trout release; bait ban, single barbless hook	(49.9938890000000029,-125.538611000000003)
291	ROBERTS LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(50.2224999999999966,-125.543056000000007)
292	ROGERS CREEK	\N	\N	\N	\N	Dec 1-Apr 30	No Fishing	(49.2550000000000026,-124.811943999999997)
293	ROSELLE LAKE	\N	\N	\N	\N	\N	Trout daily quota = 2	(50.519444,-126.989444000000006)
294	ROSEN LAKE (Read Island)	\N	\N	\N	\N	\N	No powered boats	(50.1543729999999996,-125.127848)
295	ROWBOTHAM LAKE	\N	\N	\N	\N	\N	Trout release; artificial fly only, bait ban, single barbless hook	(49.2280560000000023,-124.5)
296	ST. MARY LAKE	\N	\N	t	\N	\N	Electric motors only	(48.8916669999999982,-123.545556000000005)
297	SAN JUAN RIVER	\N	t	\N	\N	\N	No Fishing upstream of Fleet River	(48.5597220000000007,-124.398611000000002)
298	SAN JUAN RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(48.5597220000000007,-124.398611000000002)
299	SAN JUAN RIVER	\N	\N	\N	\N	\N	Coho Opportunities dependent on in-season coho run size (coho over 35 cm) at the waters of the San Juan River and its tributaries downstream of the Fleet River that are open to fishing for salmon	(48.5597220000000007,-124.398611000000002)
300	SEYMOUR RIVER	\N	\N	\N	\N	Aug 15-Oct 31	Class II water	(51.1930559999999986,-126.672499999999999)
301	SEYMOUR RIVER	\N	\N	\N	\N	\N	Steelhead Stamp not required unless fishing for steelhead	(51.1930559999999986,-126.672499999999999)
302	SEYMOUR RIVER	\N	\N	\N	\N	Apr 1 to Mar 31	Coho 2 per day	(51.1930559999999986,-126.672499999999999)
303	SHAWNIGAN CREEK	\N	\N	\N	\N	Apr 1 to Mar 31	No Fishing for Salmon	(48.6555559999999971,-123.559443999999999)
304	SHAWNIGAN LAKE	\N	\N	t	\N	\N	Smallmouth bass daily quota = 4; Speed restrictions on parts (8 and 65 km/h)	(48.6577780000000004,-123.626390000000001)
305	SALMON RIVER 	\N	t	\N	\N	\N	No Fishing upstream of Kay Creek	(50.3730559999999983,-125.929721999999998)
306	SALMON RIVER 	\N	\N	\N	\N	\N	No powered boats upstream of confluence with White River; speed restriction (10 km/h) from estuary to confluence with White River	(50.3730559999999983,-125.929721999999998)
307	SOMASS RIVER	\N	\N	t	\N	\N	No Fishing between the tidal boundary at Papermill Dam to boundary signs approximately 1.0 km upstream (Falls Road Gravel Pit and the southern most end of Collins Farm/Arrow Vale Campground on Hector Road), Aug 25-Nov 15	(49.2463890000000006,-124.819999999999993)
308	SOMASS RIVER	\N	\N	\N	\N	June 1-Aug 24	Bait ban	(49.2463890000000006,-124.819999999999993)
309	SOMASS RIVER	\N	\N	\N	\N	\N	Engine power restriction 7.5 kW (10 hp)	(49.2463890000000006,-124.819999999999993)
310	SOMASS RIVER	\N	\N	\N	\N	Aug 25 to Dec 31	Chinook 2 per day, 1 of which may be more than 77cm in length, except in the areas with restrictions	(49.2463890000000006,-124.819999999999993)
311	SOMASS RIVER	\N	\N	\N	\N	Aug 25 to Dec 31	Coho 2 per day except in the areas with restrictions	(49.2463890000000006,-124.819999999999993)
312	SOMASS RIVER	\N	\N	\N	\N	Aug 25 to Nov 15	Finfish closure from the tidal boundary at the Papermill Dam to white triangular fishing boundary signs approximately 0.5 km upstream (Falls Road Gravel Pit and the southernmost end of Collins Farm/Arrow Vale Campground-Hector Road).	(49.2463890000000006,-124.819999999999993)
313	SOMASS RIVER	\N	\N	\N	\N	July 1-July 23	Sockeye 1 per day between 5:00 am to 10:00 pm only at that portion of the Somass River located approximately 200 meters above and 150 metres below the island near the boat launch at Somass Park near Service Road.	(49.2463890000000006,-124.819999999999993)
314	SOOKE RIVER	\N	t	\N	\N	Sept 1-Nov 30	Fly fishing only downstream of Sooke River Falls	(48.3838890000000035,-123.698888999999994)
315	SOOKE RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(48.3838890000000035,-123.698888999999994)
316	SOOKE RIVER	\N	\N	\N	\N	\N	No Fishing from the base of the lower “potholes” falls to signs approximately 100 m downstream	(48.3838890000000035,-123.698888999999994)
317	SPIDER LAKE	\N	\N	t	\N	\N	Smallmouth bass daily quota = 4;  no powered boats	(49.3436110000000028,-124.628332999999998)
318	SPROAT LAKE	\N	\N	\N	\N	\N	Cutthroat trout release, no wild rainbow trout over 50 cm; single barbless hook	(49.2833329999999989,-124.916669999999996)
319	SPROAT RIVER	\N	\N	\N	\N	May 1-Oct 31	Bait ban	(49.293332999999997,-124.881944000000004)
320	SPROAT RIVER	\N	\N	\N	\N	Apr 1-Mar 31	No retention of salmon	(49.293332999999997,-124.881944000000004)
321	SPROAT RIVER	\N	\N	\N	\N	Jun 15-Nov 15	Finfish closure from Sproat River from Sproat Lake to fishing boundary signs approx. 300m downstream of Hwy 4	(49.293332999999997,-124.881944000000004)
322	STAMP RIVER	\N	\N	t	\N	June 15-Nov 15	No Fishing between fishing boundary signs 200 m upstream of and 500 m downstream of Stamp Falls	(49.2941670000000016,-124.883332999999993)
323	STAMP RIVER	\N	\N	\N	\N	Jan 1-Apr 30	No Fishing from the confluence with Ash River upstream to the Great Central Lake dam	(49.2941670000000016,-124.883332999999993)
324	STAMP RIVER	\N	\N	\N	\N	\N	Bait ban all year upstream of signs at “Girl Guide Falls” (approximately 250 m upstream of the mouth of Beaver Creek)	(49.2941670000000016,-124.883332999999993)
325	STAMP RIVER	\N	\N	\N	\N	June 1-Aug 24	Bait ban downstream of signs at “Girl Guide Falls” (approximately 250 m upstream of the mouth of Beaver Creek)	(49.2941670000000016,-124.883332999999993)
326	STAMP RIVER	\N	\N	\N	\N	\N	Engine power restriction 7.5 kW (10 hp), on parts	(49.2941670000000016,-124.883332999999993)
327	STAMP RIVER	\N	\N	\N	\N	Aug 25-Dec 31	Chinook 2 per day, 1 of which may be more than 77 cm. in length, except in areas with restrictions	(49.2941670000000016,-124.883332999999993)
328	STAMP RIVER	\N	\N	\N	\N	Aug 25-Dec 31	Coho 2 per day	(49.2941670000000016,-124.883332999999993)
329	STAMP RIVER	\N	\N	\N	\N	\N	\N	(49.2941670000000016,-124.883332999999993)
330	STAMP RIVER	\N	\N	\N	\N	\N	\N	(49.2941670000000016,-124.883332999999993)
331	STAMP RIVER	\N	\N	\N	\N	\N	\N	(49.2941670000000016,-124.883332999999993)
332	STEWART LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook; electric motors only	(50.0463889999999978,-126.007778000000002)
333	STOCKING LAKE	\N	\N	\N	\N	\N	No powered boats	(48.9597219999999993,-123.825277999999997)
334	“STOWELL LAKE” (Lake Stowell)	\N	\N	t	\N	\N	Electric motors only	(48.7815360000000027,-123.443635999999998)
335	STRAMBERG LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook; electric motors only	(50.1902779999999993,-125.247221999999994)
336	STRATHCONA PARK WATERS	\N	\N	\N	\N	\N	No powered boats on any water within Strathcona Park except Gold, Upper Campbell and Buttle lakes	(49.8383899999999969,-125.620587)
337	TADJISS LAKE	\N	\N	t	\N	\N	Trout daily quota = 1; artificial fly only, bait ban, single barbless hook	(48.6919439999999994,-123.864444000000006)
338	TAYLOR RIVER	\N	\N	\N	\N	\N	Fly fishing only	(49.2855559999999997,-125.208888999999999)
339	THELWOOD CREEK	\N	\N	\N	\N	\N	No Fishing	(49.5600000000000023,-125.554721999999998)
340	THETIS LAKE	\N	\N	t	\N	\N	Electric motors only	(48.4687569999999965,-123.471132999999995)
341	TLELL RIVER	\N	t	\N	\N	\N	Cutthroat trout release	(53.6186110000000014,-131.932778000000013)
342	TLELL RIVER	\N	\N	\N	\N	Sept 1-Apr 30	Class II water	(53.6186110000000014,-131.932778000000013)
343	TLELL RIVER	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(53.6186110000000014,-131.932778000000013)
344	TLELL RIVER	\N	\N	\N	\N	\N	Tidal waters regulations apply to waters downstream of tidal boundary sign located 1.5 km upstream of Hwy 16 Bridge	(53.6186110000000014,-131.932778000000013)
345	SPROAT RIVER	\N	\N	\N	\N	June 15-Nov 15	No Fishing from Sproat Lake to fishing boundary signs approximately 300 m downstream of Hwy 4	(49.293332999999997,-124.881944000000004)
346	SPROAT RIVER	\N	\N	\N	\N	May 1-Oct 31	Bait ban	(49.293332999999997,-124.881944000000004)
347	TLOWILS LAKE	\N	\N	\N	\N	\N	Electric motors only	(50.2591669999999979,-125.998333000000002)
348	TLOOLS LAKE	\N	\N	\N	\N	\N	No Fishing	(49.9386110000000016,-125.750556000000003)
349	TOQUART LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(49.0844829999999988,-125.354738999999995)
350	TOQUART RIVER	\N	t	\N	\N	\N	Fly fishing only upstream of the Toquart mainline logging bridge when open	(49.0429469999999981,-125.359988000000001)
351	TOQUART RIVER	\N	\N	\N	\N	Nov 1-May 31	No Fishing upstream of the boundary sign located near the falls approximately 800 m downstream of Toquart Lake (including the Upper Toquart River). Note:  this includes the\nriver upstream of the lake	(49.0429469999999981,-125.359988000000001)
352	TOY LAKE	\N	\N	\N	\N	\N	Trout daily quota = 2; bait ban, single barbless hook	(49.4555560000000014,-125.282499999999999)
353	TRENT RIVER	\N	t	\N	\N	Dec 1-May 31	No Fishing	(49.6438890000000015,-124.930000000000007)
354	TRENT RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(49.6438890000000015,-124.930000000000007)
355	TSABLE RIVER	\N	t	\N	\N	Dec 1-May 31	No Fishing	(49.5186109999999999,-124.829722000000004)
356	TSABLE RIVER	\N	\N	\N	\N	July 15-Aug 31	No Fishing	(49.5186109999999999,-124.829722000000004)
357	TSABLE LAKE	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(49.533056000000002,-125.110277999999994)
358	TSITIKA RIVER	\N	\N	\N	\N	\N	No Fishing upstream of Catherine Creek, Nov 1-Apr 30, fly fishing only downstream of Catherine Creek	(50.480556,-126.586388999999997)
359	TSOLUM RIVER	\N	t	\N	\N	\N	No Fishing	(49.6958330000000004,-124.994167000000004)
360	UNNAMED LAKE “A”	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.2194330000000022,-125.582575000000006)
361	UNNAMED LAKE “B” - MAP A	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.1925930000000022,-125.639660000000006)
362	UNNAMED LAKE “C” - MAP	\N	\N	\N	\N	\N	Trout daily quota = 2; bait ban, single barbless hook	(50.1349299999999971,-125.479331000000002)
363	UNNAMED LAKE “D” - MAP B 	\N	\N	\N	\N	\N	Trout daily quota = 2; bait ban, single barbless hook	(50.1197749999999971,-125.478147000000007)
364	UNNAMED LAKE “E” - MAP	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.1058540000000008,-125.465839000000003)
365	UNNAMED LAKE “F” - MAP B	\N	\N	\N	\N	\N	Trout daily quota = 2; bait ban, single barbless hook	(50.0807649999999995,-125.476949000000005)
366	UNNAMED LAKE “G” - MAP	\N	\N	\N	\N	\N	Trout daily quota = 2; bait ban, single barbless hook	(50.074421000000001,-125.476208999999997)
367	UNNAMED LAKE “H” - MAP B	\N	\N	\N	\N	\N	Trout release; bait ban, single barbless hook	(50.076318999999998,-125.412003999999996)
368	UNNAMED LAKE “I” - MAP B	\N	\N	\N	\N	\N	Trout daily quota = 2; bait ban, single barbless hook	(50.0642029999999991,-125.414085999999998)
369	VILLAGE BAY LAKE	\N	\N	\N	\N	Nov 1-Apr 30	Bait ban and single barbless hook	(50.1833329999999975,-125.196388999999996)
370	VILLAGE BAY LAKE	\N	\N	\N	\N	\N	Engine power restriction - 7.5 kW (10 hp)	(50.1833329999999975,-125.196388999999996)
371	WAHPEETO CREEK	\N	\N	\N	\N	\N	No Fishing within 100 m downstream of the falls situated approximately 4.5 km upstream of Wakeman River	(51.1450000000000031,-126.482500000000002)
372	WAKEMAN RIVER	\N	t	\N	\N	Apr 1-Oct 31	Class II water	(51.037778000000003,-126.518056000000001)
373	WAKEMAN RIVER	\N	\N	\N	\N	Apr 1-June 30	Steelhead Stamp mandatory	(51.037778000000003,-126.518056000000001)
374	Washlawlis River        	\N	\N	\N	\N	Apr 1-Mar 31	Coho 1 per day	(50.3599999999999994,-127.25)
375	Waukwaas River	\N	\N	\N	\N	Apr 1-Mar 31	Coho 1 per day	(50.3500000000000014,-127.25)
376	“WESTON LAKE”	\N	\N	\N	\N	\N	See Lake Weston	(48.7842040000000026,-123.425736000000001)
377	WESTWOOD LAKE	\N	\N	t	t	\N	Smallmouth bass daily quota = 4. wheelchair accessible fishing platform is located in Westwood Lake Park	(49.1608560000000026,-124.001410000000007)
378	WHITE RIVER	\N	t	\N	\N	\N	No Fishing between fishing boundary signs at the salmon viewing pool	(50.1417870000000008,-126.035876999999999)
379	WHITE RIVER	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing upstream of the Sayward Road Bridge crossing	(50.1417870000000008,-126.035876999999999)
380	WILLEMAR LAKE	\N	\N	\N	\N	\N	No trout over 50 cm; bait ban, single barbless hook	(49.5086110000000019,-125.192499999999995)
381	WOWO LAKE	\N	\N	t	\N	\N	Trout daily quota = 2; artificial fly only, bait ban, single barbless hook	(49.8572220000000002,-125.380278000000004)
382	WOWO LAKE	\N	\N	\N	\N	\N	Electric motors only	(49.8572220000000002,-125.380278000000004)
383	YAKOUN RIVER	t	t	\N	\N	Oct 1-Apr 30	No Fishing from Yakoun Lake downstream approximately 13 km to posted fishing boundary signs	(53.6569440000000029,-132.205833000000013)
384	YAKOUN RIVER	\N	\N	\N	\N	\N	No powered boats	(53.6569440000000029,-132.205833000000013)
385	YAKOUN RIVER	\N	\N	\N	\N	\N	Cutthroat trout release	(53.6569440000000029,-132.205833000000013)
386	YAKOUN RIVER	\N	\N	\N	\N	Sept 1-Apr 30	Class II water	(53.6569440000000029,-132.205833000000013)
387	YAKOUN RIVER	\N	\N	\N	\N	Dec 1-Apr 30	Steelhead Stamp mandatory	(53.6569440000000029,-132.205833000000013)
388	ZEBALLOS LAKE	\N	\N	\N	\N	\N	No Fishing	(50.0802779999999998,-126.739999999999995)
389	ZEBALLOS RIVER	\N	t	\N	\N	Nov 1-Apr 30	No Fishing	(49.9816670000000016,-126.852500000000006)
390	Big Qualicum River	\N	\N	\N	\N	Aug 15-Oct 15	Reduced area of the  angling closure in the vicinity of the E&N trestle.	(49.3940219999999997,-124.617840000000001)
391	Gordon River	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing	(48.7667550000000034,-124.333624)
392	Heber River	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing	(49.7738889999999969,-126.051666999999995)
393	Nahmint River 	\N	\N	\N	\N	Nov 1-Apr 30	No Fishing	(49.0622219999999984,-124.884167000000005)
394	Rogers Creek	\N	\N	\N	\N	Dec 1-Apr 30	No Fishing	(49.2550000000000026,-124.811943999999997)
\.


--
-- Name: regulations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.regulations_id_seq', 394, true);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.species (id, name) FROM stdin;
1	Steelhead Trout
2	Rainbow Trout
3	Cutthroat Trout
4	Bull Trout
5	Kokanee Salmon
6	Smallmouth Bass
7	White Sturgeon
8	Yellow Perch
9	Crayfish
10	Char
11	Coho Salmon
12	Chinook Salmon
13	Atlantic Salmon
14	Pink Salmon
15	Chum Salmon
16	Sockeye Salmon
\.


--
-- Name: species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.species_id_seq', 16, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.users (id, name, email, avatar) FROM stdin;
1	Tom Rosenbauer	Tom@orvis.com	https://farm9.staticflickr.com/8391/8492601202_d56e125aaf.jpg
2	Alice Alison	alice@hotmail.com	https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.epicscotland.com%2Fcorporate-headshot-tips%2F&psig=AOvVaw0zbtPe5IvRA0bwkIcFchKQ&ust=1618164500901000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCLDJ1tei9O8CFQAAAAAdAAAAABAO
3	Alan Bodan	alan@hotmail.com	https://cdn.fstoppers.com/styles/large-16-9/s3/lead/2014/12/fstoppers-dylan-patrick-setting-up-a-successful-headshot-session-8.jpg
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: me
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: pins_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.pins
    ADD CONSTRAINT pins_pkey PRIMARY KEY (id);


--
-- Name: regulations_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.regulations
    ADD CONSTRAINT regulations_pkey PRIMARY KEY (id);


--
-- Name: species_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: pins_species_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.pins
    ADD CONSTRAINT pins_species_id_fkey FOREIGN KEY (species_id) REFERENCES public.species(id) ON DELETE CASCADE;


--
-- Name: pins_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.pins
    ADD CONSTRAINT pins_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

