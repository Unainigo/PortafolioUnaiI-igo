Consultas datos profesionales

CREATE DEFINER=`db689368806`@`%` PROCEDURE `DDatosProfesionalesBorrarSegunPDNI`(IN `_PDNI` VARCHAR(11) CHARSET utf8)
    SQL SECURITY INVOKER
DELETE FROM `datosprofesionales`
WHERE PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `IDatosProfesionalesNuevo`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_CV` VARCHAR(255) CHARSET utf8, IN `_Porfolio` VARCHAR(255) CHARSET utf8, IN `_TipoProfesional` VARCHAR(50) CHARSET utf8, IN `_Idiomas` VARCHAR(255) CHARSET utf8)
    SQL SECURITY INVOKER
INSERT INTO `datosprofesionales`(PDNI, CV,  Portfolio, TipoProfesional, Idiomas)
VALUES(_PDNI, _CV, _Porfolio, _TipoProfesional, _Idiomas);

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaDatosProfesionalesSEgunDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PDNI, CV, Porfolio, TipoPRofesional, Idiomas from `datosprofesionales` WHERE datosprofesionales.PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `UDatosProfesionalesModificarSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_CV` VARCHAR(255) CHARSET utf8, IN `_Porfolio` VARCHAR(255) CHARSET utf8, IN `_TipoProfesional` VARCHAR(50) CHARSET utf8, IN `_Idiomas` VARCHAR(255) CHARSET utf8)
    SQL SECURITY INVOKER
UPDATE `datosprofesionales`
SET CV = _CV,
Portfolio = _Porfolio,
TipoProfesional = _TipoProfesional,
Idiomas = _Idiomas
WHERE PDNI = _PDNI;

Consultas Formacion

REATE DEFINER=`db689368806`@`%` PROCEDURE `DFormacionBorrarSegunPDNiYPTitulacion`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_PTitulacion` INT(11))
    SQL SECURITY INVOKER
DELETE FROM `formacion`
WHERE PDNI = _PDNI AND PTitulacion = _PTitulacion;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `DFormacionBorrarTodaSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    SQL SECURITY INVOKER
DELETE FROM `formacion`
WHERE PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `IFormacionNueva`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_PTitulacion` INT(11), IN `_PEspecialidad` INT(11), IN `_Cursando` BIT(1), IN `_FechaInicio` DATE, IN `_FechaFin` DATE, IN `_CentroEstudios` VARCHAR(255) CHARSET utf8)
    SQL SECURITY INVOKER
INSERT INTO `formacion`(PDNI, PTitulacion, PEspecialidad, Cursado, FechaInicio, FechaFin, CentroEstudios)
VALUES(_PDNI, _PTitulacion, _PEspecialidad, _Cursando, _FechaInicio, _FechaFin, _CentroEstudios);

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SFormacionCompletaSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT datospersonales.PDNI, titulacion.PID AS "IDTitulacion", titulacion.descripcion AS "titulacion", especialidad.PID AS "IDEspecialidad", especialidad.descripcion AS "especialidad", formacion.cursado, formacion.FechaInicio, formacion.FechaFin, formacion.CentroEstudios 
FROM`datospersonales` INNER JOIN ( `titulacion` INNER JOIN (`especialidad` INNER JOIN `formacion` ON especialidad.PID = formacion.pespecialidad) ON titulacion.PID = formacion.ptitulacion) ON datospersonales.PDNI = formacion.PDNI                                                                  
WHERE datospersonales.PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaFormacionSegunDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PDNI, PTitulacion, PEspecialidad, Cursado, FechaInicio, FechaFin, CentroEstudios from `formacion` WHERE formacion.PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `UFormacionSegunPDNiPTitulacionYPEspecialidad`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_PTitulacion` INT(11), IN `_PEspecialidad` INT(11), IN `_Cursado` BIT(1), IN `_FechaInicio` DATE, IN `_FechaFin` DATE, IN `_CentroEstudios` VARCHAR(255) CHARSET utf8)
    SQL SECURITY INVOKER
UPDATE `formacion`
SET PTitulacion = _PTitulacion,
PEspecialidad = _PEspecialidad,
Cursado = _Cursado,
FechaInicio = _FechaInicio,
FechaFin = _FechaFin,
CentroEstudios = _CentroEstudios
WHERE PDNI = _PDNI AND PTitulacion = _PTitulacion AND PEspecialidad = _PEspecialidad;

Consultas equipo

CREATE DEFINER=`db689368806`@`%` PROCEDURE `DEquipoBorrarSegunPIDProyectoYPDNI`(IN `_PIDProyecto` INT(11), IN `_PDNI` VARCHAR(9) CHARSET utf8)
    SQL SECURITY INVOKER
DELETE FROM `equipo`
WHERE PIDProyecto = _PIDProyecto AND PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `IEquipoNuevo`(IN `_PIDProyecto` INT(11), IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_Cargo` VARCHAR(150) CHARSET utf8, IN `_Responsiva` BIT(1), IN `_Gastos` float)
    SQL SECURITY INVOKER
