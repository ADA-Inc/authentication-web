prompt
prompt TYPE OBJECT:MO_TO_MO_TMODU
prompt
CREATE OR REPLACE TYPE FS_AUWEB_US.MO_TO_MO_TMODU IS
OBJECT (
      MODU_MODU                        NUMBER(22),
      MODU_NAME                        VARCHAR2(50),
      MODU_DESC                        VARCHAR2(50)
   );
/