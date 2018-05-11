
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
        p_ttf_usuario_persona               IN  US_TTPURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    );
 
  PROCEDURE buscarUsuarioPersonaPorDocumento
    (
        p_ttf_usuario_persona               IN  US_TTPURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    
  PROCEDURE actualizarPersona
    (
        p_ttf_usuario_persona               IN  US_TTPURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
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
        p_ttf_usuario_persona               IN  US_TTPURS,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_existencia_usuario_persona        BOOLEAN;
        v_secuencia                         NUMBER;
        v_cod_rta_tipo                      NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := US_SETPUSR.NextVal;

        IF(p_ttf_usuario_persona.COUNT != 0) THEN
          FOR i IN p_ttf_usuario_persona.FIRST .. p_ttf_usuario_persona.LAST LOOP

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
        
    END crearUsuarioPersona;

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE buscarUsuarioPersonaPorDocumento
    -- -----------------------------------------------------------
    -- busca la persona
    -- ===========================================================
    PROCEDURE buscarUsuarioPersonaPorDocumento
    (
        p_documento_usuario_persona            IN  US_TPSNA.PSNA_NRID%type,
        p_id_usuario_persona                   OUT US_TPSNA.PSNA_PSNA%type,
        p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_usuario_persona IS
        SELECT 
            PSNA_PSNA
        FROM
            FS_AUWEB_US.US_TPSNA
        WHERE
            PSNA_NRID = p_documento_usuario_persona;

        r_usuario_persona c_usuario_persona%rowtype;

    BEGIN  

        OPEN  c_usuario_persona;
        FETCH c_usuario_persona INTO r_usuario_persona;
        CLOSE c_usuario_persona;
          
        IF(r_usuario_persona.PSNA_PSNA IS NOT NULL) THEN
          p_id_usuario_persona  :=  r_usuario_persona.PSNA_PSNA;
          p_cod_rta     := 'busqueda exitosa';
        ELSE
          p_cod_rta     := 'no se encontro el documento de PSNA';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END buscarPersonaPorDocumento;
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
        p_documento_usuario_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_documento_usuario_persona_act     IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_usuario_persona_act       IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_usuario_persona_act      IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_usuario_persona_act     IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_usuario_persona_act      IN  US_TPSNA.PSNA_TLFN%type,
        p_email_usuario_persona_act         IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_usuario_persona_act          IN  US_TPSNA.PSNA_PAIS%type,
        p_cod_rta                           OUT NE_TCRTA.CRTA_CRTA%type
    )IS
    
        v_id_usuario_persona                US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_tipo                      NE_TCRTA.CRTA_CRTA%type;

    BEGIN  

        US_QFPURS.buscarPersonaPorDocumento
        (
            p_documento_usuario_persona,             
            v_id_usuario_persona,
            v_cod_rta_tipo                      
        );

        IF(v_id_usuario_persona IS NOT NULL) THEN

            UPDATE 
                FS_AUWEB_US.US_TPSNA
            SET 
                PSNA_NRID = p_documento_usuario_persona_act,
                PSNA_NOBE = p_nombres_usuario_persona_act,
                PSNA_APDO = p_apellido_usuario_persona_act,
                PSNA_DIRN = p_direccion_usuario_persona_act,
                PSNA_TLFN = p_telefono_usuario_persona_act,
                PSNA_EMAL = p_email_usuario_persona_act,
                PSNA_PAIS = p_pais_usuario_persona_act
            WHERE 
                PSNA_PSNA = v_id_usuario_persona;

              p_cod_rta     := 'actualizacion exitosa';
        ELSE
              p_cod_rta     := v_cod_rta_tipo;
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END actualizarPersona;
END US_QFPURS;
/