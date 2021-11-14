PGDMP         	    	        
    y            seguro_vida    14.1    14.0 1    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    16394    seguro_vida    DATABASE     i   CREATE DATABASE seguro_vida WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Ecuador.1252';
    DROP DATABASE seguro_vida;
                postgres    false            �            1255    16457    venta_seguro(character varying)    FUNCTION     �  CREATE FUNCTION public.venta_seguro(character varying) RETURNS SETOF record
    LANGUAGE sql
    AS $_$

	SELECT
		EXTRACT(YEAR FROM AGENTE_VENDEDOR.FECH_CONTR) AS FECHA,
		COUNT(REGISTRO.ID_AGENT) AS NUMERO_PLANES
	FROM REGISTRO
        INNER JOIN TIPO_CONTRATO ON REGISTRO.ID_TIP = TIPO_CONTRATO.ID_TIP
		INNER JOIN AGENTE_VENDEDOR ON REGISTRO.ID_AGENT = AGENTE_VENDEDOR.ID_AGENT
	WHERE TIPO_CONTRATO.NOM_TIP = $1
	GROUP BY 1
	ORDER BY 1;

$_$;
 6   DROP FUNCTION public.venta_seguro(character varying);
       public          postgres    false            �            1259    16407    agente_vendedor    TABLE     �   CREATE TABLE public.agente_vendedor (
    id_agent integer NOT NULL,
    nom_agent character varying(60),
    fech_contr date,
    lugar_contr character varying(60),
    document_contr character varying(60),
    pago_agent integer
);
 #   DROP TABLE public.agente_vendedor;
       public         heap    postgres    false            �            1259    16426    cliente    TABLE       CREATE TABLE public.cliente (
    id_clien integer NOT NULL,
    id_lugar integer,
    nom_clien character varying(60),
    apell_clien character varying(60),
    fechanac_clien date,
    tel1_clien integer,
    tel2_clien integer,
    tiposangre_clien character varying(60)
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16395    estado    TABLE     v   CREATE TABLE public.estado (
    id_est integer NOT NULL,
    estado_est character varying(60),
    fecha_est date
);
    DROP TABLE public.estado;
       public         heap    postgres    false            �            1259    16401    liquidacion    TABLE     g   CREATE TABLE public.liquidacion (
    id_liqui integer NOT NULL,
    nom_bene character varying(60)
);
    DROP TABLE public.liquidacion;
       public         heap    postgres    false            �            1259    16433    lugar_de_nacimiento    TABLE     �   CREATE TABLE public.lugar_de_nacimiento (
    id_lug integer NOT NULL,
    pais_lug character varying(60),
    ciudad_lug character varying(60),
    canton_lug character varying(60)
);
 '   DROP TABLE public.lugar_de_nacimiento;
       public         heap    postgres    false            �            1259    16419    pago    TABLE     �   CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    id_reg integer,
    tipo_pago character varying(60),
    costo_pago integer
);
    DROP TABLE public.pago;
       public         heap    postgres    false            �            1259    16439    pago_mensualidad    TABLE     �   CREATE TABLE public.pago_mensualidad (
    id_pagm integer NOT NULL,
    id_reg integer,
    inst_banc character varying(60),
    fecha_pagm date,
    costo_pagm integer
);
 $   DROP TABLE public.pago_mensualidad;
       public         heap    postgres    false            �            1259    16446    registro    TABLE     C  CREATE TABLE public.registro (
    id_reg integer NOT NULL,
    id_agent integer,
    id_tip integer,
    id_est integer,
    id_clien integer,
    id_liq integer,
    fechini_reg date,
    estasalud_clien character varying(60),
    obserestad_clien character varying(60),
    fechavenci_est date,
    num_contr integer
);
    DROP TABLE public.registro;
       public         heap    postgres    false            �            1259    16413    tipo_contrato    TABLE     �   CREATE TABLE public.tipo_contrato (
    id_tip integer NOT NULL,
    nom_tip character varying(60),
    requi_tip character varying(60)
);
 !   DROP TABLE public.tipo_contrato;
       public         heap    postgres    false            ,          0    16407    agente_vendedor 
   TABLE DATA           s   COPY public.agente_vendedor (id_agent, nom_agent, fech_contr, lugar_contr, document_contr, pago_agent) FROM stdin;
    public          postgres    false    211   U6       /          0    16426    cliente 
   TABLE DATA           �   COPY public.cliente (id_clien, id_lugar, nom_clien, apell_clien, fechanac_clien, tel1_clien, tel2_clien, tiposangre_clien) FROM stdin;
    public          postgres    false    214   �6       *          0    16395    estado 
   TABLE DATA           ?   COPY public.estado (id_est, estado_est, fecha_est) FROM stdin;
    public          postgres    false    209   �8       +          0    16401    liquidacion 
   TABLE DATA           9   COPY public.liquidacion (id_liqui, nom_bene) FROM stdin;
    public          postgres    false    210   99       0          0    16433    lugar_de_nacimiento 
   TABLE DATA           W   COPY public.lugar_de_nacimiento (id_lug, pais_lug, ciudad_lug, canton_lug) FROM stdin;
    public          postgres    false    215   �9       .          0    16419    pago 
   TABLE DATA           F   COPY public.pago (id_pago, id_reg, tipo_pago, costo_pago) FROM stdin;
    public          postgres    false    213   �9       1          0    16439    pago_mensualidad 
   TABLE DATA           ^   COPY public.pago_mensualidad (id_pagm, id_reg, inst_banc, fecha_pagm, costo_pagm) FROM stdin;
    public          postgres    false    216   �:       2          0    16446    registro 
   TABLE DATA           �   COPY public.registro (id_reg, id_agent, id_tip, id_est, id_clien, id_liq, fechini_reg, estasalud_clien, obserestad_clien, fechavenci_est, num_contr) FROM stdin;
    public          postgres    false    217   j;       -          0    16413    tipo_contrato 
   TABLE DATA           C   COPY public.tipo_contrato (id_tip, nom_tip, requi_tip) FROM stdin;
    public          postgres    false    212   �<       �           2606    16411    agente_vendedor pk_id_agente 
   CONSTRAINT     `   ALTER TABLE ONLY public.agente_vendedor
    ADD CONSTRAINT pk_id_agente PRIMARY KEY (id_agent);
 F   ALTER TABLE ONLY public.agente_vendedor DROP CONSTRAINT pk_id_agente;
       public            postgres    false    211            �           2606    16430    cliente pk_id_cliente 
   CONSTRAINT     Y   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT pk_id_cliente PRIMARY KEY (id_clien);
 ?   ALTER TABLE ONLY public.cliente DROP CONSTRAINT pk_id_cliente;
       public            postgres    false    214            ~           2606    16399    estado pk_id_estado 
   CONSTRAINT     U   ALTER TABLE ONLY public.estado
    ADD CONSTRAINT pk_id_estado PRIMARY KEY (id_est);
 =   ALTER TABLE ONLY public.estado DROP CONSTRAINT pk_id_estado;
       public            postgres    false    209            �           2606    16405    liquidacion pk_id_liquidacion 
   CONSTRAINT     a   ALTER TABLE ONLY public.liquidacion
    ADD CONSTRAINT pk_id_liquidacion PRIMARY KEY (id_liqui);
 G   ALTER TABLE ONLY public.liquidacion DROP CONSTRAINT pk_id_liquidacion;
       public            postgres    false    210            �           2606    16437    lugar_de_nacimiento pk_id_lugar 
   CONSTRAINT     a   ALTER TABLE ONLY public.lugar_de_nacimiento
    ADD CONSTRAINT pk_id_lugar PRIMARY KEY (id_lug);
 I   ALTER TABLE ONLY public.lugar_de_nacimiento DROP CONSTRAINT pk_id_lugar;
       public            postgres    false    215            �           2606    16423    pago pk_id_pago 
   CONSTRAINT     R   ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pk_id_pago PRIMARY KEY (id_pago);
 9   ALTER TABLE ONLY public.pago DROP CONSTRAINT pk_id_pago;
       public            postgres    false    213            �           2606    16443    pago_mensualidad pk_id_pagom 
   CONSTRAINT     _   ALTER TABLE ONLY public.pago_mensualidad
    ADD CONSTRAINT pk_id_pagom PRIMARY KEY (id_pagm);
 F   ALTER TABLE ONLY public.pago_mensualidad DROP CONSTRAINT pk_id_pagom;
       public            postgres    false    216            �           2606    16450    registro pk_id_registro 
   CONSTRAINT     Y   ALTER TABLE ONLY public.registro
    ADD CONSTRAINT pk_id_registro PRIMARY KEY (id_reg);
 A   ALTER TABLE ONLY public.registro DROP CONSTRAINT pk_id_registro;
       public            postgres    false    217            �           2606    16417    tipo_contrato pk_id_tipo 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tipo_contrato
    ADD CONSTRAINT pk_id_tipo PRIMARY KEY (id_tip);
 B   ALTER TABLE ONLY public.tipo_contrato DROP CONSTRAINT pk_id_tipo;
       public            postgres    false    212            �           1259    16412    agente_vendedor_pk    INDEX     Y   CREATE UNIQUE INDEX agente_vendedor_pk ON public.agente_vendedor USING btree (id_agent);
 &   DROP INDEX public.agente_vendedor_pk;
       public            postgres    false    211            �           1259    16431 
   cliente_pk    INDEX     I   CREATE UNIQUE INDEX cliente_pk ON public.cliente USING btree (id_clien);
    DROP INDEX public.cliente_pk;
       public            postgres    false    214            |           1259    16400 	   estado_pk    INDEX     E   CREATE UNIQUE INDEX estado_pk ON public.estado USING btree (id_est);
    DROP INDEX public.estado_pk;
       public            postgres    false    209                       1259    16406    liquidacion_pk    INDEX     Q   CREATE UNIQUE INDEX liquidacion_pk ON public.liquidacion USING btree (id_liqui);
 "   DROP INDEX public.liquidacion_pk;
       public            postgres    false    210            �           1259    16438    lugar_pk    INDEX     Q   CREATE UNIQUE INDEX lugar_pk ON public.lugar_de_nacimiento USING btree (id_lug);
    DROP INDEX public.lugar_pk;
       public            postgres    false    215            �           1259    16444    pago_mensualidad_pk    INDEX     Z   CREATE UNIQUE INDEX pago_mensualidad_pk ON public.pago_mensualidad USING btree (id_pagm);
 '   DROP INDEX public.pago_mensualidad_pk;
       public            postgres    false    216            �           1259    16424    pago_pk    INDEX     B   CREATE UNIQUE INDEX pago_pk ON public.pago USING btree (id_pago);
    DROP INDEX public.pago_pk;
       public            postgres    false    213            �           1259    16451    registro_pk    INDEX     I   CREATE UNIQUE INDEX registro_pk ON public.registro USING btree (id_reg);
    DROP INDEX public.registro_pk;
       public            postgres    false    217            �           1259    16425    relacion_1_fk    INDEX     @   CREATE INDEX relacion_1_fk ON public.pago USING btree (id_reg);
 !   DROP INDEX public.relacion_1_fk;
       public            postgres    false    213            �           1259    16432    relacion_2_fk    INDEX     E   CREATE INDEX relacion_2_fk ON public.cliente USING btree (id_lugar);
 !   DROP INDEX public.relacion_2_fk;
       public            postgres    false    214            �           1259    16445    relacion_3_fk    INDEX     L   CREATE INDEX relacion_3_fk ON public.pago_mensualidad USING btree (id_reg);
 !   DROP INDEX public.relacion_3_fk;
       public            postgres    false    216            �           1259    16452    relacion_4_fk    INDEX     F   CREATE INDEX relacion_4_fk ON public.registro USING btree (id_agent);
 !   DROP INDEX public.relacion_4_fk;
       public            postgres    false    217            �           1259    16453    relacion_5_fk    INDEX     D   CREATE INDEX relacion_5_fk ON public.registro USING btree (id_tip);
 !   DROP INDEX public.relacion_5_fk;
       public            postgres    false    217            �           1259    16454    relacion_6_fk    INDEX     D   CREATE INDEX relacion_6_fk ON public.registro USING btree (id_est);
 !   DROP INDEX public.relacion_6_fk;
       public            postgres    false    217            �           1259    16455    relacion_7_fk    INDEX     F   CREATE INDEX relacion_7_fk ON public.registro USING btree (id_clien);
 !   DROP INDEX public.relacion_7_fk;
       public            postgres    false    217            �           1259    16456    relacion_8_fk    INDEX     D   CREATE INDEX relacion_8_fk ON public.registro USING btree (id_liq);
 !   DROP INDEX public.relacion_8_fk;
       public            postgres    false    217            �           1259    16418    tipo_contrato_pk    INDEX     S   CREATE UNIQUE INDEX tipo_contrato_pk ON public.tipo_contrato USING btree (id_tip);
 $   DROP INDEX public.tipo_contrato_pk;
       public            postgres    false    212            ,   �   x�e�1�0@��9E.d' `�B��ť"E.JJ%zz�����'�4�\�E��N��OF���?�H�+�<7H�.�5+�~֍-:�@0��)�R����]�.~��.��S����m�{�B1c      /   �  x���An�0Eף�*HJ���҅��E誛��(,NAKF�[��X�����y�?��� �����Av�(�(E�VR�ZK�������P�`GaK~���y��
