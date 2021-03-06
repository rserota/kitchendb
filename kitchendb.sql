PGDMP         -                v        	   kitchendb    10.3    10.3 <    �	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             raphael    false            �	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  raphael    false    3            �            1259    16758    dish    TABLE     �   CREATE TABLE public.dish (
    id integer NOT NULL,
    name character varying(99) NOT NULL,
    description character varying(999) NOT NULL,
    user_id integer,
    preparation character varying(9999)
);
    DROP TABLE public.dish;
       public         raphael    false    3            �            1259    16756    dish_id_seq    SEQUENCE     �   CREATE SEQUENCE public.dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.dish_id_seq;
       public       raphael    false    199    3            �	           0    0    dish_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.dish_id_seq OWNED BY public.dish.id;
            public       raphael    false    198            �            1259    16741 
   ingredient    TABLE     �   CREATE TABLE public.ingredient (
    id integer NOT NULL,
    name character varying(99) NOT NULL,
    description character varying(999) NOT NULL
);
    DROP TABLE public.ingredient;
       public         raphael    false    3            �            1259    16773    ingredient_dish    TABLE     q   CREATE TABLE public.ingredient_dish (
    id integer NOT NULL,
    ingredient_id integer,
    dish_id integer
);
 #   DROP TABLE public.ingredient_dish;
       public         raphael    false    3            �            1259    16771    ingredient_dish_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredient_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.ingredient_dish_id_seq;
       public       raphael    false    201    3            �	           0    0    ingredient_dish_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.ingredient_dish_id_seq OWNED BY public.ingredient_dish.id;
            public       raphael    false    200            �            1259    16739    ingredient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ingredient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ingredient_id_seq;
       public       raphael    false    197    3            �	           0    0    ingredient_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ingredient_id_seq OWNED BY public.ingredient.id;
            public       raphael    false    196            �            1259    16824    kdb_user    TABLE     �   CREATE TABLE public.kdb_user (
    id integer NOT NULL,
    username character varying(99) NOT NULL,
    email character varying(99) NOT NULL,
    password character varying(999) NOT NULL
);
    DROP TABLE public.kdb_user;
       public         raphael    false    3            �            1259    16822    kdb_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kdb_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.kdb_user_id_seq;
       public       raphael    false    3    207            �	           0    0    kdb_user_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.kdb_user_id_seq OWNED BY public.kdb_user.id;
            public       raphael    false    206            �            1259    16791    menu    TABLE     �   CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying(99) NOT NULL,
    description character varying(999) NOT NULL,
    user_id integer
);
    DROP TABLE public.menu;
       public         raphael    false    3            �            1259    16806 	   menu_dish    TABLE     e   CREATE TABLE public.menu_dish (
    id integer NOT NULL,
    menu_id integer,
    dish_id integer
);
    DROP TABLE public.menu_dish;
       public         raphael    false    3            �            1259    16804    menu_dish_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_dish_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.menu_dish_id_seq;
       public       raphael    false    205    3            �	           0    0    menu_dish_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.menu_dish_id_seq OWNED BY public.menu_dish.id;
            public       raphael    false    204            �            1259    16789    menu_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.menu_id_seq;
       public       raphael    false    203    3            �	           0    0    menu_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;
            public       raphael    false    202            	           2604    16761    dish id    DEFAULT     b   ALTER TABLE ONLY public.dish ALTER COLUMN id SET DEFAULT nextval('public.dish_id_seq'::regclass);
 6   ALTER TABLE public.dish ALTER COLUMN id DROP DEFAULT;
       public       raphael    false    199    198    199            	           2604    16744    ingredient id    DEFAULT     n   ALTER TABLE ONLY public.ingredient ALTER COLUMN id SET DEFAULT nextval('public.ingredient_id_seq'::regclass);
 <   ALTER TABLE public.ingredient ALTER COLUMN id DROP DEFAULT;
       public       raphael    false    197    196    197            	           2604    16776    ingredient_dish id    DEFAULT     x   ALTER TABLE ONLY public.ingredient_dish ALTER COLUMN id SET DEFAULT nextval('public.ingredient_dish_id_seq'::regclass);
 A   ALTER TABLE public.ingredient_dish ALTER COLUMN id DROP DEFAULT;
       public       raphael    false    200    201    201            	           2604    16827    kdb_user id    DEFAULT     j   ALTER TABLE ONLY public.kdb_user ALTER COLUMN id SET DEFAULT nextval('public.kdb_user_id_seq'::regclass);
 :   ALTER TABLE public.kdb_user ALTER COLUMN id DROP DEFAULT;
       public       raphael    false    207    206    207            	           2604    16794    menu id    DEFAULT     b   ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);
 6   ALTER TABLE public.menu ALTER COLUMN id DROP DEFAULT;
       public       raphael    false    203    202    203            	           2604    16809    menu_dish id    DEFAULT     l   ALTER TABLE ONLY public.menu_dish ALTER COLUMN id SET DEFAULT nextval('public.menu_dish_id_seq'::regclass);
 ;   ALTER TABLE public.menu_dish ALTER COLUMN id DROP DEFAULT;
       public       raphael    false    204    205    205            �	          0    16758    dish 
   TABLE DATA               K   COPY public.dish (id, name, description, user_id, preparation) FROM stdin;
    public       raphael    false    199   A       �	          0    16741 
   ingredient 
   TABLE DATA               ;   COPY public.ingredient (id, name, description) FROM stdin;
    public       raphael    false    197   'B       �	          0    16773    ingredient_dish 
   TABLE DATA               E   COPY public.ingredient_dish (id, ingredient_id, dish_id) FROM stdin;
    public       raphael    false    201   �B       �	          0    16824    kdb_user 
   TABLE DATA               A   COPY public.kdb_user (id, username, email, password) FROM stdin;
    public       raphael    false    207   lC       �	          0    16791    menu 
   TABLE DATA               >   COPY public.menu (id, name, description, user_id) FROM stdin;
    public       raphael    false    203   F       �	          0    16806 	   menu_dish 
   TABLE DATA               9   COPY public.menu_dish (id, menu_id, dish_id) FROM stdin;
    public       raphael    false    205   �F       �	           0    0    dish_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.dish_id_seq', 39, true);
            public       raphael    false    198            �	           0    0    ingredient_dish_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.ingredient_dish_id_seq', 38, true);
            public       raphael    false    200            �	           0    0    ingredient_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.ingredient_id_seq', 29, true);
            public       raphael    false    196            �	           0    0    kdb_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.kdb_user_id_seq', 18, true);
            public       raphael    false    206            �	           0    0    menu_dish_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.menu_dish_id_seq', 16, true);
            public       raphael    false    204            �	           0    0    menu_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.menu_id_seq', 7, true);
            public       raphael    false    202            	           2606    16770    dish dish_description_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_description_key UNIQUE (description);
 C   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_description_key;
       public         raphael    false    199             	           2606    16766    dish dish_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_pkey;
       public         raphael    false    199            "	           2606    16778 $   ingredient_dish ingredient_dish_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ingredient_dish
    ADD CONSTRAINT ingredient_dish_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.ingredient_dish DROP CONSTRAINT ingredient_dish_pkey;
       public         raphael    false    201            	           2606    16748    ingredient ingredient_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredient_name_key;
       public         raphael    false    197            	           2606    16746    ingredient ingredient_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.ingredient
    ADD CONSTRAINT ingredient_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.ingredient DROP CONSTRAINT ingredient_pkey;
       public         raphael    false    197            .	           2606    16834    kdb_user kdb_user_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.kdb_user
    ADD CONSTRAINT kdb_user_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.kdb_user DROP CONSTRAINT kdb_user_email_key;
       public         raphael    false    207            0	           2606    16836    kdb_user kdb_user_password_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.kdb_user
    ADD CONSTRAINT kdb_user_password_key UNIQUE (password);
 H   ALTER TABLE ONLY public.kdb_user DROP CONSTRAINT kdb_user_password_key;
       public         raphael    false    207            2	           2606    16832    kdb_user kdb_user_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.kdb_user
    ADD CONSTRAINT kdb_user_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.kdb_user DROP CONSTRAINT kdb_user_pkey;
       public         raphael    false    207            $	           2606    16803    menu menu_description_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_description_key UNIQUE (description);
 C   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_description_key;
       public         raphael    false    203            *	           2606    16958 '   menu_dish menu_dish_menu_id_dish_id_key 
   CONSTRAINT     n   ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_menu_id_dish_id_key UNIQUE (menu_id, dish_id);
 Q   ALTER TABLE ONLY public.menu_dish DROP CONSTRAINT menu_dish_menu_id_dish_id_key;
       public         raphael    false    205    205            ,	           2606    16811    menu_dish menu_dish_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.menu_dish DROP CONSTRAINT menu_dish_pkey;
       public         raphael    false    205            &	           2606    16801    menu menu_name_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_name_key UNIQUE (name);
 <   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_name_key;
       public         raphael    false    203            (	           2606    16799    menu menu_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public         raphael    false    203            3	           2606    16837    dish dish_user_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.dish
    ADD CONSTRAINT dish_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.kdb_user(id);
 @   ALTER TABLE ONLY public.dish DROP CONSTRAINT dish_user_id_fkey;
       public       raphael    false    207    199    2354            5	           2606    16784 ,   ingredient_dish ingredient_dish_dish_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingredient_dish
    ADD CONSTRAINT ingredient_dish_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dish(id);
 V   ALTER TABLE ONLY public.ingredient_dish DROP CONSTRAINT ingredient_dish_dish_id_fkey;
       public       raphael    false    2336    199    201            4	           2606    16779 2   ingredient_dish ingredient_dish_ingredient_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingredient_dish
    ADD CONSTRAINT ingredient_dish_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredient(id);
 \   ALTER TABLE ONLY public.ingredient_dish DROP CONSTRAINT ingredient_dish_ingredient_id_fkey;
       public       raphael    false    197    2332    201            8	           2606    16817     menu_dish menu_dish_dish_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_dish_id_fkey FOREIGN KEY (dish_id) REFERENCES public.dish(id);
 J   ALTER TABLE ONLY public.menu_dish DROP CONSTRAINT menu_dish_dish_id_fkey;
       public       raphael    false    2336    199    205            7	           2606    16812     menu_dish menu_dish_menu_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.menu_dish
    ADD CONSTRAINT menu_dish_menu_id_fkey FOREIGN KEY (menu_id) REFERENCES public.menu(id);
 J   ALTER TABLE ONLY public.menu_dish DROP CONSTRAINT menu_dish_menu_id_fkey;
       public       raphael    false    2344    203    205            6	           2606    16950    menu menu_user_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.kdb_user(id);
 @   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_user_id_fkey;
       public       raphael    false    207    203    2354            �	     x���1n�0Eg���MH,�A�nEPt���c��bK2D9nn_�A�@����?Yk� ���fI8ځ���#�����V�o��+�R�+��|V��Y��!���C0#���؇��,�2Q����S�/�����r��,�i���a�����2x)�R�xfɌ�o�+��P�M�xögV�Δ0gG)AU�5ؖ��L�½a����g�ef����S�~�e�D����ӷ�nU1�_��#�D�c��)�`w�J����o
�R`�޹�ը��� ����      �	   �   x�]�Y�0D����	"��܅�(q�*q��	�����Xr�b�5��x�!)T�"9GNى(��U�ay%Hށ��<�2�A�f��,��Nl���p3�#���������Ƭ�f[��6��� -q�ﱦ���Rt�+GR?�#����{px{1 wސ#���mꔿ��YWU���X�      �	   q   x�%α�0Cњ������8J�X|0BH1n�<��f)�Ջ.f��H�q�`.���pA�t�7\��\h\0��������a�a6�TQn6\~.W����ڟ�      �	   �  x�u�ɲ�0�5<�]G¤�dP@@&E�z�ae���ݺ���ϟ�J�0D�Ꟃ���t�T(+At��/}A����,@�+�D�ٕHVl��8��YG��ą��[]��<�$G����c'ws`s�+GiC]v�<�+����������97Eo�mv����I&y��������F%���2���:�l�t��L-�}KM�֕������.3�����9�?���`)>�t���h����m��_���[�p���5�X^^�$�D�5��ȒO�hhN9�6�����5����8(۶X�|B��4dƂSX#lH���>��F�:�B�X[�f�7����[�C�;IT5%���=ȶ:��C�+o#��g�;���#�]OU����']��ku��걏۩	����T2~�m�qI�e��;g/�}���,ݔXTL2��0j�w��:�$d��S���:��z����H��)��曇젻K��t�;�?i�pn�ӛ&)��n����)���<1��O��7�s�9��ړy!o�!�PS��G5�Ur�铮o��n���`^[i�3oeQĞ��q�D�(�>���"� ~�Jx�8R�N�ͧ�0nA$\�+o�RLEh�e'>�&��*99�<:��9��%�ZH,�v�}�q��� I��8f      �	   �   x�5�A�0��+���"!Z񃾢�LI�`	'B��nE�=xg:zH��(c栕�Vp�{�+�ݍV�)3�pP��wӊ���q�����.��Iw�TDk>�"#n�R�z7�
J3x6ҔWE�6�6��t]���;�>��7�      �	   1   x���  �w;�I�B����^�3�0�����j�N��r�|�����     