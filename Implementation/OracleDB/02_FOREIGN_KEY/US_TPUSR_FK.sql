REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

/* Create Foreign Key Constraints */

ALTER TABLE  "US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TPSNE"
	FOREIGN KEY ("PSNE_PSNE") REFERENCES  "FS_AUWEB_US"."US_TPSNE" ("PSNE_PSNE")
;

ALTER TABLE  "US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TRLNE"
	FOREIGN KEY ("RLNE_RLNE") REFERENCES  "US_TRLNE" ("RLNE_RLNE")
;

ALTER TABLE  "US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TUSNE"
	FOREIGN KEY ("USNE_USNE") REFERENCES  "FS_AUWEB_US"."US_TUSNE" ("USNE_USNE")
;

       
    
    