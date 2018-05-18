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
 * <h1>ProcesoRespuestaApiDb
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class ProcesoRespuestaApiRest {
	
	private String idUsuario;
	private List<UsuarioModuloArray> modulos;
	public List<UsuarioModuloArray> getModulos() {
		return modulos;
	}
	public void setModulos(List<UsuarioModuloArray> modulos) {
		this.modulos = modulos;
	}
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
