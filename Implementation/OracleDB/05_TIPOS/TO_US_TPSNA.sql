prompt
prompt TYPE OBJECT:TO_US_TPSNA
prompt
CREATE OR REPLACE TYPE FS_AUWEB_US.TO_US_TPSNA IS
OBJECT (
      PSNA_PSNA                        NUMBER(22),
      PSNA_NOBE                        VARCHAR2(70),
      PSNA_APDO                        VARCHAR2(70),
      PSNA_DIRN                        VARCHAR2(50),
      PSNA_TLFN                        VARCHAR2(50),
      PSNA_EMAL                        VARCHAR2(50),
      PSNA_PAIS                        VARCHAR2(50),
      PSNA_NRID                        VARCHAR2(50)
   );
/