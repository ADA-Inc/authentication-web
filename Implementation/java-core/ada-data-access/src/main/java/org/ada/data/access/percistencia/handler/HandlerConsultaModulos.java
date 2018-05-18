/*
 * MIT License 
 * 
 * Copyright (c) 2018 ADA INC
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 */

package org.ada.data.access.percistencia.handler;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.ada.security.model.usuario.UsuarioModuloArray;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

/**
 *
 * <h1>HandlerConsultaConvocatoria
 *
 * Description
 *
 * @author THEOVERLORDKOTAN (ADA, Inc) 
 * @version 1.0
 * 
 */
public class HandlerConsultaModulos implements TypeHandler<Object> {

	public void setParameter(PreparedStatement ps, int i, Object parameter, JdbcType jdbcType) throws SQLException {
			/*
			 * =======================
			 * Declaracion de varibles 
			 * =======================
			*/
		
		
			//Inicio logica
		
	}

	public Object getResult(ResultSet rs, String columnName) throws SQLException {
			/*
			 * =======================
			 * Declaracion de varibles 
			 * =======================
			*/
		
		
			//Inicio logica
		return null;
		
	}

	public Object getResult(ResultSet rs, int columnIndex) throws SQLException {
			/*
			 * =======================
			 * Declaracion de varibles 
			 * =======================
			*/
		
		
			//Inicio logica
		return null;
		
	}

	public Object getResult(CallableStatement cs, int columnIndex) throws SQLException {
		/*
		 * =======================
		 * Declaracion de varibles 
		 * =======================
		*/
	  List<UsuarioModuloArray> lista = new ArrayList<UsuarioModuloArray>();
	  Object[] structArray = null;
	  String valor = null;
	  Object[] structAttr;
	  java.sql.Struct mystruct = null;
	  UsuarioModuloArray solicitudMostrarModulos = null;
	
		//Inicio logica

	  try {
		  structArray = (Object[]) cs.getArray(columnIndex).getArray();
		  if (structArray != null && structArray.length>0) {
			  for (Object structObj : structArray) {
				  
				  solicitudMostrarModulos = new UsuarioModuloArray();
				  mystruct = (java.sql.Struct) structObj;
				  structAttr = mystruct.getAttributes();

				  solicitudMostrarModulos.setIdModulo((String) structAttr[0]);
				  
				  solicitudMostrarModulos.setNombreModulo((String) structAttr[1]);
				  
				  lista.add(solicitudMostrarModulos);
			  }
		  }
	  }catch (Exception e) {
		  lista = null;
	  }
	  return lista;
		
	}
	
	}

	