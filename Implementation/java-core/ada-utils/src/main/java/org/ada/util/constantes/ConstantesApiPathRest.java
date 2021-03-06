/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.util.constantes;

/**
 *
 * <h1>ConstantesApiPathRest
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class ConstantesApiPathRest {
	
	/*
	 * -----------------------------------------------------------------------------------------------------------------------
	 *  TRANSACCIONES
	 * ----------------------------------------------------------------------------------------------------------------------- 
	 */

	/**
	 * 
	 * CRUD usuario
	 */
	public static final String PATH_REGISTRO_USUARIO   = "/api/usuario/registrar/usuario";
	public static final String PATH_ACTUALIZAR_USUARIO = "/api/usuario/actualizar/usuario";
	public static final String PATH_ASIGNAR_USUARIO    = "/api/usuario/asignar/usuario";
	
	/**
	 * 
	 * CRUD modulo
	 */
	public static final String PATH_REGISTRO_MODULO   = "/api/modulo/registrar/modulo";
	public static final String PATH_ACTUALIZAR_MODULO = "/api/modulo/actualizar/modulo";
	public static final String PATH_ASIGNAR_MODULO    = "/api/modulo/asignar/modulo";
	public static final String PATH_OBTENER_MODULO    = "/api/modulo/obtener/modulo";
	
	
	/**
	 * LOGIN
	 */
	public static final String PATH_LOGIN     		 = "/api/login";
	public static final String PATH_LOGIN_AUWEB      = "/login";
	
	/**
	 * SESSION_CLEAN 
	 */
	public static final String PATH_SESSION_CLEAN = "/api/session/clean";
	
	/**
	 * LOGOUT
	 */
	public static final String PATH_LOGOUT = "/api/logout";
	public static final String PATH_LOGOUT_AUWEB = "/logout";

}
