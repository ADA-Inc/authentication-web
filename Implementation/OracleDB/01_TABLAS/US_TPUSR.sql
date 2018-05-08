REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

/

/* Create Tables */

CREATE TABLE  "US_TPUSR"
(
	"PUSR_PUSR" NUMBER(22) NOT NULL,    -- Identificador  unico del usuario rol persona
	"USNE_USNE" NUMBER(22) NULL,
	"RLNE_RLNE" NUMBER(22) NULL,
	"PSNE_PSNE" NUMBER(22) NULL
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

COMMENT ON TABLE  "US_TPUSR" IS 'Tabla que contendra la persona el usuario y su rol'
;

COMMENT ON COLUMN  "US_TPUSR"."PUSR_PUSR" IS 'Identificador  unico del usuario rol persona'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "US_TPUSR" 
 ADD CONSTRAINT "PK_PUSR"
	PRIMARY KEY ("PUSR_PUSR") 
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
