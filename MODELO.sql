-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-10-16 22:34:30 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ajuste_aplicacao (
    id_ajuste   INTEGER NOT NULL,
    id_produtor INTEGER NOT NULL,
    tp_ajuste   VARCHAR2(30) NOT NULL,
    dh_ajuste   TIMESTAMP NOT NULL,
    vl_ajustado NUMBER NOT NULL
);

COMMENT ON COLUMN ajuste_aplicacao.vl_ajustado IS
    'Agua ou nutriente';

ALTER TABLE ajuste_aplicacao ADD CONSTRAINT ck_aj_aplic_ajuste CHECK ( vl_ajustado > 0 );

ALTER TABLE ajuste_aplicacao
    ADD CONSTRAINT ck_aj_aplic_tipo_ajuste CHECK ( tp_ajuste IN ( "Irrigação", "Nutriente" ) );

ALTER TABLE ajuste_aplicacao ADD CONSTRAINT pk_ajuste_aplicacao PRIMARY KEY ( id_ajuste );

ALTER TABLE ajuste_aplicacao ADD CONSTRAINT un_ajuste_aplicacao_id UNIQUE ( id_ajuste );

CREATE TABLE cultura (
    id_cultura        INTEGER NOT NULL,
    id_produtor       INTEGER NOT NULL,
    id_plantacao      INTEGER NOT NULL,
    id_leitura        INTEGER NOT NULL,
    nm_cultura        VARCHAR2(255) NOT NULL,
    dt_inicio_plantio TIMESTAMP NOT NULL,
    dt_fim_plantio    TIMESTAMP,
    dt_colheita       DATE NOT NULL
);

ALTER TABLE cultura ADD CONSTRAINT ck_cultura_data CHECK ( dt_inicio_plantio < dt_inicio_colheita );

ALTER TABLE cultura ADD CONSTRAINT pk_cultura PRIMARY KEY ( id_cultura );

ALTER TABLE cultura ADD CONSTRAINT un_cultura_id UNIQUE ( id_cultura );

CREATE TABLE leitura_sensor (
    id_leitura        INTEGER NOT NULL,
    id_sensor         INTEGER NOT NULL,
    dh_inicio_leitura TIMESTAMP NOT NULL,
    dh_leitura_fim    TIMESTAMP,
    vl_referencia     NUMBER NOT NULL
);

ALTER TABLE leitura_sensor ADD CONSTRAINT ck_leitura_sensor_valor CHECK ( vl_referencia > 0 );

ALTER TABLE leitura_sensor ADD CONSTRAINT pk_leitura_sensor PRIMARY KEY ( id_leitura );

ALTER TABLE leitura_sensor ADD CONSTRAINT un_leitura_sensor_id UNIQUE ( id_leitura );

CREATE TABLE plantacao (
    id_plantacao                 INTEGER NOT NULL,
    id_sensor                    INTEGER NOT NULL,
    nu_area_plantacao            NUMBER NOT NULL,
    nu_coordenadas_plantacao_wkt VARCHAR2(125) NOT NULL
);

COMMENT ON COLUMN plantacao.id_plantacao IS
    'talhao de terra';

ALTER TABLE plantacao ADD CONSTRAINT ck_plantacao_area CHECK ( nu_area_plantacao > 0 );

ALTER TABLE plantacao ADD CONSTRAINT pk_plantacao PRIMARY KEY ( id_plantacao );

ALTER TABLE plantacao ADD CONSTRAINT un_plantacao_id UNIQUE ( id_plantacao );

CREATE TABLE produtor (
    id_produtor     INTEGER NOT NULL,
    nm_produtor     VARCHAR2(255) NOT NULL,
    nu_telefone     VARCHAR2(11) NOT NULL,
    ds_endereco     VARCHAR2(255) NOT NULL,
    nu_cpf_produtor CHAR(11) NOT NULL,
    dt_nascimento   DATE NOT NULL,
    ic_ativo        INTEGER NOT NULL
);

ALTER TABLE produtor ADD CONSTRAINT pk_produtor PRIMARY KEY ( id_produtor );

ALTER TABLE produtor ADD CONSTRAINT un_prod_id UNIQUE ( id_produtor );

CREATE TABLE sensor (
    id_sensor            INTEGER NOT NULL,
    tp_sensor            VARCHAR2(100) NOT NULL,
    ds_modelo_sensor     VARCHAR2(100) NOT NULL,
    nu_ano_fabricacao    INTEGER NOT NULL,
    ds_fabricante_sensor VARCHAR2(100) NOT NULL
);

ALTER TABLE sensor
    ADD CONSTRAINT ck_sensor_1 CHECK ( tp_sensor IN ( "S1", "S2", "S3" ) );

ALTER TABLE sensor ADD CONSTRAINT pk_sensor PRIMARY KEY ( id_sensor );

ALTER TABLE sensor ADD CONSTRAINT un_sensor_id UNIQUE ( id_sensor );

ALTER TABLE ajuste_aplicacao
    ADD CONSTRAINT fk_ajuste_aplicacao_produtor FOREIGN KEY ( id_produtor )
        REFERENCES produtor ( id_produtor );

ALTER TABLE cultura
    ADD CONSTRAINT fk_cultura_leitura_sensor FOREIGN KEY ( id_leitura )
        REFERENCES leitura_sensor ( id_leitura );

ALTER TABLE cultura
    ADD CONSTRAINT fk_cultura_plantacao FOREIGN KEY ( id_plantacao )
        REFERENCES plantacao ( id_plantacao );

ALTER TABLE cultura
    ADD CONSTRAINT fk_cultura_produtor FOREIGN KEY ( id_produtor )
        REFERENCES produtor ( id_produtor );

ALTER TABLE leitura_sensor
    ADD CONSTRAINT fk_leitura_sensor_sensor FOREIGN KEY ( id_sensor )
        REFERENCES sensor ( id_sensor );

ALTER TABLE plantacao
    ADD CONSTRAINT fk_plantacao_sensor FOREIGN KEY ( id_sensor )
        REFERENCES sensor ( id_sensor );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             24
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
