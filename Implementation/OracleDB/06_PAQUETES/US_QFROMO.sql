prompt
prompt PACKAGE: MO_QFROMO
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.MO_QFROMO IS
    --
    -- ===========================================================
    -- MO_QFROMO
    -- -----------------------------------------------------------
    -- Todas las funciones del modulo y rol
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

  PROCEDURE obtenerRomoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo           IN  MO_QMODU.MODU_NAME%type,
        p_id_romo                 OUT MO_TROMO.ROMO_ROMO%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );
  PROCEDURE crearRomo
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo             IN  MO_QMODU.MODU_NAME%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );

END MO_QFROMO;
/


prompt
prompt PACKAGE BODY:MO_QFROMO
prompt


CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.MO_QFROMO IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE obtenerRomoId
    -- -----------------------------------------------------------
    -- obtiene el id de el modulo rol 
    -- ===========================================================
    PROCEDURE obtenerRomoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo           IN  MO_QMODU.MODU_NAME%type,
        p_id_romo                 OUT MO_TROMO.ROMO_ROMO%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        cursor c_romo 
        (
            pc_ROLL_ROLL US_TROLL.ROLL_ROLL%type,
            pc_MODU_MODU MO_QMODU.MODU_MODU%type
        )is
            SELECT
                ROMO_ROMO
            FROM
                US_TROLL ro,
                MO_QMODU mo, 
                MO_TROMO rm
            WHERE
                rm.ROMO_ROLL = ro.ROLL_ROLL AND
                rm.ROMO_MODU = mo.MODU_MODU AND
                rm.ROMO_ROLL = pc_ROLL_ROLL AND
                rm.ROMO_MODU = pc_MODU_MODU;

        r_romo                  c_romo%rowtype;
        v_id_roll               US_TROLL.ROLL_ROLL%type;
        v_id_modulo             MO_QMODU.MODU_MODU%type;
        v_cod_rta_roll          NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_modulo        NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );
        US_QUSER.buscarModuloPorNombre
        (
            p_nombre_modulo,
            v_id_modulo,
            v_cod_rta_modulo
        );

        OPEN c_romo(v_id_roll,v_id_modulo);
        FETCH c_romo INTO r_romo;
        CLOSE c_romo;

        IF  v_cod_rta_roll='OK' AND v_cod_rta_modulo='OK' AND r_romo.ROMO_ROMO IS NOT NULL THEN

            p_id_romo := r_romo.ROMO_ROMO;
            p_cod_rta   := 'OK';
        ELSE
            p_id_romo := NULL;
            p_cod_rta   := 'ER_NULL';
        END if;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_romo:= NULL;
                p_cod_rta  := 'ERROR_NC';
            
    END obtenerRomoId;

     --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearRomo
    -- -----------------------------------------------------------
    -- creacion de modulo y rol dado atributos
    -- ===========================================================
    PROCEDURE crearRomo
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo             IN  MO_QMODU.MODU_NAME%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia                 NUMBER;
        v_id_roll                   US_TROLL.ROLL_ROLL%type;
        v_id_modulo                 MO_QMODU.MODU_MODU%type;
        v_cod_rta_roll              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_modulo            NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := MO_SETROMO.NextVal;

        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );

        US_QUSER.buscarModuloPorNombre
        (
            p_nombre_modulo  ,
            v_id_modulo,
            v_cod_rta_modulo
        );
          
        IF  v_cod_rta_roll='OK' AND v_cod_rta_modulo='OK' THEN
           INSERT INTO MO_TROMO(
            ROMO_ROMO,
            ROMO_MODU,
            ROMO_ROLL
          )
          VALUES(
            v_secuencia,
            v_id_modulo,
            v_id_roll
          );
           p_cod_rta     := 'OK';
        ELSE
           p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
        
    END crearRomo;
END MO_QFROMO;
/