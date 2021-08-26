### Trasfondo

Este documento presenta los servicios que deberán estar contenidos el desarrollo de Receta Electrónica para el desarrollo de Prescripciones y Dispensaciones en Chile. Así mismo, describe cómo se usan los recursos FHIR para cada uno de los componentes del desarrollo. Esta guía propone todos los atefactos y perfiles necesarios para conseguir los objetivos de interoperabilidad en base al estándar FHIR R4.

### Colaboraciones en el Proyecto

Este es un proyecto impulsado por MINSAL con la colaboración de HL7 Chile. Se ha considerado durante el pilotaje de este proyecto la colaoración de XXX y de XXXX.

![MINSAL](./logominsal.jpg)
![HL7 Chile](./hl7chile.png)
	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

### Audiencia de esta Guía

Esta Guía de Implementación está dirigido a los desarrolladores de las soluciones asociadas a receta electrónica, así como a los profesionales que deseen comprender los procesos o funcionalidades involucrados.


### Aspectos Generales de esta Guía

A continuación se describe el funcionamiento general del proceso de la receta, con las funcionalidades que deberán estar contenidas en el desarrollo solicitado.
Se detalla el modelo, componentes, servicios y aplicaciones que permiten abarcar los diferentes escenarios que se presenten, de modo que esta solución tenga un alcance nacional, tanto público como privado. 

#### Flujo General de Funcionamiento

El proceso del sistema se describe en la siguiente imagen

![Prioceso General](./ProcGeneral.png)
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

El proyecto abarca desde la prescripción médica hasta el momento de la dispensación en una farmacia. La prescripción y la dispensación pueden generarse en diferentes ámbitos. 
Ejemplos: Atención clínica en un establecimiento público y dispensación en farmacia comunitaria, atención clínica en un establecimiento privado y dispensación en farmacia privada. 

El funcionamiento genérico con sus funciones sería el siguiente: 

* Emisión de Receta y Registro en Repositorio: El clínico visualiza los datos administrativos de la receta, como los de identificación de paciente, prestador e institución (traídos automáticamente por el sistema) El ministerio de salud dispondrá de una serie de recursos para la validación de los datos mencionados.   
El clínico ingresa los datos de prescripción, como el fármaco recetado, potencia, dosis.
Posteriormente, se deberá solicitar al administrador de folio, una serie única de identificación de la receta para luego, una vez generado el documento clínico, ser enviado al repositorio centralizado de receta.

* Obtención de Folio y Prescripción en Papel: Un clínico o institución podrá solicitar una serie de folios para la impresión de recetas físicas, que luego podrán ser entregadas de manera habitual al paciente. Será un medio de poder soportar y controlar la validez de las recetas en papel.
Además, se contará con un sistema agrupador de recetas que facilite el proceso de dispensación en farmacia, al dar un mismo ID a todas las prescripciones emitidas en el mismo acto de indicación médica. 

* Aplicación para Paciente: Se dispondrá de una aplicación para el paciente, que permitirá ver las recetas actuales e históricas.   También podrá autorizar a un tercero a ver las recetas que estime conveniente. 
Por último, la app paciente contará con una funcionalidad que permite solicitar al médico (del hospital digital), una repetición de la receta. Esta se realizará en conformidad a la factibilidad clínica del caso. 

* Validación Farmacéutica: El farmacéutico podrá, previo a la dispensación, cambiar algunos detalles como la potencia de la presentación, siempre y cuando cautele la intención terapéutica en cuanto a dosis y duración del tratamiento.

* Dispensación de Receta Electrónica: Cada paciente, desde su app/portal, podrá disponer de las recetas extendidas a su nombre o de algún tercero bajo autorización. 
El ministerio de salud dispondrá de un servicio que permitirá leer, mediante código de barra, datamatrix o afín, el folio de la receta, de modo de poder obtener la información de la receta o el documento mismo desde el repositorio central. 
La farmacia deberá registrar el o los medicamentos dispensados, tanto el producto comercial como información relativa a la cantidad y números disponibles de dispensación.  El detalle será tratado más adelante. 

#### Procesos

El proyecto se separa en básicamente 4 Procesos que son los que se enumeran  continuación:

##### Proceso de Prescripción

Este proceso se desarrolla en el momento en que un Prescriptor desarrolla una Receta. Dentro de los pasos fundamentales de este caso se ecuentra:
<br>

* Validación de Prestador y Paciente
* Validación Terminologica de los Fármacos a Recetar
* Mensajes de estado de Validación
* Guardado en Repositorio de Receta
<br>
El Diagrama es como sigue:
<br>
![Proceso de Prescripción](C:\FSH_Prof\FSH_Paciente\Paciente_CH\input\images\P_Prescripcion.png)
<br>
<br>
<br>
##### Proceso de Dispensación

Este proceso se desarrolla en el momento en que el Dispensador recibe una solicitud de Dispensación de un fármaco por medio de una Receta Electrónica o a Papel.
Los pasos fundamentales son los siguientes:
<br>

* Lectura del Folio
* Validación del Dispensador
* Consulta al Repositorio por Receta
* Revisión de Estatus de Receta
* Notificación al Repositorio
<br>
El Diagrama es como sigue:
<br>
![Proceso de Dispensación](C:\FSH_Prof\FSH_Paciente\Paciente_CH\input\images\P_dispensacion.png)
<br>
<br>
<br>
##### Proceso de Busqueda

Este proceso describe como el Paciente desarrolla la búsqueda de alguna de sus Recetas desde una aplicación.
Los pasos fundamentales son los siguientes:
<br>

* Búsqueda de Receta
* Validación de Acceso por Credenciales
* Recepción de Recetas
<br>
El Diagrama es como sigue:
<br>
![Proceso de Búsqueda](C:\FSH_Prof\FSH_Paciente\Paciente_CH\input\images\P_Busqueda.png)
<br>
<br>
<br>
##### Proceso de Cambio de Estado

Este proceso describe los cambios de estado que sufre una receta durante el ciclo de Dospensación y Prescripción de esta. Estos cambios de estado pueden deberse a multiples razones, las cuales se especifican en los Subset de Valores correspondientes a los recursos estimados para el proyecto.
Los pasos fundamentales son los siguientes:
<br>

* Validación de Usuario
* Consulta y Recepción de Receta
* Cambio de estado
* Actualización de estado en Repositorio
<br>
El Diagrama es como sigue:
<br>
![Proceso de Cambio de Estado](C:\FSH_Prof\FSH_Paciente\Paciente_CH\input\images\P_CambEstado.png)
<br>
<br>
<br>



### Recursos a Disposición
[Ministerio de Salud de Chile] (http://www.minsal.cl)

[Capítulo Chileno de HL7, HL7 Chile](http://hl7chile.cl)

HL7 Internacional (http://hl7.org)

[FHIR R4](http://hl7.org/fhir/)

[FHIR Shorthand Documentation](https://build.fhir.org/ig/HL7/fhir-shorthand) 

[FHIR Shorthand documentation code repository](https://github.com/HL7/fhir-shorthand)

[SUSHI code repository](https://github.com/FHIR/sushi)

[Zulip](https://chat.fhir.org) channel: #shorthand