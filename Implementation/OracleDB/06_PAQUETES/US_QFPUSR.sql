
prompt
prompt PACKAGE: US_QFPURS
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.US_QFPURS IS
    --
    -- ===========================================================
    -- US_QFPURS
    -- -----------------------------------------------------------
    -- Todas las funciones del PSNA
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
  
  PROCEDURE crearUsuarioPersona
    (
        p_ttf_usuario_persona               IN  US_QFPURS.US_TOF_PURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    );


  PROCEDURE actualizarPersona
    (
        p_ttf_usuario_persona               IN  US_QFPURS.US_TOF_PURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------

    TYPE  US_TOF_PURS IS RECORD (
       v_type_persona TT_US_TPSNA,
       v_type_rol TT_US_TROLL);



END US_QFPURS;
/


prompt
prompt PACKAGE BODY:US_QFPURS
prompt


CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.US_QFPURS IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearUsuarioPersona
    -- -----------------------------------------------------------
    -- creacion de perSona dado atributos
    -- ===========================================================
     PROCEDURE crearUsuarioPersona
    (
        p_ttf_usuario_persona               IN  US_QFPURS.US_TOF_PURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_existencia_usuario_persona        BOOLEAN;
        v_secuencia                         NUMBER;
        v_cod_rta_tipo                      NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
      
        DBMS_OUTPUT.PUT_LINE('This string breaks
    here.');
    END crearUsuarioPersona;

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE buscarUsuPerPorDocu
    -- -----------------------------------------------------------
    -- busca la persona
    -- ===========================================================
    PROCEDURE buscarUsuPerPorDocu
    (
        p_ttf_usuario_persona               IN  US_QFPURS.US_TOF_PURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    )IS



    BEGIN  

       DBMS_OUTPUT.PUT_LINE('This string breaks
    here.');
        
    END buscarUsuPerPorDocu;
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE actualizarPersona
    -- -----------------------------------------------------------
    -- actualiza los datos de la persona
    -- ===========================================================
   PROCEDURE actualizarPersona
    (
        p_ttf_usuario_persona               IN  US_QFPURS.US_TOF_PURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    )IS
    
        v_id_usuario_persona                US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_tipo                      NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
DBMS_OUTPUT.PUT_LINE('This string breaks
    here.');
        
    END actualizarPersona;
END US_QFPURS;
/