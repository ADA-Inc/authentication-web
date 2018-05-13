prompt
prompt PACKAGE: US_QFPUSR
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.US_QFPUSR IS
    --
    -- ===========================================================
    -- US_QFPUSR
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

  PROCEDURE obtenerUsperoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_ROLL%type,
        p_nombre_usuario          IN  US_TUSER.USER_USER%type,
        p_documento_persona       IN  US_TPSNA.PSNA_PSNA%type,
        p_id_uspero               OUT US_TPUSR.PUSR_PUSR%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );
  PROCEDURE crearUspero
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_password_usuario          IN  US_TUSER.USER_PSWD%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );

END US_QFPUSR;
/


prompt
prompt PACKAGE BODY:US_QFPUSR
prompt


CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.US_QFPUSR IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE obtenerUsperoId
    -- -----------------------------------------------------------
    -- obtiene el id de el usuario persona rol 
    -- ===========================================================
    PROCEDURE obtenerUsperoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_ROLL%type,
        p_nombre_usuario          IN  US_TUSER.USER_USER%type,
        p_documento_persona       IN  US_TPSNA.PSNA_PSNA%type,
        p_id_uspero               OUT US_TPUSR.PUSR_PUSR%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        cursor c_uspero 
        (
            pc_ROLL_ROLL US_TROLL.ROLL_ROLL%type,
            pc_USER_USER US_TUSER.USER_USER%type,
            pc_PSNA_PSNA US_TPSNA.PSNA_PSNA%type
        )is
            SELECT
               *
            FROM
                US_TROLL ro,
                US_TUSER us, 
                US_TPSNA ps,
                US_TPUSR upr
            WHERE
                upr.PUSR_ROLL = ro.ROLL_ROLL AND
                upr.PUSR_USER = us.USER_USER AND
                upr.PUSR_PSNA = ps.PSNA_PSNA AND
                upr.PUSR_ROLL = pc_ROLL_ROLL AND
                upr.PUSR_USER = pc_USER_USER AND
                upr.PUSR_PSNA = pc_PSNA_PSNA;

        r_uspero                c_uspero%rowtype;
        v_id_roll               US_TROLL.ROLL_ROLL%type;
        v_id_usuario            US_TUSER.USER_USER%type;
        v_id_persona            US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_roll          NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_usuario       NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona       NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );
        US_QUSER.buscarUsuarioPorNombre
        (
            p_nombre_usuario,
            v_id_usuario,
            v_cod_rta_usuario
        );
        US_QPSNA.buscarPersonaPorDocumento
        (
            p_documento_persona,
            v_id_persona,
            v_cod_rta_persona
        );

        OPEN c_uspero(v_id_roll,v_id_usuario,v_id_persona);
        FETCH c_uspero INTO r_uspero;
        CLOSE c_uspero;

        IF  v_cod_rta_roll='OK' AND v_cod_rta_usuario='OK' AND v_cod_rta_persona='OK' THEN

            p_id_uspero := r_uspero.PUSR_PUSR;
            p_cod_rta   := 'OK';
        ELSE
            p_id_uspero := NULL;
            p_cod_rta   := 'ER_EMP_NUL';
        END if;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_uspero:= NULL;
                p_cod_rta  := 'ERROR_NC';
            
    END obtenerUsperoId;

     --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearUspero
    -- -----------------------------------------------------------
    -- creacion de usuario persona y rol dado atributos
    -- ===========================================================
    PROCEDURE crearUspero
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
        p_password_usuario          IN  US_TUSER.USER_PSWD%type,
        p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
        p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
        p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
        p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
        p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
        p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
        p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia                 NUMBER;
        v_id_roll                   US_TROLL.ROLL_ROLL%type;
        v_id_usuario                US_TUSER.USER_USER%type;
        v_id_persona                US_TPSNA.PSNA_PSNA%type;
        v_cod_rta_roll              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_usuario           NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_persona           NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := US_SETPUSR.NextVal;

        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );

        US_QUSER.crearUsuario
        (
            p_nombre_usuario  ,
            p_password_usuario,
            v_id_usuario,
            v_cod_rta_usuario
        );

        US_QPSNA.crearPersona
        (
            p_documento_persona,
            p_nombres_persona  ,
            p_apellido_persona ,
            p_direccion_persona,
            p_telefono_persona ,
            p_email_persona    ,
            p_pais_persona     ,
            v_id_persona       ,
            v_cod_rta_persona
        );
          
        IF  v_cod_rta_roll='OK' AND v_cod_rta_usuario='OK' AND v_cod_rta_persona='OK' THEN
           INSERT INTO US_TPUSR(
            PUSR_PUSR,
            PUSR_USER,
            PUSR_ROLL,
            PUSR_PSNA
          )
          VALUES(
            v_secuencia,
            v_id_usuario,
            v_id_roll,
            v_id_persona
          );
           p_cod_rta     := 'OK';
        ELSE
           p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END crearUspero;
END US_QFPUSR;
/