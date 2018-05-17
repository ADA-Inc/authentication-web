package org.ada.business.logic.api.rest.modulo;

import org.ada.data.access.percistencia.gestion.modulo.controlador.GestionadorModuloControllerDB;
import org.ada.security.model.persistencia.respuesta.ProcesoRespuestaApiDb;
import org.ada.security.model.persistencia.modulo.ModuloActualizarDBDto;
import org.ada.security.model.persistencia.modulo.ModuloDBDto;
import org.ada.security.model.rest.respuesta.ProcesoRespuestaApiRest;
import org.ada.security.model.rest.modulo.FuncionalidadModuloRestDto;
import org.ada.security.model.rest.modulo.ModuloActualizarRestDto;
import org.ada.security.model.rest.modulo.ModuloRestDto;
import org.ada.util.constantes.ConstantesApiPathRest;
import org.ada.util.constantes.ConstantesCodigosAplicacion;
import org.ada.util.constantes.ConstantesMensajesAplicacion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class ServicioRestGestionadorModulo {

	@Autowired
	GestionadorModuloControllerDB gestionadorModuloControllerDB;

	@RequestMapping(value = ConstantesApiPathRest.PATH_REGISTRO_MODULO, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> registrarModulo(@RequestBody ModuloRestDto moduloRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.EXISTEN ERRORES  EN LAS VALIDACIONES DE PARAMETROS NEGOCIO PARA EL SERVICIO
		 * ************************************************* 
		 */
		ModuloDBDto moduloDBDto = null;
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;

		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API y se llama el controller
		 * ************************************************* 
		 */

		/*
		 * =====================================
		 * Este if se encarga de ...
		 * =====================================
		 */
		if (moduloRestDto.getNombreModulo()!=null) {


			try {
				moduloDBDto = new ModuloDBDto();
				moduloDBDto.setP_NOMBRE_MODULO(moduloRestDto.getNombreModulo());
				moduloDBDto.setP_DESCRIPCION_MODULO(moduloRestDto.getdescripcionModulo());

				procesoRespuestaApiDb = gestionadorModuloControllerDB.registrarModulo(moduloDBDto);

				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());

				}else {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
					procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
				}

			} catch (Exception e) {
				procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
				procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
				procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
			}

		}else {
			procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
			procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_PARAMETROS_SERVICIO);
			procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_PARAMETROS_SERVICIO);
		}

		if(procesoRespuestaApiRest.getCodigoRespuestaApi()!=null){
			return new ResponseEntity<ProcesoRespuestaApiRest>(procesoRespuestaApiRest,HttpStatus.OK);
		}else {
			return new ResponseEntity<ProcesoRespuestaApiRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}

	@RequestMapping(value = ConstantesApiPathRest.PATH_ACTUALIZAR_MODULO, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> actualizarModulo(@RequestBody FuncionalidadModuloRestDto  funcionalidadModuloRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		ModuloDBDto moduloDBDto = null;
		ModuloRestDto moduloRestDto  = null;
		ModuloActualizarRestDto moduloActualizarRestDto  = null;
		ModuloActualizarDBDto moduloActualizarDBDto= null;
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;

		/*
		  * =====================================
		  * Este if se encarga de ...
		  * =====================================
		*/
		if (funcionalidadModuloRestDto.getModuloRestDto()!= null && funcionalidadModuloRestDto.getActualizarRestDto()!= null) {
			moduloRestDto = funcionalidadModuloRestDto.getModuloRestDto();
			moduloActualizarRestDto = funcionalidadModuloRestDto.getActualizarRestDto();

		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API y se llama el controller
		 * ************************************************* 
		 */

		/*
		 * =====================================
		 * Este if se encarga de ...
		 * =====================================
		 */
		if (moduloRestDto.getNombreModulo()!=null) {
			try {
				
	
				moduloActualizarDBDto = new ModuloActualizarDBDto();
				moduloDBDto = new ModuloDBDto();
				moduloDBDto.setP_NOMBRE_MODULO(moduloRestDto.getNombreModulo());
				
				moduloActualizarDBDto.setP_NOMBRE_MODULO_ACT(moduloActualizarRestDto.getnombreModuloActualizar());
				moduloActualizarDBDto.setP_DESCRIPCION_MODULO_ACT(moduloActualizarRestDto.getdescripcionModuloActualizar());

				procesoRespuestaApiDb = gestionadorModuloControllerDB.actualizarModuloPersona(moduloDBDto,moduloActualizarDBDto);

				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());

				}else {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
					procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
				}

			} catch (Exception e) {
				procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
				procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
				procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
			}

		}else {
			procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
			procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_PARAMETROS_SERVICIO);
			procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_PARAMETROS_SERVICIO);
		}
		}else {
			procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
			procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_PARAMETROS_SERVICIO);
			procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_PARAMETROS_SERVICIO);
		}
		if(procesoRespuestaApiRest.getCodigoRespuestaApi()!=null){
			return new ResponseEntity<ProcesoRespuestaApiRest>(procesoRespuestaApiRest,HttpStatus.OK);
		}else {
			return new ResponseEntity<ProcesoRespuestaApiRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}

	@RequestMapping(value = ConstantesApiPathRest.PATH_ASIGNAR_MODULO, method = RequestMethod.POST)
	public ResponseEntity<ProcesoRespuestaApiRest> asignarRolModuloPersona(@RequestBody ModuloRestDto moduloRestDto) {

		/*
		 * ==============================================
		 * Se realiza instacia de objetos que se utilizaran 
		 * en el medoto.
		 * ************************************************* 
		 */
		ModuloDBDto moduloDBDto = null;
		ProcesoRespuestaApiRest procesoRespuestaApiRest = null;
		ProcesoRespuestaApiDb procesoRespuestaApiDb = null;

		/*
		 * ==============================================
		 * Se se realiza el mapeo de los parametros 
		 * de entrada que necesita el servicio ofrecido por 
		 * la API y se llama el controller
		 * ************************************************* 
		 */

		/*
		 * =====================================
		 * Este if se encarga de ...
		 * =====================================
		 */
		if (moduloRestDto.getNombreModulo()!=null && moduloRestDto.getnombreRoll()!=null) {
			try {
				moduloDBDto = new ModuloDBDto();

				
				moduloDBDto.setP_NOMBRE_ROLL(moduloRestDto.getnombreRoll());
				moduloDBDto.setP_NOMBRE_MODULO(moduloRestDto.getNombreModulo());
				moduloDBDto.setP_DESCRIPCION_MODULO(moduloRestDto.getdescripcionModulo());


				procesoRespuestaApiDb = gestionadorModuloControllerDB.asignarRolModulo(moduloDBDto);

				/*
				 * =====================================
				 * Este if se encarga de ...
				 * =====================================
				 */
				if (procesoRespuestaApiDb!= null && procesoRespuestaApiDb.getCodigoRespuestaApi()!=null ) {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(procesoRespuestaApiDb.getCodigoRespuestaApi());
					procesoRespuestaApiRest.setMensajeRespuestaApi(procesoRespuestaApiDb.getMensajeRespuestaApi());

				}else {
					procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
					procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
					procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
				}

			} catch (Exception e) {
				procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
				procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_SERVICIO);
				procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_SERVICIO);
			}

		}else {
			procesoRespuestaApiRest = new ProcesoRespuestaApiRest();
			procesoRespuestaApiRest.setCodigoRespuestaApi(ConstantesCodigosAplicacion.CODIGO_ERROR_PARAMETROS_SERVICIO);
			procesoRespuestaApiRest.setMensajeRespuestaApi(ConstantesMensajesAplicacion.CODIGO_MENSAJE_ERROR_PARAMETROS_SERVICIO);
		}
		if(procesoRespuestaApiRest.getCodigoRespuestaApi()!=null){
			return new ResponseEntity<ProcesoRespuestaApiRest>(procesoRespuestaApiRest,HttpStatus.OK);
		}else {
			return new ResponseEntity<ProcesoRespuestaApiRest>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
		}


	}
	
}
