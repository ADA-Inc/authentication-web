package org.ada.data.access.percistencia.mapper;

import java.util.HashMap;

public interface GestionadorModulosMapper {
	
	public void crearModulo(HashMap<Object, Object> parametros);
	
	public void actualizarModulo(HashMap<Object, Object> parametros);

	public void asignarRolModulo(HashMap<Object, Object> parametros);

}
