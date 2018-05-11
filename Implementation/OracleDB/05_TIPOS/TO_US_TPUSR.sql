prompt
prompt TYPE OBJECT:TO_US_TPURS
prompt
CREATE OR REPLACE TYPE FS_AUWEB_US.TO_US_TPURS IS
OBJECT (
      PUSR_PUSR                        NUMBER(22),
      PUSR_USER                        NUMBER(22),
      PUSR_ROLL                        NUMBER(22),
      PUSR_PSNA                        NUMBER(22)
   );
/