INSERT INTO `equipo`(PIDProyecto, PDNI, Cargo, Responsiva, Gastos)
VALUES(_PIDProyecto, _PDNI, _Cargo, _Responsiva, _Gastos);

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaEquipoSegunPIDProyecto`(IN `_PIDProyecto` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PIDPRoyecto, PDNI, Cargo, Responsiva, Gastos  from `equipo` WHERE equipo.PIDProyecto = _PIDProyecto;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaPersonaDeEquipoSegunPIdYPDNI`(IN `_PIDProyecto` INT(11), IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PIDPRoyecto, PDNI, Cargo, Responsiva, Gastos  from `equipo` WHERE equipo.PIDPRoyecto = _PIDProyecto AND equipo.PDNI = _PDNI;

REATE DEFINER=`db689368806`@`%` PROCEDURE `SProyectoCuentaSegunPDNIYEstado`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_EEstadoActual` INT(11),IN `_Desde` INT(11),IN `_Cantidad` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT COUNT(`proyecto`.PID) AS Proyectos
 FROM `proyecto` INNER JOIN `equipo` ON `proyecto`.PID = `equipo`.PIDProyecto
 WHERE `equipo`.PDNI = _PDNI AND `proyecto`.EEstadoActual = _EEstadoActual
 ORDER BY PDNI;
 
 CREATE DEFINER=`db689368806`@`%` PROCEDURE `SProyectoSegunPDNIYEstadoDesdePIDHastaCantidad`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_EEstadoActual` INT(11),IN `_Desde` INT(11),IN `_Cantidad` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT `proyecto`.PID, `proyecto`.Activo, `proyecto`.CorreoElectronico, `proyecto`.EScrumMaster, `proyecto`.Tipo, `proyecto`.Estado, `proyecto`.Cliente, `proyecto`.JefeDeCuenta, `proyecto`.Item, `proyecto`.Gastos, `proyecto`.Observaciones, `proyecto`.FrecuenciaScrum, `proyecto`.Retrospectiva, `proyecto`.EPropietarioDelProducto, `proyecto`.EEstadoActual  
 FROM `proyecto` INNER JOIN `equipo` ON `proyecto`.PID = `equipo`.PIDProyecto
 WHERE `equipo`.PDNI = _PDNI AND `proyecto`.EEstadoActual = _EEstadoActual AND `proyecto`.PID >= _Desde
 ORDER BY PDNI
 LIMIT _Cantidad;
 
 CREATE DEFINER=`db689368806`@`%` PROCEDURE `UEquipoModificarSegunPIDPRoyectoYPDNI`(IN `_PIDProyecto` INT(11), IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_Cargo` VARCHAR(255) CHARSET utf8, IN `_Responsiva` BIT(1), IN `_Gastos` INT(11))
    SQL SECURITY INVOKER
UPDATE `equipo`
SET PDNI = _PDNI,
Cargo = _Cargo,
Responsiva = _Responsiva,
Gastos = _Gastos
WHERE PIDProyecto = _PIDProyecto AND PDNI = _PDNI;

Consultas Datos personales

CREATE DEFINER=`db689368806`@`%` PROCEDURE `IDatosPersonalesNuevo`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_NSS` VARCHAR(20) CHARSET utf8, IN `_Carnet` BIT(1), IN `_Coche` BIT(1), IN `_NumeroCuenta` VARCHAR(100) CHARSET utf8, IN `_TelefonoContacto1` VARCHAR(20) CHARSET utf8, IN `_TelefonoContacto2` VARCHAR(20) CHARSET utf8, IN `_CorreoElectronico` TEXT CHARSET utf8, IN `_Pais` VARCHAR(50) CHARSET utf8, IN `_Provincia` VARCHAR(50) CHARSET utf8, IN `_FechaNacimiento` DATE, IN `_FechaIngreso` DATE,IN `_FechaBaja` DATE, IN `_Direccion` TEXT CHARSET utf8, IN `_CodigoPostal` varchar(20), IN `_Nombre` VARCHAR(70) CHARSET utf8, IN `_Apellidos` VARCHAR(171) CHARSET utf8, IN `_Estado` INT(11))
    SQL SECURITY INVOKER
INSERT INTO `datospersonales`(PDNI, NSS, Carnet, Coche, NumeroCuenta, TelefonoContacto1, TelefonoContacto2, CorreoElectronico, Pais, Provincia, FechaNAcimiento, FechaIngreso, FechaBaja, Direccion, CodigoPostal, Nombre, Apellidos, Estado)
VALUES(_PDNI, _NSS, _Carnet, _Coche, _NumeroCuenta, _TelefonoContacto1, _TelefonoContacto2, _CorreoElectronico, _Pais, _Provincia, _FechaNacimiento, _FechaIngreso, _FechaBaja, _Direccion, _CodigoPostal, _Nombre, _Apellidos, _Estado);

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SConsultoresSegunEstadoDesdePIDHastaCantidad`(IN `_Estado` INT(11), IN `_Desde` INT(11),IN `_Cantidad` INT(11) )
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT ID, PDNI, NSS, Carnet, Coche, NumeroCuenta, TelefonoContacto1, TelefonoContacto2, CorreoElectronico, PAis, Provincia, FechaNacimiento, FechaIngreso, FechaBaja, Direccion, CodigoPostal, Nombre, Apellidos, Estado 
 FROM `datospersonales` 
 WHERE Estado = _Estado AND ID >= _Desde
 ORDER BY ID
 LIMIT _Cantidad;
 
 CREATE DEFINER=`db689368806`@`%` PROCEDURE `SDatosPersonalesDesdeIDHastaCantidad`(IN `_ID` INT(11), IN `_Cantidad` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT ID, PDNI, Nombre, Apellidos, TelefonoContacto1, TelefonoContacto2, CorreoElectronico, FechaNacimiento, FechaIngreso, FechaBaja, NSS, NumeroCuenta, Carnet, Coche, Pais, PRovincia, Direccion, CodigoPostal, Estado
FROM `datospersonales` 
WHERE datospersonales.ID >= _ID 
ORDER BY datospersonales.ID
LIMIT _Cantidad;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SDepartamentoActualDeUnConsultorSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT departamento.PID AS "IDDepartamento", departamento.descripcion AS "departamento", seccion.PID AS "IDSeccion", seccion.descripcion AS "seccion", departamentoseccionconsultor.PDNI
FROM `datospersonales` INNER JOIN (`departamento` INNER JOIN (`seccion` INNER JOIN `departamentoseccionconsultor` ON seccion.PID = departamentoseccionconsultor.ESeccion) ON departamento.PID = departamentoseccionconsultor.EDepartamento) ON datospersonales.PDNI = departamentoseccionconsultor.PDNI
WHERE datospersonales.PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SFormacionCompletaSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT datospersonales.PDNI, titulacion.PID AS "IDTitulacion", titulacion.descripcion AS "titulacion", especialidad.PID AS "IDEspecialidad", especialidad.descripcion AS "especialidad", formacion.cursado, formacion.FechaInicio, formacion.FechaFin, formacion.CentroEstudios 
FROM`datospersonales` INNER JOIN ( `titulacion` INNER JOIN (`especialidad` INNER JOIN `formacion` ON especialidad.PID = formacion.pespecialidad) ON titulacion.PID = formacion.ptitulacion) ON datospersonales.PDNI = formacion.PDNI                                                                  
WHERE datospersonales.PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaDatosPersonalesSegunDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT ID, PDNI, Nombre, Apellidos, TelefonoContacto1, TelefonoContacto2, CorreoElectronico, FechaNacimiento, FechaIngreso, FechaBaja, NSS, NumeroCuenta, Carnet, Coche, Pais, PRovincia, Direccion, CodigoPostal, Estado from `datospersonales` WHERE datospersonales.PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `UDatosPersonalesModificarSegunID`(IN `_ID` INT(11), IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_NSS` VARCHAR(20) CHARSET utf8, IN `_Carnet` BIT(1), IN `_Coche` VARCHAR(1) CHARSET utf8, IN `_NumeroCuenta` VARCHAR(100) CHARSET utf8, IN `_TelefonoContacto1` VARCHAR(20) CHARSET utf8, IN `_TelefonoContacto2` VARCHAR(20) CHARSET utf8, IN `_CorreoElectronico` TEXT CHARSET utf8, IN `_Pais` VARCHAR(50) CHARSET utf8, IN `_Provincia` VARCHAR(100) CHARSET utf8, IN `_FechaNacimiento` DATE, IN `_FechaIngreso` DATE, IN `_Direccion` TEXT CHARSET utf8, IN `_CodigoPostal` varchar(20), IN `_Nombre` VARCHAR(70) CHARSET utf8, IN `_Apellidos` VARCHAR(141) CHARSET utf8,IN `_Estado` int(11),IN `_FechaBaja` Date)
    SQL SECURITY INVOKER
