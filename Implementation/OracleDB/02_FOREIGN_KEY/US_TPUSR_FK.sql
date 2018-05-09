REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

/* Create Foreign Key Constraints */

ALTER TABLE  "US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TPSNA"
	FOREIGN KEY ("PSNA_PSNA") REFERENCES  "FS_AUWEB_US"."US_TPSNA" ("PSNA_PSNA")
;

ALTER TABLE  "US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TROLL"
	FOREIGN KEY ("ROLL_ROLL") REFERENCES  "US_TROLL" ("ROLL_ROLL")
;

ALTER TABLE  "US_TPUSR" 
 ADD CONSTRAINT "FK_US_TPUSR_US_TUSER"
	FOREIGN KEY ("USER_USER") REFERENCES  "FS_AUWEB_US"."US_TUSER" ("USER_USER")
;

       
    
    