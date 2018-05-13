prompt
prompt PACKAGE: NE_QHOMO
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.NE_QHOMO IS
    --
    -- ===========================================================
    -- NE_QHOMO
    -- -----------------------------------------------------------
    -- Homologador main de las tablas de modulos y usuarios
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versi�n        GAP                Solicitud        Fecha        Realiz�            Descripci�n
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
  PROCEDURE homologarCoreWebUsuario
    (
        p_persona_usuario_core         IN   US_TTCPURS,
        p_persona_usuario_web          OUT  US_TTWPURS,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    );
  
  PROCEDURE homologarWebCoreUsuario
    (
        p_persona_usuario_web          IN   US_TTWPURS,
        p_persona_usuario_core         OUT  US_TTCPURS,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    );
 
  PROCEDURE homologarCoreWebModulo
    (
        p_modulo_core                  IN   MO_TTCROMO,
        p_modulo_web                   OUT  MO_TTWROMO,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    ); 
    
  PROCEDURE homologarWebCoreModulo
    (
        p_modulo_web                   IN   MO_TTWROMO,
        p_modulo_core                  OUT  MO_TTCROMO,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END NE_QHOMO;
/


prompt
prompt PACKAGE BODY:NE_QHOMO
prompt


CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.NE_QHOMO IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarCoreWebUsuario
    -- -----------------------------------------------------------
    -- insersion type table core en type table web de roles, 
    -- personas y usuarios
    -- ===========================================================
    PROCEDURE homologarCoreWebUsuario
    (
        p_persona_usuario_core         IN   US_TTCPURS,
        p_persona_usuario_web          OUT  US_TTWPURS,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    )IS

    v_tt_persona_usuario_web     US_TTWPURS := US_TTWPURS();
    v_to_persona_usuario_web     US_TOWPURS;
    BEGIN  
          
        IF(p_persona_usuario_core.COUNT != 0) THEN
          FOR i IN p_persona_usuario_core.FIRST .. p_persona_usuario_core.LAST LOOP
            v_to_persona_usuario_web:=US_TOWPURS(
                      p_persona_usuario_core(i).USER_ALAS,
                      p_persona_usuario_core(i).PSNA_NOBE,
                      p_persona_usuario_core(i).PSNA_APDO,
                      p_persona_usuario_core(i).PSNA_DIRN,
                      p_persona_usuario_core(i).PSNA_TLFN,
                      p_persona_usuario_core(i).PSNA_EMAL,
                      p_persona_usuario_core(i).PSNA_PAIS,
                      p_persona_usuario_core(i).PSNA_NRID,
                      p_persona_usuario_core(i).ROLL_RLDN
              );
            v_tt_persona_usuario_web.extend;
            v_tt_persona_usuario_web(v_tt_persona_usuario_web.COUNT) :=v_to_persona_usuario_web;
            --
          END LOOP;

          p_persona_usuario_web := v_tt_persona_usuario_web;
          p_cod_rta  := 'Transferencia relizada';
        ELSE
          p_persona_usuario_web := NULL;
          p_cod_rta  := 'p_persona_usuario_core NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END homologarCoreWebUsuario;
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarWebCoreUsuario
    -- -----------------------------------------------------------
    -- insersion type table web en type table core de roles, 
    -- personas y usuarios
    -- ===========================================================
    PROCEDURE homologarWebCoreUsuario
    (
        p_persona_usuario_web          IN   US_TTWPURS,
        p_persona_usuario_core         OUT  US_TTCPURS,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    )IS
    
    v_tt_persona_usuario_core     US_TTCPURS := US_TTCPURS();
    v_to_persona_usuario_core     US_TOCPURS;
    BEGIN  
          
        IF(p_persona_usuario_web.COUNT != 0) THEN
          FOR i IN p_persona_usuario_web.FIRST .. p_persona_usuario_web.LAST LOOP
            v_to_persona_usuario_core:=US_TOCPURS(
                      NULL,
                      p_persona_usuario_web(i).USER_ALAS,
                      NULL,
                      NULL,
                      p_persona_usuario_web(i).PSNA_NOBE,
                      p_persona_usuario_web(i).PSNA_APDO,
                      p_persona_usuario_web(i).PSNA_DIRN,
                      p_persona_usuario_web(i).PSNA_TLFN,
                      p_persona_usuario_web(i).PSNA_EMAL,
                      p_persona_usuario_web(i).PSNA_PAIS,
                      p_persona_usuario_web(i).PSNA_NRID,
                      NULL,
                      p_persona_usuario_web(i).ROLL_RLDN,
                      sysdate,
                      NULL,
                      NULL,
                      NULL,
                      NULL
              );
            v_tt_persona_usuario_core.extend;
            v_tt_persona_usuario_core(v_tt_persona_usuario_core.COUNT) :=v_to_persona_usuario_core;
            --
          END LOOP;

          p_persona_usuario_core := v_tt_persona_usuario_core;
          p_cod_rta  := 'Transferencia relizada';
        ELSE
          p_persona_usuario_core := NULL;
          p_cod_rta  := 'p_persona_usuario_web NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END homologarWebCoreUsuario;

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarCoreWebModulo
    -- -----------------------------------------------------------
    -- insersion type table core en type table web de roles y 
    -- modulos
    -- ===========================================================
    PROCEDURE homologarCoreWebModulo
    (
        p_modulo_core                  IN   MO_TTCROMO,
        p_modulo_web                   OUT  MO_TTWROMO,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    )IS
    
    v_tt_modulo_web     MO_TTWROMO := MO_TTWROMO();
    v_to_modulo_web     MO_TOWROMO;
    BEGIN  
          
        IF(p_modulo_core.COUNT != 0) THEN
          FOR i IN p_modulo_core.FIRST .. p_modulo_core.LAST LOOP
            v_to_modulo_web:=MO_TOWROMO(
                      p_modulo_core(i).ROLL_RLDN,
                      p_modulo_core(i).MODU_NAME
              );
            v_tt_modulo_web.extend;
            v_tt_modulo_web(v_tt_modulo_web.COUNT) :=v_to_modulo_web;
            --
          END LOOP;

          p_modulo_web := v_tt_modulo_web;
          p_cod_rta  := 'Transferencia relizada';
        ELSE
          p_modulo_web := NULL;
          p_cod_rta  := 'p_modulo_core NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END homologarCoreWebModulo;
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE homologarWebCoreModulo
    -- -----------------------------------------------------------
    -- insersion type table web en type table core de roles y
    -- modulos
    -- ===========================================================
    PROCEDURE homologarWebCoreModulo
    (
        p_modulo_web                   IN   MO_TTWROMO,
        p_modulo_core                   OUT  MO_TTCROMO,
        p_cod_rta                      OUT  NE_TCRTA.CRTA_CRTA%type
    )IS
    
    v_tt_modulo_core     MO_TTCROMO := MO_TTCROMO();
    v_to_modulo_core     MO_TOCROMO;
    BEGIN  
          
        IF(p_modulo_web.COUNT != 0) THEN
          FOR i IN p_modulo_web.FIRST .. p_modulo_web.LAST LOOP
            v_to_modulo_core:=MO_TOCROMO(
                      NULL,
                      p_modulo_web(i).ROLL_RLDN,
                      sysdate,
                      NULL,
                      p_modulo_web(i).MODU_NAME,
                      NULL,
                      NULL,
                      NULL,
                      NULL
              );
            v_tt_modulo_core.extend;
            v_tt_modulo_core(v_tt_modulo_core.COUNT) := v_to_modulo_core;
            --
          END LOOP;

          p_modulo_core := v_tt_modulo_core;
          p_cod_rta  := 'OK';
        ELSE
          p_modulo_core := NULL;
          p_cod_rta  := 'ER_EMP_NUL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END homologarWebCoreModulo;
END NE_QHOMO;
/