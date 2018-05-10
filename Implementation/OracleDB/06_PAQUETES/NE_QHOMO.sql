prompt
prompt PACKAGE: NE_QHOMO
prompt
CREATE OR REPLACE PACKAGE FS_PCRM_US.NE_QHOMO IS
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
        p_persona_usuario_web          IN  US_TTCPURS%type,
    );
  
  PROCEDURE homologarWebCoreUsuario
    (
        p_persona_usuario_core         IN  US_TTWPURS%type
    );
 
  PROCEDURE homologarCoreWebModulo
    (
        p_rol_modulo_web              IN  MO_TTCROMO%type
    ); 
    
  PROCEDURE homologarWebCoreModulo
    (
        p_tempresa_nombre              IN  MO_TTWROMO%type,
    ); 
    -- ------------------------------------------------------------
    
END NE_QHOMO;
/


prompt
prompt PACKAGE BODY:NE_QHOMO
prompt


CREATE OR REPLACE PACKAGE BODY FS_PCRM_US.NE_QHOMO IS


    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario regIStrado en el sIStema pacrim
    -- ===========================================================
    PROCEDURE homologarCoreWebUsuario
    (
        p_persona_usuario_web        IN  US_TTCPURS%type,
    )IS

    CURSOR c_empresa IS
      SELECT
          emne_emne
      FROM
          fs_pcrm_us.em_temne
      WHERE
          emne_nobe=p_nombre_empresa;
          r_empresa c_empresa%rowtype;
        
    BEGIN  
        OPEN c_empresa;
        FETCH c_empresa INTO r_empresa;
        CLOSE c_empresa;
        
        IF(r_empresa.emne_emne IS NOT NULL) THEN
           p_id_empresa := r_empresa.emne_emne;
           p_cod_rta  := 'OK';
                
        ELSE
           p_id_empresa:= NULL;
           p_cod_rta  := 'ER_EMP_NUL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_empresa:= NULL;
                p_cod_rta  := 'ERROR_NC';
        
    END obtenerIdEmpresa;
  
  
        -- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la consultar del rol dado 
    -- un usuario regIStrado en el sIStema pacrim
    -- ===========================================================
    PROCEDURE homologarWebCoreUsuario
    (
        p_persona_usuario_core         IN  US_TTWPURS%type
    )IS
        
    CURSOR c_tempresa IS
      SELECT
        tpem_tpem
      FROM
        fs_pcrm_us.em_ttpem
      WHERE
        tpem_dtem = p_tempresa_nombre;  
        r_tempresa c_tempresa%rowtype;
    
    BEGIN
      OPEN c_tempresa;
      FETCH c_tempresa INTO r_tempresa;
      CLOSE c_tempresa;
      
      IF(r_tempresa.tpem_tpem IS NOT NULL) THEN
      
          p_id_tipo_empresa := r_tempresa.tpem_tpem;
          p_cod_rta  := 'OK';
          
      ELSE
          p_id_tipo_empresa:= NULL;
          p_cod_rta  := 'ER_EMP_NUL';
      END IF;
      
  EXCEPTION
      WHEN OTHERS THEN
          p_id_tipo_empresa:= NULL;
          p_cod_rta  := 'ERROR_NC';
        
    END obtenerIdTEmpresa;
  
  
       -- ===========================================================
    -- PROCEDURE consultarRolUsuarioEmpresa
    -- -----------------------------------------------------------
    -- Servicio especializado para hacer la   consultar del rol dado 
    -- un usuario regIStrado en el sIStema pacrim
    -- ===========================================================
  PROCEDURE obtenerEmpresaPorTipo
    (
        p_nombre_empresa          IN  EM_TEMNE.EMNE_NOBE%type,
        p_tempresa_nombre        IN  EM_TTPEM.TPEM_DTEM%type,
        p_empresa                 OUT EM_TT_EMTP,
        p_cod_rta                  OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_empresa_tipo 
    (
      pc_EMTE_TPEM EM_TTPEM.TPEM_TPEM%type,
      pc_EMTE_EMNE EM_TEMNE.EMNE_EMNE%type
    )IS
      SELECT
         *
      FROM
        em_ttpem te,em_temne e, em_temte es
      WHERE
        te.TPEM_TPEM = es.EMTE_TPEM AND
        e.EMNE_EMNE = es.EMTE_EMNE  AND 
        es.EMTE_TPEM = pc_EMTE_TPEM AND
        es.EMTE_EMNE = pc_EMTE_EMNE;

        r_empresa_tipo c_empresa_tipo%rowtype;

    v_id_nombre_empresa        EM_TTPEM.TPEM_TPEM%type;
    v_id_nombre_tipo_empresa   EM_TTPEM.TPEM_TPEM%type;
    v_cod_rta_tipo             NE_TCRTA.CRTA_CRTA%type;
    v_cod_rta                   NE_TCRTA.CRTA_CRTA%type;
    v_lISta_empresa_tipo       EM_TO_EMTP;

    v_tt_lISta_empresa_tipo EM_TT_EMTP := EM_TT_EMTP();
    BEGIN

    NE_QHOMO.OBTENERIDTEMPRESA
    (
            p_tempresa_nombre,
            v_id_nombre_tipo_empresa,
            v_cod_rta_tipo
        );
    NE_QHOMO.OBTENERIDEMPRESA
    (
            p_nombre_empresa,
            v_id_nombre_empresa,
            v_cod_rta
        );


    IF  v_cod_rta_tipo='OK' AND v_cod_rta='OK' THEN
       FOR   r_empresa_tipo in c_empresa_tipo(v_id_nombre_tipo_empresa,v_id_nombre_empresa) LOOP

                v_lISta_empresa_tipo:=EM_TO_EMTP(
                r_empresa_tipo.TPEM_TPEM,
                r_empresa_tipo.TPEM_DTEM,
                r_empresa_tipo.TPEM_STEM, 
                r_empresa_tipo.TPEM_FCCR,
                r_empresa_tipo.TPEM_FCMO,
                r_empresa_tipo.EMNE_EMNE,
                r_empresa_tipo.EMNE_NOBE,
                r_empresa_tipo.EMNE_NITE,   
                r_empresa_tipo.EMNE_FECR,   
                r_empresa_tipo.EMNE_FEMO,   
                r_empresa_tipo.EMTE_EMTE,    
                r_empresa_tipo.EMTE_DTCR,   
                r_empresa_tipo.EMTE_DTMO,   
                r_empresa_tipo.EMTE_TPEM,   
                r_empresa_tipo.EMTE_EMNE   
            );
                v_tt_lISta_empresa_tipo.extEND;
                v_tt_lISta_empresa_tipo(v_tt_lISta_empresa_tipo.count):=v_lISta_empresa_tipo;

             END LOOP;
            p_empresa:= v_tt_lISta_empresa_tipo;
      p_cod_rta  := 'OK';
    ELSE
            p_empresa:= NULL;
            p_cod_rta  := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_empresa:= NULL;
            p_cod_rta  := 'ERROR_NC';

    END obtenerEmpresaPorTipo;
    
    
END NE_QHOMO;
/