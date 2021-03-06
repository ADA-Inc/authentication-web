package org.ada.data.access.percistencia.mapper;

import java.util.HashMap;

public interface GestionadorUsuariosMapper {
	
	public void modulosAccesoUsuario(HashMap<Object, Object> parametros);
	
	public void loginUsuario(HashMap<Object, Object> parametros);
	
	public void crearUsuarioConRol(HashMap<Object, Object> parametros);
	
	public void actualizarUsuarioPersona(HashMap<Object, Object> parametros);

	public void asignarRolUsuarioPersona(HashMap<Object, Object> parametros);
	
}
