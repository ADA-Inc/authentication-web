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
 * <h1>ModuloDBDto</h1>
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class ModuloDBDto {
	
	  private String P_NOMBRE_ROLL   		 ;
	  private String P_NOMBRE_MODULO         ;
	  private String P_DESCRIPCION_MODULO    ;
	  
	
	public String getP_NOMBRE_ROLL() {
		return P_NOMBRE_ROLL;
	}
	public void setP_NOMBRE_ROLL(String P_NOMBRE_ROLL) {
		this.P_NOMBRE_ROLL = P_NOMBRE_ROLL;
	}
	public String getP_NOMBRE_MODULO() {
		return P_NOMBRE_MODULO;
	}
	public void setP_NOMBRE_MODULO(String p_NOMBRE_ROLL) {
		P_NOMBRE_MODULO = p_NOMBRE_ROLL;
	}
	public String getP_DESCRIPCION_MODULO() {
		return P_DESCRIPCION_MODULO;
	}
	public void setP_DESCRIPCION_MODULO(String p_NOMBRE_USUARIO) {
		P_DESCRIPCION_MODULO = p_NOMBRE_USUARIO;
	}
}
