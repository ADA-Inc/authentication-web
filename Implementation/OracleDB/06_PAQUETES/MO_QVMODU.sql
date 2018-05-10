prompt
prompt PACKAGE: MO_QVMODU
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.MO_QVMODU IS
    --
    -- ===========================================================
    -- MO_QVMODU
    -- -----------------------------------------------------------
    -- validador de existencia de modulo por documento
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versión        GAP                Solicitud        Fecha        Realizó            Descripción
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
  PROCEDURE validarModuloPorDocumento
    (
        p_documento_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_existencia_modulo              OUT BOOLEAN,
        p_cod_rta                        OUT NE_TCRTA.CRTA_CRTA%type
    ); 

----------------------------------------------------------
    
END MO_QVMODU;
/


prompt
prompt PACKAGE BODY:MO_QVMODU
prompt

CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.MO_QVMODU IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarmoduloPorDocumento
    -- -----------------------------------------------------------
    -- validar existencia de modulo por documento
    -- ===========================================================
    PROCEDURE validarModuloPorDocumento
    (
        p_documento_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_existencia_modulo              OUT BOOLEAN,
        p_cod_rta                        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_modulo IS
            SELECT
                MODU_NAME
            FROM
                FS_AUWEB_US.MO_TMODU

            r_modulo c_modulo%rowtype;
        
    BEGIN
      
        OPEN  c_modulo;
        FETCH c_modulo INTO r_modulo;
        CLOSE c_modulo;
        
        IF(r_modulo.MODU_NAME IS NULL) then
        
            p_existencia_modulo := TRUE;
            p_cod_rta           := 'OK';
            
        ELSE
            p_existencia_modulo := FALSE;
            p_cod_rta           := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_existencia_modulo := FALSE;
            p_cod_rta           := 'ERROR_NC';
        
    END validarmoduloPorDocumento;
    
END MO_QVMODU;
/