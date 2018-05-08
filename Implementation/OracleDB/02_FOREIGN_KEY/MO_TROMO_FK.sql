REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************


/* Create Foreign Key Constraints */

ALTER TABLE  "MO_TROMO" 
 ADD CONSTRAINT "FK_MO_TROMO_MO_TMODU"
	FOREIGN KEY ("MODU_MODU") REFERENCES  "MO_TMODU" ("MODU_MODU")
;

ALTER TABLE  "MO_TROMO" 
 ADD CONSTRAINT "FK_MO_TROMO_US_TRLNE"
	FOREIGN KEY ("RLNE_RLNE") REFERENCES  "US_TRLNE" ("RLNE_RLNE")
;
    
    