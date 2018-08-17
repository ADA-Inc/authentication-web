/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.rest.respuesta;

import java.util.List;

import org.ada.security.model.usuario.UsuarioModuloArray;

/**
 *
 * <h1>ProcesoRespuestaApiDbModulos
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class ProcesoRespuestaApiRestLogin {
	
	private String idUsuario;
	private String codigoRespuesta;
	private String mensajeRespuesta;
	
	public String getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(String idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getCodigoRespuestaApi() {
		return codigoRespuesta;
	}
	public void setCodigoRespuestaApi(String codigoRespuestaApi) {
		this.codigoRespuesta = codigoRespuestaApi;
	}
	public String getMensajeRespuestaApi() {
		return mensajeRespuesta;
	}
	public void setMensajeRespuestaApi(String mensajeRespuestaApi) {
		this.mensajeRespuesta = mensajeRespuestaApi;
	}
	
	

}
