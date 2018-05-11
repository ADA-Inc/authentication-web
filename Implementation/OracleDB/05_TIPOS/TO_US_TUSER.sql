prompt
prompt TYPE OBJECT:TO_US_TUSER
prompt
CREATE OR REPLACE TYPE FS_AUWEB_US.TO_US_TUSER IS
OBJECT (
      USER_USER                        NUMBER(22),
      USER_ALAS                        VARCHAR2(40),
      USER_PSWD                        VARCHAR2(40)
   );
/