UPDATE `datospersonales`
SET PDNI = _PDNI,
NSS = _NSS,
Carnet = _Carnet,
Coche = _Coche,
NumeroCuenta = _NumeroCuenta,
TelefonoContacto1 = _TelefonoContacto1,
TelefonoContacto2 = _TelefonoContacto2,
CorreoElectronico = _CorreoElectronico,
Pais = _Pais,
Provincia = _Provincia,
FechaNacimiento = _FechaNacimiento,
FechaIngreso = _FechaIngreso,
FechaBaja = _FechaBaja,
Direccion = _Direccion,
CodigoPostal = _CodigoPostal,
Nombre = _Nombre,
Apellidos = _Apellidos,
Estado = _Estado
WHERE ID = _ID;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `UDatosPersonalesModificarSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_NSS` VARCHAR(20) CHARSET utf8, IN `_Carnet` BIT(1), IN `_Coche` VARCHAR(1) CHARSET utf8, IN `_NumeroCuenta` VARCHAR(100) CHARSET utf8, IN `_TelefonoContacto1` VARCHAR(20) CHARSET utf8, IN `_TelefonoContacto2` VARCHAR(20) CHARSET utf8, IN `_CorreoElectronico` TEXT CHARSET utf8, IN `_Pais` VARCHAR(50) CHARSET utf8, IN `_Provincia` VARCHAR(100) CHARSET utf8, IN `_FechaNacimiento` DATE, IN `_FechaIngreso` DATE, IN `_Direccion` TEXT CHARSET utf8, IN `_CodigoPostal` varchar(20), IN `_Nombre` VARCHAR(70) CHARSET utf8, IN `_Apellidos` VARCHAR(141) CHARSET utf8, IN `_Estado` int(11),IN `_FechaBaja` Date)
    SQL SECURITY INVOKER
