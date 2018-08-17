/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.gestion.modulo.controlador;

import java.util.HashMap;

import org.ada.data.access.percistencia.mapper.GestionadorModulosMapper;
import org.ada.security.model.persistencia.respuesta.ProcesoRespuestaApiDbModulos;
import org.ada.security.model.persistencia.modulo.ModuloActualizarDBDto;
import org.ada.security.model.persistencia.modulo.ModuloDBDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



/**
 *
 * <h1>GestionConvocatoriaControllerDB</h1>
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */

@Component
public class GestionadorModuloControllerDB {

	@Autowired
	GestionadorModulosMapper gestionModulosMapper;

	public ProcesoRespuestaApiDbModulos registrarModulo( ModuloDBDto moduloDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDbModulos  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_modulo",moduloDBDto.getP_NOMBRE_MODULO() );
		parametrosInOout.put("p_descripcion_modulo",moduloDBDto.getP_DESCRIPCION_MODULO() );
		
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionModulosMapper.crearModulo(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDbModulos();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}




	}
	
	
	public ProcesoRespuestaApiDbModulos actualizarModuloPersona( ModuloDBDto moduloDBDto,ModuloActualizarDBDto moduloActualizarDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDbModulos  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_modulo",moduloDBDto.getP_NOMBRE_MODULO() );
		
		parametrosInOout.put("p_nombre_modulo_act",moduloActualizarDBDto.getP_NOMBRE_MODULO_ACT() );
		parametrosInOout.put("p_descripcion_modulo_act",moduloActualizarDBDto.getP_DESCRIPCION_MODULO_ACT() );

		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionModulosMapper.actualizarModulo(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDbModulos();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}

	}

	
	public ProcesoRespuestaApiDbModulos asignarRolModulo( ModuloDBDto moduloDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDbModulos  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_roll",moduloDBDto.getP_NOMBRE_ROLL() );
		parametrosInOout.put("p_nombre_modulo",moduloDBDto.getP_NOMBRE_MODULO() );
		parametrosInOout.put("p_descripcion_modulo",moduloDBDto.getP_DESCRIPCION_MODULO() );
		

		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionModulosMapper.asignarRolModulo(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDbModulos();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}

	}	
}




