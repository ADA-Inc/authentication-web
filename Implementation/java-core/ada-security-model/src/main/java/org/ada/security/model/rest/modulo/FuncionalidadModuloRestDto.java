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
 * <h1>FuncionalidadUsuarioRestDto
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class FuncionalidadModuloRestDto {
	
	public ModuloActualizarRestDto actualizarRestDto;
	
	public ModuloRestDto moduloRestDto;

	public ModuloActualizarRestDto getActualizarRestDto() {
		return actualizarRestDto;
	}

	public void setActualizarRestDto(ModuloActualizarRestDto actualizarRestDto) {
		this.actualizarRestDto = actualizarRestDto;
	}

	public ModuloRestDto getModuloRestDto() {
		return moduloRestDto;
	}

	public void setModuloRestDto(ModuloRestDto moduloRestDto) {
		this.moduloRestDto = moduloRestDto;
	}
	
	

}