UPDATE `datospersonales`
SET NSS = _NSS,
Carnet = _Carnet,
Coche = _Coche,
NumeroCuenta = _NumeroCuenta,
TelefonoContacto1 = _TelefonoContacto1,
TelefonoContacto2 = _TelefonoContacto2,
CorreoElectronico = _CorreoElectronico,
Pais = _Pais,
Provincia = _Provincia,
FechaNacimiento = _FechaNacimiento,
FechaIngreso = _FechaIngreso,
FechaBaja = _FechaBaja,
Direccion = _Direccion,
CodigoPostal = _CodigoPostal,
Nombre = _Nombre,
Apellidos = _Apellidos,
Estado = _Estado
WHERE PDNI = _PDNI;

Consultas departamento seccion consultor

CREATE DEFINER=`db689368806`@`%` PROCEDURE `DDepartamentoSeccionConsultorBorrarSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    SQL SECURITY INVOKER
DELETE FROM `departamentoseccionconsultor`
WHERE PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `IDepartamentoSeccionConsultorNuevo`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_EDepartamento` INT(11), IN `_ESeccion` INT(11))
    SQL SECURITY INVOKER
INSERT INTO `departamentoseccionconsultor`(PDNI, EDepartamento, ESeccion)
VALUES(_PDNI, _EDepartamento, _ESeccion);

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SDepartamentoActualDeUnConsultorSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT departamento.PID AS "IDDepartamento", departamento.descripcion AS "departamento", seccion.PID AS "IDSeccion", seccion.descripcion AS "seccion", departamentoseccionconsultor.PDNI
FROM `datospersonales` INNER JOIN (`departamento` INNER JOIN (`seccion` INNER JOIN `departamentoseccionconsultor` ON seccion.PID = departamentoseccionconsultor.ESeccion) ON departamento.PID = departamentoseccionconsultor.EDepartamento) ON datospersonales.PDNI = departamentoseccionconsultor.PDNI
WHERE datospersonales.PDNI = _PDNI;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `UDepartamentoSeccionConsultorModificarSegunPDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_EDepartamento` INT(11), IN `_ESeccion` INT(11))
    SQL SECURITY INVOKER
