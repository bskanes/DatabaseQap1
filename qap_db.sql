PGDMP     &    ;        	        {            qap    15.1    15.1     !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    16398    qap    DATABASE     ~   CREATE DATABASE qap WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE qap;
                postgres    false            ?            1259    16414    aircraft    TABLE     ?   CREATE TABLE public.aircraft (
    id bigint NOT NULL,
    airline_name character varying(20) NOT NULL,
    passenger_number smallint NOT NULL
);
    DROP TABLE public.aircraft;
       public         heap    postgres    false            ?            1259    16409    airports    TABLE     ?   CREATE TABLE public.airports (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    code character varying(20) NOT NULL,
    city_name character varying(20) NOT NULL,
    city_id bigint
);
    DROP TABLE public.airports;
       public         heap    postgres    false            ?            1259    16399    cities    TABLE     ?   CREATE TABLE public.cities (
    id bigint NOT NULL,
    city_name character varying(20) NOT NULL,
    state character varying(20) NOT NULL,
    population bigint NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    16444    flight_paths    TABLE     ?   CREATE TABLE public.flight_paths (
    id bigint NOT NULL,
    aircraft_id bigint NOT NULL,
    takeoff_location bigint NOT NULL,
    land_location bigint NOT NULL
);
     DROP TABLE public.flight_paths;
       public         heap    postgres    false            ?            1259    16404 
   passengers    TABLE     ?   CREATE TABLE public.passengers (
    id bigint NOT NULL,
    first_name character varying(20) NOT NULL,
    last_name character varying(20) NOT NULL,
    phone_number character varying(20) NOT NULL
);
    DROP TABLE public.passengers;
       public         heap    postgres    false            ?            1259    16424    travel_history    TABLE     ?   CREATE TABLE public.travel_history (
    id bigint NOT NULL,
    passenger_id bigint,
    aircraft_id bigint,
    airport_id bigint
);
 "   DROP TABLE public.travel_history;
       public         heap    postgres    false                      0    16414    aircraft 
   TABLE DATA           F   COPY public.aircraft (id, airline_name, passenger_number) FROM stdin;
    public          postgres    false    217   ?!                 0    16409    airports 
   TABLE DATA           F   COPY public.airports (id, name, code, city_name, city_id) FROM stdin;
    public          postgres    false    216   ?"                 0    16399    cities 
   TABLE DATA           B   COPY public.cities (id, city_name, state, population) FROM stdin;
    public          postgres    false    214   ?#                 0    16444    flight_paths 
   TABLE DATA           X   COPY public.flight_paths (id, aircraft_id, takeoff_location, land_location) FROM stdin;
    public          postgres    false    219   ?$                 0    16404 
   passengers 
   TABLE DATA           M   COPY public.passengers (id, first_name, last_name, phone_number) FROM stdin;
    public          postgres    false    215   ?%                 0    16424    travel_history 
   TABLE DATA           S   COPY public.travel_history (id, passenger_id, aircraft_id, airport_id) FROM stdin;
    public          postgres    false    218   s&       y           2606    16403    cities Cities_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT "Cities_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.cities DROP CONSTRAINT "Cities_pkey";
       public            postgres    false    214            ?           2606    16428 "   travel_history Travel History_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.travel_history
    ADD CONSTRAINT "Travel History_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.travel_history DROP CONSTRAINT "Travel History_pkey";
       public            postgres    false    218                       2606    16418    aircraft aircraft_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.aircraft
    ADD CONSTRAINT aircraft_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.aircraft DROP CONSTRAINT aircraft_pkey;
       public            postgres    false    217            }           2606    16413    airports airports_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.airports
    ADD CONSTRAINT airports_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.airports DROP CONSTRAINT airports_pkey;
       public            postgres    false    216            ?           2606    16450    flight_paths flight paths_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.flight_paths
    ADD CONSTRAINT "flight paths_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.flight_paths DROP CONSTRAINT "flight paths_pkey";
       public            postgres    false    219            {           2606    16408    passengers passengers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.passengers DROP CONSTRAINT passengers_pkey;
       public            postgres    false    215            ?           2606    16419    airports Cities    FK CONSTRAINT     {   ALTER TABLE ONLY public.airports
    ADD CONSTRAINT "Cities" FOREIGN KEY (city_id) REFERENCES public.cities(id) NOT VALID;
 ;   ALTER TABLE ONLY public.airports DROP CONSTRAINT "Cities";
       public          postgres    false    216    3193    214            ?           2606    16434    travel_history aircraft    FK CONSTRAINT     ?   ALTER TABLE ONLY public.travel_history
    ADD CONSTRAINT aircraft FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id) NOT VALID;
 A   ALTER TABLE ONLY public.travel_history DROP CONSTRAINT aircraft;
       public          postgres    false    217    3199    218            ?           2606    16451    flight_paths aircraft    FK CONSTRAINT     ?   ALTER TABLE ONLY public.flight_paths
    ADD CONSTRAINT aircraft FOREIGN KEY (aircraft_id) REFERENCES public.aircraft(id) NOT VALID;
 ?   ALTER TABLE ONLY public.flight_paths DROP CONSTRAINT aircraft;
       public          postgres    false    3199    219    217            ?           2606    16439    travel_history airports    FK CONSTRAINT     ?   ALTER TABLE ONLY public.travel_history
    ADD CONSTRAINT airports FOREIGN KEY (airport_id) REFERENCES public.airports(id) NOT VALID;
 A   ALTER TABLE ONLY public.travel_history DROP CONSTRAINT airports;
       public          postgres    false    3197    216    218            ?           2606    16461    flight_paths city land    FK CONSTRAINT     ?   ALTER TABLE ONLY public.flight_paths
    ADD CONSTRAINT "city land" FOREIGN KEY (land_location) REFERENCES public.cities(id) NOT VALID;
 B   ALTER TABLE ONLY public.flight_paths DROP CONSTRAINT "city land";
       public          postgres    false    214    219    3193            ?           2606    16456    flight_paths city takeoff    FK CONSTRAINT     ?   ALTER TABLE ONLY public.flight_paths
    ADD CONSTRAINT "city takeoff" FOREIGN KEY (takeoff_location) REFERENCES public.cities(id) NOT VALID;
 E   ALTER TABLE ONLY public.flight_paths DROP CONSTRAINT "city takeoff";
       public          postgres    false    3193    219    214            ?           2606    16429    travel_history passengers    FK CONSTRAINT     ?   ALTER TABLE ONLY public.travel_history
    ADD CONSTRAINT passengers FOREIGN KEY (passenger_id) REFERENCES public.passengers(id) NOT VALID;
 C   ALTER TABLE ONLY public.travel_history DROP CONSTRAINT passengers;
       public          postgres    false    3195    215    218               ?   x?U??
?0Eד??X2_YFq? q?M??
Kl??}?nJ?sA??X???e????D4???6iu?@?bF?.???i??욯???h??s??]??i?G!?j????-"$Ɂ?u??E? M?P???=&'?92)?8??skKi??Hj??-W`???S4????v?6?         C  x?u?MO1???_ћ7?????Q0???p?R??J??b⿷?(#????}f?
?7.E???r??c??_c?SL?[?%|# ??$<ڭ?am?]H.?????T???PII)??%z?vǟ?????i?D??ǀ+??(?+?]XS?E??b???3?yӑ(?5??'O[?g?ids?"+`]???̻W??`?Z??L??1?5??&:??/?n???y???Op?7M?Z??Jx;????c(?<?54RV??w??նHڶeL???Ǹ!Z????`??"???N?O??8?u?\???w???0BT?6C%_U{?0ƾ j?         ?   x?M??N?0Eד?`Ǯ?+v????H?*??ͨq?(?G?]Ob6?????J?????*?t???^I!?5SJ???i?=F?rN?`???? ?5?!M\?? ??~˭????+???L?:?۳s????w*???g嵖?>???????S^0,???~??=<c?t?`???D?u?0Ƭ?x#8D?4???|??????1?w?#~#?:]?qBج???H???4?I?}캮?K?Wf         ?   x?M??!D?K1PA???_?2~&??{L?1??RDH#???.=???@RU?Z5?
q2w'??7gg?~i??d%U ?1d??F?S?9'?,???<@V?vўu?????yy???!??a???O?:?0????h_?pԔ?z?????D?         ?   x???j?0Dϳ???Zie????
-?ҋ??6??b?????3?{???{?j???|Pb?'?5?w??4???u#?ۖ/u(???e??}?	???ftb??$+?ӂ?i|???^???J???K?3?%>h?v/Ns?7?cV??!?k???9?]#.?۰?????Yk?X??+?}?pK???	?8?9??#A=&         B   x????0B?0Le??'?t?9J"?xn.s??``?2??L?bBl??????o????1???w?     