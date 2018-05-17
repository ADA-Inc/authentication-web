/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.security.model.rest.modulo;

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
public class ModuloRestDto {
	
	  private String nombreRoll   		 ;
	  private String nombreModulo        ;
	  private String descripcionModulo   ;
	  
	public String getnombreRoll() {
		return nombreRoll;
	}
	public void setnombreRoll(String nombreRoll) {
		this.nombreRoll = nombreRoll;
	}
	public String getNombreModulo() {
		return nombreModulo;
	}
	public void setNombreModulo(String nombreModulo) {
		this.nombreModulo = nombreModulo;
	}
	public String getdescripcionModulo() {
		return descripcionModulo;
	}
	public void setdescripcionModulo(String descripcionModulo) {
		this.descripcionModulo = descripcionModulo;
	}
	
}
