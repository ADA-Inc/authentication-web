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
 * <h1>ModuloActualizarDBDto</h1>
 *
 * Description
 *
 * @author Master-Zen (ADA, Inc) 
 * @version 1.0
 * 
 */

public class ModuloActualizarRestDto {
	  
	  private String nombreModuloActualizar         ;
	  private String descripcionModuloActualizar    ;
	  
	public String getnombreModuloActualizar() {
		return nombreModuloActualizar;
	}
	public void setnombreModuloActualizar(String nombreModuloActualizar) {
		this.nombreModuloActualizar = nombreModuloActualizar;
	}
	public String getdescripcionModuloActualizar() {
		return descripcionModuloActualizar;
	}
	public void setdescripcionModuloActualizar(String descripcionModuloActualizar) {
		this.descripcionModuloActualizar = descripcionModuloActualizar;
	}

}
