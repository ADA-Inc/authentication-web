/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.persistencia.modulo;

/**
 *
 * <h1>ModuloActualizarDBDto</h1>
 *
 * Description
 *
 * @author Master-Zen (ADA, Inc) 
 * @version 1.0
 * 
 */
public class ModuloActualizarDBDto {

	private String P_NOMBRE_MODULO_ACT      	;
	private String P_DESCRIPCION_MODULO_ACT     ;

	public String getP_NOMBRE_MODULO_ACT() {
		return P_NOMBRE_MODULO_ACT;
	}
	public void setP_NOMBRE_MODULO_ACT(String p_NOMBRE_USUARIO_ACT) {
		P_NOMBRE_MODULO_ACT = p_NOMBRE_USUARIO_ACT;
	}
	public String getP_DESCRIPCION_MODULO_ACT() {
		return P_DESCRIPCION_MODULO_ACT;
	}
	public void setP_DESCRIPCION_MODULO_ACT(String p_PASSWORD_USUARIO_ACT) {
		P_DESCRIPCION_MODULO_ACT = p_PASSWORD_USUARIO_ACT;
	}
}