UPDATE `departamentoseccionconsultor`
SET EDepartamento =_EDepartamento,
ESeccion = _ESeccion
WHERE PDNI = _PDNI;

Consultas usuarios

CREATE DEFINER=`db689368806`@`%` PROCEDURE `IUsuarioNuevo`(IN `_PDNI` varchar(9) CHARSET utf8 , IN `_Clave` varchar(100) CHARSET utf8, IN `_NivelDeAcceso` int(11), IN `_Nombre` varchar(70) CHARSET utf8, IN `_Apellidos` varchar(141), IN `_CorreoElectronico` varchar(255) CHARSET utf8, IN `_FechaIngreso` date, IN `_FechaBaja` date)
    SQL SECURITY INVOKER
INSERT INTO `usuario`(PDNI, Clave, NivelDeAcceso, Nombre, Apellidos, CorreoElectronico, FechaIngreso, FechaBaja)
VALUES(_PDNI, _Clave, _NivelDeAcceso, _Nombre, _Apellidos, _CorreoElectronico, _FechaIngreso, _FechaBaja );

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaUsuarioSegunDNI`(IN `_PDNI` VARCHAR(9) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PDNI, Clave, NivelDeAcceso, Nombre, Apellidos, CorreoElectronico, FechaIngreso, FechaBaja 
FROM `usuario`
 WHERE usuario.PDNI = _PDNI;
 
 CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaUsuarioSegunNivelDeAcceso`(IN `_NivelDeAcceso` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PDNI, Clave, NivelDeAcceso, Nombre, Apellidos, CorreoElectronico, FechaIngreso, FechaBaja 
from `usuario` 
WHERE usuario.NivelDeAcceso = _NivelDeAcceso;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SIniciarSesionSegunPDNIYClave`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_Clave` VARCHAR(100) CHARSET utf8)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT  ID, PDNI, Clave, NivelDeAcceso, Nombre, Apellidos, CorreoElectronico, FechaIngreso, FechaBaja
FROM `usuario`
WHERE PDNI = _PDNI AND Clave = _Clave;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `UUsuarioActualizarSegunID`(IN `_Clave` VARCHAR(9) CHARSET utf8,IN `_NivelDeAcceso` int(11),IN `_Nombre` VARCHAR(70) CHARSET utf8,IN `_Apellidos` VARCHAR(141) CHARSET utf8,IN `_CorreoElectronico` VARCHAR(255) CHARSET utf8,IN `_FechaIngreso` DATE,IN `_FechaBaja` DATE,IN `_ID` INT(11)  )
    SQL SECURITY INVOKER
UPDATE `usuario`
 SET Clave = _Clave,
 NivelDeAcceso = _NivelDeAcceso,
 Nombre = _Nombre,
 Apellidos = _Apellidos,
 CorreoElectronico = _CorreoElectronico,
 FechaIngreso = _FechaIngreso,
 FechaBaja = _FechaBaja
 WHERE ID = _ID;
 
 CREATE DEFINER=`db689368806`@`%` PROCEDURE `UUsuarioActualizarSegunPDNI`(IN `_Clave` VARCHAR(9) CHARSET utf8,IN `_NivelDeAcceso` int(11),IN `_Nombre` VARCHAR(70) CHARSET utf8,IN `_Apellidos` VARCHAR(141) CHARSET utf8,IN `_CorreoElectronico` VARCHAR(255) CHARSET utf8,IN `_FechaIngreso` DATE,IN `_FechaBaja` DATE,IN `_PDNI` VARCHAR(9) CHARSET utf8 )
    SQL SECURITY INVOKER
