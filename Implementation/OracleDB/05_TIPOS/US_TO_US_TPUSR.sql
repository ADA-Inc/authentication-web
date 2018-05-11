prompt
prompt TYPE OBJECT:US_TO_US_TPUSR
prompt
CREATE OR REPLACE TYPE FS_AUWEB_US.US_TO_US_TPUSR IS
OBJECT (
      PUSR_PUSR                        NUMBER(22),
      PUSR_USER                        NUMBER(22),
      PUSR_ROLL                        NUMBER(22),
      PUSR_PSNA                        NUMBER(22)
   );
/