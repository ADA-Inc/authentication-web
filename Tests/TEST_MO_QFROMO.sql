DECLARE
  P_NOMBRE_USUARIO VARCHAR2(40);
  P_TT_USMO FS_AUWEB_US.MO_QFROMO.TT_USMO;
  P_COD_RTA VARCHAR2(100);
BEGIN
  P_NOMBRE_USUARIO := 'abc';

  MO_QFROMO.MODULOSACCESOPORNOMBREUSUARIO(
    P_NOMBRE_USUARIO => P_NOMBRE_USUARIO,
    P_TT_USMO => P_TT_USMO,
    P_COD_RTA => P_COD_RTA
  );
  FOR i IN P_TT_USMO.FIRST .. P_TT_USMO.LAST LOOP
            DBMS_OUTPUT.PUT_LINE(P_TT_USMO(i).MODU_NAME);
   END LOOP;
END;