/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.gestion.usuario.controlador;

import java.util.HashMap;

import org.ada.data.access.percistencia.mapper.GestionadorUsuariosMapper;
import org.ada.security.model.persistencia.respuesta.ProcesoRespuestaApiDb;
import org.ada.security.model.persistencia.usuario.UsuarioActualizarDBDto;
import org.ada.security.model.persistencia.usuario.UsuarioDBDto;
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
public class GestionadorUsuarioControllerDB {

	@Autowired
	GestionadorUsuariosMapper gestionUsuariosMapper;
	
	public ProcesoRespuestaApiDb loginUsuario( UsuarioDBDto usuarioDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		parametrosInOout.put("p_nombre_usuario",usuarioDBDto.getP_NOMBRE_USUARIO() );
		parametrosInOout.put("p_password_usuario",usuarioDBDto.getP_PASSWORD_USUARIO() );
		
		parametrosInOout.put("p_id_usuario", null);
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionUsuariosMapper.loginUsuario(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setIdUsuario( 		  (String) parametrosInOout.get("p_id_usuario"));
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi((String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}

	}

	public ProcesoRespuestaApiDb registrarUsuarioRol( UsuarioDBDto usuarioDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_roll",usuarioDBDto.getP_NOMBRE_ROLL() );
		parametrosInOout.put("p_nombre_usuario",usuarioDBDto.getP_NOMBRE_USUARIO() );
		parametrosInOout.put("p_password_usuario",usuarioDBDto.getP_PASSWORD_USUARIO() );
		parametrosInOout.put("p_documento_persona",usuarioDBDto.getP_DOCUMENTO_PERSONA() );
		parametrosInOout.put("p_nombres_persona",usuarioDBDto.getP_NOMBRES_PERSONA() );
		parametrosInOout.put("p_apellido_persona",usuarioDBDto.getP_APELLIDO_PERSONA() );
		parametrosInOout.put("p_direccion_persona",usuarioDBDto.getP_DIRECCION_PERSONA() );
		parametrosInOout.put("p_telefono_persona",usuarioDBDto.getP_TELEFONO_PERSONA() );
		parametrosInOout.put("p_email_persona",usuarioDBDto.getP_EMAIL_PERSONA() );
		parametrosInOout.put("p_pais_persona", usuarioDBDto.getP_PAIS_PERSONA());
		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionUsuariosMapper.crearUsuarioConRol(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}




	}
	
	
	public ProcesoRespuestaApiDb actualizarUsuarioPersona( UsuarioDBDto usuarioDBDto,UsuarioActualizarDBDto usuarioActualizarDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_usuario",usuarioDBDto.getP_NOMBRE_USUARIO() );
		parametrosInOout.put("p_documento_persona",usuarioDBDto.getP_DOCUMENTO_PERSONA() );
		
		parametrosInOout.put("p_documento_persona_act",usuarioActualizarDBDto.getP_DOCUMENTO_PERSONA_ACT() );
		parametrosInOout.put("p_nombres_persona_act",usuarioActualizarDBDto.getP_NOMBRES_PERSONA_ACT() );
		parametrosInOout.put("p_apellido_persona_act",usuarioActualizarDBDto.getP_APELLIDO_PERSONA_ACT() );
		parametrosInOout.put("p_direccion_persona_act",usuarioActualizarDBDto.getP_DIRECCION_PERSONA_ACT() );
		parametrosInOout.put("p_telefono_persona_act",usuarioActualizarDBDto.getP_TELEFONO_PERSONA_ACT() );
		parametrosInOout.put("p_email_persona_act", usuarioActualizarDBDto.getP_EMAIL_PERSONA_ACT());
		parametrosInOout.put("p_pais_persona_act",usuarioActualizarDBDto.getP_PAIS_PERSONA_ACT() );
		parametrosInOout.put("p_nombre_usuario_act", usuarioActualizarDBDto.getP_NOMBRE_USUARIO_ACT());
		parametrosInOout.put("p_password_usuario_act",usuarioActualizarDBDto.getP_PASSWORD_USUARIO_ACT() );

		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionUsuariosMapper.actualizarUsuarioPersona(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}

	}

	
	public ProcesoRespuestaApiDb asignarRolUsuarioPersona( UsuarioDBDto usuarioDBDto)  throws Exception{


		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */

		HashMap<Object, Object> parametrosInOout = new HashMap<Object, Object>();
		ProcesoRespuestaApiDb  respuestaApiDb = null;



		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API 
		 * ************************************************* 
		 */
		
		parametrosInOout.put("p_nombre_roll",usuarioDBDto.getP_NOMBRE_ROLL() );
		parametrosInOout.put("p_nombre_usuario",usuarioDBDto.getP_NOMBRE_USUARIO() );
		parametrosInOout.put("p_documento_persona",usuarioDBDto.getP_DOCUMENTO_PERSONA() );
		

		parametrosInOout.put("p_cod_rta", null);
		parametrosInOout.put("p_msj_rta", null);
		gestionUsuariosMapper.asignarRolUsuarioPersona(parametrosInOout);
		respuestaApiDb = new ProcesoRespuestaApiDb();
		
		respuestaApiDb.setCodigoRespuestaApi( (String) parametrosInOout.get("p_cod_rta"));
		respuestaApiDb.setMensajeRespuestaApi( (String) parametrosInOout.get("p_msj_rta"));

		if (respuestaApiDb!=null && respuestaApiDb.getCodigoRespuestaApi()!=null) {

			return respuestaApiDb;

		}else {
			return null;
		}

	}	
}




