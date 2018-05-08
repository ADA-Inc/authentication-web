REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

/

/* Create Tables */

CREATE TABLE  "US_TRLNE"
(
	"RLNE_RLNE" NUMBER(22) NOT NULL,    -- Codigo unico tipo Rol asignado por el sistema
	"RLNE_RLDN" VARCHAR2(50) NOT NULL,    -- Descripcion del rol asignado por el sistema
	"RLNE_FCMO" DATE NOT NULL    -- Fecha de Modificacion del tipo rol
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

COMMENT ON TABLE  "US_TRLNE" IS 'Tipo de Rol usuarios AUWEB'
;

COMMENT ON COLUMN  "US_TRLNE"."RLNE_RLNE" IS 'Codigo unico tipo Rol asignado por el sistema'
;

COMMENT ON COLUMN  "US_TRLNE"."RLNE_RLDN" IS 'Descripcion del rol asignado por el sistema'
;

COMMENT ON COLUMN  "US_TRLNE"."RLNE_FCMO" IS 'Fecha de Modificacion del tipo rol'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "US_TRLNE" 
 ADD CONSTRAINT "PK_TPRL"
	PRIMARY KEY ("RLNE_RLNE") 
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