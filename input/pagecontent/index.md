### Trasfondo
<br>

Este documenta presenta los servicios que deberán estar contenidos en los desarrollos que permitan la interoperabilidad de los distintos sistemas de **Prescripción** y **Dispensación** con el **Sistema Nacional de Receta Electrónica**. Así mismo, describe cómo se usan los recursos FHIR para cada uno de los componentes del desarrollo. Esta guía propone todos los artefactos y perfiles necesarios para conseguir los objetivos de interoperabilidad en base al estándar HL7 FHIR R4.
<br>
<br>

###	 Colaboraciones en el Proyecto
<br>

Este es un proyecto impulsado por **MINSAL** con la colaboración de **HL7 Chile**.
<br>
<br>

###	 Audiencia de esta Guía
<br>

Esta Guía de Implementación está dirigida a los desarrolladores de las soluciones informáticas asociadas al funcionamiento del **Sistema Nacional de Receta Electrónica** mediante interoperabilidad, así como a los profesionales que deseen comprender los procesos o funcionalidades involucrados.
<br>
<br>

###	 Aspectos Generales de esta Guía 
<br>

A continuación, se describe el funcionamiento general del proceso de la receta, con las funcionalidades que deberán estar contenidas en el desarrollo solicitado. Se detalla el modelo, componentes, servicios y aplicaciones que permiten abarcar los diferentes escenarios que se presenten, de modo que esta solución tenga un alcance nacional, tanto público como privado.
<br>
<br>

####	Flujo General de Funcionamiento
<br>

El proceso del sistema se describe en la siguiente imagen: 
<br>
<br>


<div align="center">
  <img src="Proceso_Receta.png"> 
  <p>Esquema General del Proceso de Receta Electrónica</p>
</div>

<br>

El proyecto abarca desde la prescripción médica hasta el momento de la dispensación en una farmacia. La prescripción y la dispensación pueden generarse en diferentes ámbitos. 

*Ejemplos:* Atención clínica en un establecimiento público y dispensación en farmacia comunitaria, atención clínica en un establecimiento privado y dispensación en farmacia privada.

El funcionamiento genérico con sus funciones sería el siguiente:

*Emisión de Receta y Registro en Repositorio:* El prescriptor visualiza los datos administrativos de la receta, como los de identificación de paciente, prestador e institución (traídos automáticamente por el sistema). El ministerio de salud dispondrá de una serie de recursos para la validación de los datos mencionados.
El clínico ingresa los datos de prescripción, como el fármaco recetado, potencia, dosis. Una vez generado el documento clínico, ser enviado al repositorio centralizado de receta.

*Dispensación de Receta Electrónica:* Cada paciente, desde su aplicación móvil y/o correo electrónico, podrá disponer de las recetas extendidas a su nombre o de algún tercero bajo autorización. El ministerio de salud dispondrá de un servicio que permitirá leer, mediante código de barra, el folio de la receta, de modo de poder obtener la información de la receta o el documento mismo desde el repositorio central. La farmacia deberá registrar el o los medicamentos dispensados, tanto el producto comercial como información relativa a la cantidad y números disponibles de dispensación. El detalle será tratado más adelante.
<br>
<br>

####	Procesos
<br>

El proyecto se separa en básicamente 4 procesos que son los que se enumeran continuación:
<br>

#####	Proceso de prescripción
Este proceso se desarrolla en el momento en que un prescriptor desarrolla una receta. Dentro de
los pasos fundamentales de este caso se encuentran:

* Validación de Prescriptor y Paciente
* Validación Terminológica de los fármacos a recetar
* Registro de prescripción en repositorio de receta
<br>

#####	Proceso de dispensación
Este proceso se desarrolla en el momento en que el dispensador recibe una solicitud de dispensación de un fármaco por medio de una Receta Electrónica. Los pasos fundamentales son los siguientes:
* Lectura del folio
* Validación del dispensador
* Consulta al repositorio por Receta
* Revisión de estado de la Receta
* Notificación de dispensación al repositorio
<br>

####	Proceso de cambio de estado
Este proceso describe los cambios de estado que sufre una receta durante el ciclo de prescripción y dispensación de esta. Estos cambios de estado pueden deberse a múltiples razones, las cuales se especifican en los Subset de valores correspondientes a los recursos estimados para el proyecto. Los pasos fundamentales son los siguientes:
* Validación de usuario
* Consulta y recepción de Receta
* Cambio de estado
* Actualización de estado en repositorio
<br>
<br>

### Contenido de la Guía
<br>

Esta Guía se estructura en base al manú de la parte superior de la siguiente manera:
<br>

* [Inicio](index.html): Página de Bienvenida a la Guía
* [Objetivos](objetivos.html): Información General sobre los objetivos de esta Guía
* [Actores y Casos de Uso](casos.html): Información detallada de los casos de uso, sus actores, y la secuencia de transacciones
* [Operaciones y Terminologías](operaciones.html): Infirmación General de las operaciones básicas que se ejecutan al momento de hacer generar manejo de datos entre un servicio FHIR y los clientes
* [Resumen de Artefactos](artifacts.html): Describe todos los artefactos que son parte de esta GI, separados en Esteuctura de Perfiles, Extensiones, Value Sets y Ejemplos. Dado que esta Guía Hereda su base Canónica desde el Core-CL, algunos de los artefactos descritos son parte de esa Guía
* Perfiles: Este menú despliega el listado de los 4 perfiles generados paraesta GI
  * [Prescripción](StructureDefinition-RecetaPrescripcionCl.html): Perfil del Recurso para la prescripción de un fármaco
  * [Dispensación](StructureDefinition-DispensacionMedicamentoCl.html): Perfil de Recurso para la dispensación de farmacos desde puntos de despacho
  * [Receta](StructureDefinition-RecetaCl.html): Perfil de recurso que permite agrupar diferentes prescriciones en formato de una única receta
  * [Orgaización Para Receta](StructureDefinition-RecetaOrganizacionCl.html): Recurso que define una organización para este proyecto desde el recuso definido en el CORE-CL
* Ejemplos: Listo de ejemplos desarrollados para cada Perfil generado para esta GI
<br>
<br>

### Recursos a Disposición
<br>

[Ministerio de Salud de Chile] (http://www.minsal.cl)

[Capítulo Chileno de HL7, HL7 Chile](http://hl7chile.cl)

HL7 Internacional (http://hl7.org)

[FHIR R4](http://hl7.org/fhir/)

[FHIR Shorthand Documentation](https://build.fhir.org/ig/HL7/fhir-shorthand) 

[FHIR Shorthand documentation code repository](https://github.com/HL7/fhir-shorthand)

[SUSHI code repository](https://github.com/FHIR/sushi)

[Zulip](https://chat.fhir.org) channel: #shorthand