UPDATE `usuario`
 SET Clave = _Clave,
 NivelDeAcceso = _NivelDeAcceso,
 Nombre = _Nombre,
 Apellidos = _Apellidos,
 CorreoElectronico = _CorreoElectronico,
 FechaIngreso = _FechaIngreso,
 FechaBaja = _FechaBaja
 WHERE PDNI = _PDNI;
 
 Consultas Proyectos
 
 CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaProyectoSegunPID`(IN `_PID` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PID, Activo, CorreoElectronico, EScrumMaster, Tipo, Estado, Cliente, JefeDeCuenta, Item, Gastos, Observaciones, FrecuenciaScrum, Retrospectiva, EPropietarioDelProducto, EEstadoActual from `proyecto` WHERE proyecto.PID = _PID;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SProyectoCuentaSegunPDNIYEstado`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_EEstadoActual` INT(11),IN `_Desde` INT(11),IN `_Cantidad` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT COUNT(`proyecto`.PID) AS Proyectos
 FROM `proyecto` INNER JOIN `equipo` ON `proyecto`.PID = `equipo`.PIDProyecto
 WHERE `equipo`.PDNI = _PDNI AND `proyecto`.EEstadoActual = _EEstadoActual
 ORDER BY PDNI;
 
 CREATE DEFINER=`db689368806`@`%` PROCEDURE `SProyectoSegunEEstadoActualDesdeIDHastaCantidad`(IN `_EEstadoActual` INT(11), IN `_Desde` INT(11),IN `_Cantidad` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PID, ACtivo, CorreoElectronico, EScrumMaster, Tipo, Estado, Cliente, JefeDeCuenta, Item, Gastos, Observaciones, FrecuenciaScrum, Retrospectiva, EPropietarioDelProducto, EEstadoActual  
 FROM `proyecto` 
 WHERE EEstadoActual = _EEstadoActual AND PID >= _Desde
 ORDER BY PID
 LIMIT _Cantidad;

 CREATE DEFINER=`db689368806`@`%` PROCEDURE `SProyectoSegunPDNIYEstadoDesdePIDHastaCantidad`(IN `_PDNI` VARCHAR(9) CHARSET utf8, IN `_EEstadoActual` INT(11),IN `_Desde` INT(11),IN `_Cantidad` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT `proyecto`.PID, `proyecto`.Activo, `proyecto`.CorreoElectronico, `proyecto`.EScrumMaster, `proyecto`.Tipo, `proyecto`.Estado, `proyecto`.Cliente, `proyecto`.JefeDeCuenta, `proyecto`.Item, `proyecto`.Gastos, `proyecto`.Observaciones, `proyecto`.FrecuenciaScrum, `proyecto`.Retrospectiva, `proyecto`.EPropietarioDelProducto, `proyecto`.EEstadoActual  
 FROM `proyecto` INNER JOIN `equipo` ON `proyecto`.PID = `equipo`.PIDProyecto
 WHERE `equipo`.PDNI = _PDNI AND `proyecto`.EEstadoActual = _EEstadoActual AND `proyecto`.PID >= _Desde
 ORDER BY PDNI
 LIMIT _Cantidad;

 CREATE DEFINER=`db689368806`@`%` PROCEDURE `UProyectoModificarSegunPID`(IN `_PID` INT(11), IN `_Activo` BIT(1), IN `_CorreoElectronico` VARCHAR(255) CHARSET utf8, IN `_EScrumMaster` VARCHAR(9) CHARSET utf8, IN `_Tipo` VARCHAR(100) CHARSET utf8, IN `_Estado` VARCHAR(100) CHARSET utf8, IN `_Cliente` VARCHAR(255) CHARSET utf8, IN `_JefeDeCuenta` VARCHAR(255) CHARSET utf8, IN `_Item` VARCHAR(255) CHARSET utf8, IN `_Gastos` FLOAT, IN `_Observaciones` TEXT CHARSET utf8, IN `_FrecuenciaScrum` VARCHAR(50) CHARSET utf8, IN `_Retrospectiva` VARCHAR(100) CHARSET utf8, IN `_EPropietarioDelProducto` VARCHAR(9) CHARSET utf8,IN `_EEstadoActual` INT(11))
    NO SQL
UPDATE `proyecto`
SET Activo = _Activo,
CorreoElectronico = _CorreoElectronico,
EScrumMaster = _EScrumMaster,
Tipo = _Tipo,
Estado = _Estado,
Cliente =_Cliente,
JefeDeCuenta = _JefeDeCuenta,
Item = _Item,
Gastos = _Gastos,
Observaciones = _Observaciones,
FrecuenciaScrum = _FrecuenciaScrum,
Retrospectiva = _Retrospectiva,
EPropietarioDelProducto = _EPropietarioDelProducto,
EEstadoActual = _EEstadoActual
WHERE PID = _PID;

Consultas Pila del producto

CREATE DEFINER=`db689368806`@`%` PROCEDURE `IPilaDelProductoNueva`(IN `_EIDProyecto` INT(11), IN `_EFase` INT(11), IN `_EDNIPropietario` VARCHAR(9) CHARSET utf8, IN `_Descripcion` VARCHAR(255) CHARSET utf8, IN `_Estado` VARCHAR(255) CHARSET utf8, IN `_HorasEstimadas` DATE, IN `_HorasReales` DATE)
    SQL SECURITY INVOKER
INSERT INTO `piladelproducto`(EIDProyecto, EFase, EDNIPropietario, Descripcion, Estado, HorasEstimadas, HorasReales)
VALUES(_EIDProyecto, _EFase, _EDNIPropietario, _Descripcion, _Estado, _HorasEstimadas, _HorasReales);

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SGenericaPilaDelProductoSegunPId`(IN `_PID` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PID, EIDProyecto, EFase, EDNIPRopietario, Descripcion, Estado, HorasEstimadas, HorasReales from `piladelproducto` WHERE piladelproducto.PID = _PID;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SPilaDelProductoAsignadosSegunEIDProyecto`(IN `_EIDProyecto` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PID, Descripcion, EFase, EIDProyecto, Estado, HorasEstimadas, HorasReales
FROM `piladelproducto` 
WHERE piladelproducto.EIDProyecto = _EIDProyecto AND EDNIPropietario IS NOT NULL;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SPilaDelProductoAsignadosSegunEIDProyectoYEFase`(IN `_EIDProyecto` INT, IN `_EFase` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PID, Descripcion, EFase, EIDProyecto, Estado, HorasEstimadas, HorasReales
FROM `piladelproducto` 
WHERE piladelproducto.EIDProyecto = _EIDProyecto AND piladelproducto.EFase = _EFase AND EDNIPropietario IS NOT NULL;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SPilaDelProductoSinAsignarSegunEIDProyecto`(IN `_EIDProyecto` INT(11))
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PID, Descripcion, EFase, EIDProyecto, Estado, HorasEstimadas, HorasReales
FROM `piladelproducto` 
WHERE piladelproducto.ednipropietario IS NULL AND piladelproducto.EIDProyecto = _EIDProyecto;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `SPilaDelProductoSinAsignarSegunEIDProyectoYEFase`(IN `_EIDProyecto` INT, IN `_EFase` INT)
    READS SQL DATA
    SQL SECURITY INVOKER
SELECT PID, Descripcion, EFase, EIDProyecto, Estado, HorasEstimadas, HorasReales
FROM `piladelproducto` 
WHERE piladelproducto.ednipropietario IS NULL AND piladelproducto.EIDProyecto = _EIDProyecto AND piladelproducto.EFase = _EFase;

CREATE DEFINER=`db689368806`@`%` PROCEDURE `UPilaDelProductoSegunPID`(IN `_PID` INT(11), IN `_EIDProyecto` INT(11), IN `_EFase` INT(11), IN `_EDNIPropietario` VARCHAR(9) CHARSET utf8, IN `_Descripcion` VARCHAR(255) CHARSET utf8, IN `_Estado` VARCHAR(255) CHARSET utf8, IN `_HorasEstimadas` float, IN `_HorasReales` float)
    SQL SECURITY INVOKER
UPDATE `piladelproducto`
SET EIDProyecto = _EIDProyecto,
EFase = _EFase,
EDNIPRopietario = _EDNIPRopietario,
Descripcion = _Descripcion,
Estado = _Estado,
HorasEstimadas = _HorasEstimadas,
HorasReales = _HorasReales
WHERE PID = _PID;