v3����1!m���T�3���`)ek��]>��s0<j0��2D_M����[��a�Ʉ���)227�hy��q�����.�2��"�f|D�����N&��v>Nx"�Y�u�m8����}8����]��:{(�����L/�d�)A����ۓ���l�"o���R4�[��7.�{�Mt�Ы�N�ysf^���&K�Ye�$�?�o�u���{�l�8�p}��	â�P���mr�6n��"�hr��d�8�]=�m���*�Írb�ɥd�Լ����.�1�����	=���d.Z�c�Y�E8Qg�Q�E��Ѹ���*��1��g���O��wЪ9*Z�i�񽹽ˠUy�}(����'4      *   ]   x�U�;
�@C�z��H���X�XX	2X��u8���.��e��u��&*�fT�c�YK1}f3�i1�[�Ϸ�S�������[�2Jo�]� <͕ �      +   `   x�3���/NU,�<�1?/��ˈ�;�,3O�9??�˘�1'%1�H�'3/�˄ӫ41O�%5'=1%�˔�7�(3Q! 3/9��ˌӧ4������� 4m�      0   9   x�3�tM.ML�/��M�+I��\FXE����Ŝ.��9�\&¥E�y\1z\\\ �O�      .   �   x�u���0��ӧ�	����� �b���.K"��fN3mw��@h������C7�~�G�B�a�o�ǫf^C�S|���[-��-v��A�z��>^�8�G7��e�	����U�̌�U�r=kk�?sբB
dnc-Eѷ}XM���=v�O�]D� څD�P�E%D9TTA����=\\�K��1A� c�����؂m����Ɛg//���×�1��J�f      1   x   x�}�1
�0�������$;�^�e��S��(Pz�$��7~�Rn��r��:7�s��fcKd=2�����|{�m���ҔU�v��OЄ%��{�"4����q�4�����6���w�3�      2   ]  x���M��@���)� ��ؚ�RO��(��I�?�j42���	~�^�+�)Ƈ��(ϓ����:v�Q������	���;���c�%hF���PP�򪼠�1� 5�j��
DOEݨSW>�r�������Ձ�n�X���Y��m�����R]���7��3�bZ'���k����-n������ڼo��r	~&��������� L;`~)�X�2��#�w�|�L\�26�c&+0Ҷ{�&'8�v�Yt=I�R�}�i��DNo*S��h�^k�9������/���b
��l
�Y<#�#+��x���zq�������/�I���`x:����|EQ��;      -   E   x�3�(J��,��tNM)�I�2���OI-JL��H,H�QHIU�/IL����2�tJ,�L·)����� ���     