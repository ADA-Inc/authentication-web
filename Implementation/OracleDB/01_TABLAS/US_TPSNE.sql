REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

/

/* Create Tables */

CREATE TABLE  "FS_AUWEB_US"."US_TPSNE"
(
	"PSNE_PSNE" NUMBER(22) NOT NULL,    -- Identificador  unico del usuario en el negocio
	"PSNE_NOBE" VARCHAR2(70) NOT NULL,    -- Nombres del usuario en el negocio
	"PSNE_APDO" VARCHAR2(70) NULL,    -- Apellidos del usuario en el negocio
	"PSNE_DIRN" VARCHAR2(50) NULL,    -- Direccion  del usuario en el negocio
	"PSNE_TLFN" VARCHAR2(50) NULL,    -- telefono del usuario en el negocio
	"PSNE_EMAL" VARCHAR2(50) NULL,    -- Email  del usuario en el negocio
	"PSNE_PAIS" VARCHAR2(50) NULL,    -- Pais  del usuario en el negocio
	"PSNE_NRID" VARCHAR2(50) NULL    -- Numero de indentificacion del usuario
)
TABLESPACE	TS_AUWEB
PCTFREE	10 
INITRANS	2 
MAXTRANS	255 
STORAGE ( 
	INITIAL	65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
	)
;

/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "FS_AUWEB_US"."US_TPSNE" IS 'Tabla que contendra las personas del negocio respectivo '
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_PSNE" IS 'Identificador  unico del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_NOBE" IS 'Nombres del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_APDO" IS 'Apellidos del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_DIRN" IS 'Direccion  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_TLFN" IS 'telefono del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_EMAL" IS 'Email  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_PAIS" IS 'Pais  del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TPSNE"."PSNE_NRID" IS 'Numero de indentificacion del usuario'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_AUWEB_US"."US_TPSNE" 
 ADD CONSTRAINT "PK_PSNE"
	PRIMARY KEY ("PSNE_PSNE") 
USING INDEX 
LOGGING 
TABLESPACE	TS_IPACRIM 
PCTFREE	10 
INITRANS	2 
MAXTRANS	255 
STORAGE ( 
	INITIAL	65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
	)
;