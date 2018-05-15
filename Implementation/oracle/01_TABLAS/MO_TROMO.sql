REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

/

/* Create Tables */

CREATE TABLE  "MO_TROMO"
(
	"ROMO_ROMO" NUMBER(22) NOT NULL,    -- Identificador unico modulos con rol
	"ROMO_MODU" NUMBER(22) NULL,
	"ROMO_ROLL" NUMBER(22) NULL
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

COMMENT ON TABLE  "MO_TROMO" IS 'Tabla que contendra la realcion entre rol de usuario y columnas'
;

COMMENT ON COLUMN  "MO_TROMO"."ROMO_ROMO" IS 'Identificador unico modulos con rol'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "MO_TROMO" 
 ADD CONSTRAINT "PK_ROMO"
	PRIMARY KEY ("ROMO_ROMO") 
USING INDEX 
LOGGING 
TABLESPACE	TS_IAUWEB 
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
