### Casos de Uso Proyecto

El proyecto de Receta Electrónica Nacional del MINSAL, presenta diferentes casos de uso, que serán desarrollados durante la vida del proceso. La consideracón básica es que los casos de uso mas recurrentes serán los de **Prescripción** y los de **Dispensación** de Farmacos, sin embargo, también se debe considerar el que se **actualice el estado de cierto** fármaco, ya sea concelando la prescripción, actualizando un medicamento o actualizando el estado de esta a entregada en caso de conterer un fármaco cuya receta deba ser retenida.

Actualmente el proyecto se ha levantado en base a la generación de una *Receta* desde el prescritor que contiene el detalle de cada fármaco prescrito. Este concepto se realizará por medio de la definición de un *agrupador* de prescripciones el cual será usado tanto para el caso de uso de prescripción como para el caso de uso de dispensación. Dado lo anterior el sistema de **Repositorio de  MINSAL** tendrá los servicios para poder diferenciar la Receta de las prescripciones individuales, sin embargo en la dispensación deberá ser el sistema del punto de venta o entrega, aquel que recorra el recurso de receta para revisar cada prescrición contenida en este. 

Luego los Casos de Uso descritos serán los siguientes

* Prescripción
* Dispensación
* Actualización Prescripciones


### Caso de Uso 1: Prescripción
<br>
Este caso de uso describe la generación de una Receta con una o múltiples Prescripciones generadas durante un acto clínico. Esta Receta generada queda para uso del paciente en el proceso de Dispensación y se envía al Repositorio de Recetas del MINSAL. Este caso de uso presenta la siguiente secuenciación
<br>

* **Prescriptor Genera Prescripciones por Fármacos** 

*  El *Prescriptor* genera cada una de las prescripciones de medicamentos individuales, generando el sistema informático estas Prescripciones en formato de recurso **MedictionRequest**. Cada uno de estos recursos generados deben contener un *IdentificationGroup* idéntico entre si, y cuyo valor será el que se genere por medio de un UUID. 
*  Al cerrar el ciclo de creacion de Prescriciones el Sistema del Prestador debe generar la Receta en el formato de un recurso **RequestGroup**. Este recurso también debe replicar el valor del elemento *groupIdentifier* de los **MedicationRequest** generados. El valor del elemento *status* del **RequestGroup** debe ser igual a *active*
<br>

* **Prescriptor Envía a Repositorio Central la Receta**

*  El sistema del Prestador genera una operación *Post* del recurso **RequestGroup** al endPoint de MINSAL  para que la receta sea almacenada en el *Repositorio Central de Recetas*.
*  El Sistema de MINSAL responde al Sistema del Prestador con un *mensaje de estado de recepción* acusando recibo sin error o con errores
<br>
<br>
<br>
<br>


<div align="center">
  <img src="DS_Presc.png"> 
  <p>Diagrama de Secuencias para Prescripción</p>
</div>

<br>



### Caso de Uso 2: Dispensación
<br>

Este caso describe la secuencia de mensajes que se produce al momento en el cual se dispensa o se rechaza la dispensación de uno o más fármacos de la misma receta. El proceso tiene un punto de inicio cuando en el punto de dispensación se hace la solicitud de fármacos por medio del código de barras que contiene el valor del *groupIdentifier* generado  tanto en el agrupador como en las prescripciones individuales al momento de crearse la receta. 
<br>
Este proceso además permite que el **Dispensador** genere cambios de estado en las prescripciones, indicando si esta se ha completado, la cantidad o si esta queda cerrada al ser retenida. Estos elementos se notifican a MINSAL devolviendo el recurso **RequestGroup** actualizado con las consideraciones antes mencionadas.
<br>
<br>

* **Dispensador recibe solicitud de Dispensación**

*  El **Dispensador** lee el código de barras de la receta para poder identificarla 
*  El código de barras identifica el valor de *groupIdentifier* sobre el cual debe hacer la consulta para recuperar la receta del **Repositorio Cental** 
<br>

* **Dispensador consulta por Receta**

*  El sistema del **Dispensador** realiza la consulta al endPoint del  **Repositorio Central** por la receta mediante la operacion *Get* sobre el recurso **RequestGroup** mediante el parámetro *groupIdentifier*
*  El Sistema de MINSAL contesta a la solicitud devolviendo el recurso agrupador correspondiente o indicando un error en caso de no encontrar un **RequestGroup** válido por el parámetro consultado
<br>

* **Dispensador lee las Prescripciones y devuelve receta modificada a MINSAL**

*  El sistema del punto de dispensación recorre el recurso agrupador obteniendo de éste cada una de las Prescripciones representadas en el formato de un recurso **MedicationPrescription**  contenidas en el agrupador Receta.
*  El **Dispensador** hace entrega de los fármacos solicitados por el solicitante, hace registro de esto, de las modificaciones que se puedan producir entre lo que se dispensó v/s lo recetado y en los eventuales cambios de estado que existan en cada *Prescripción recetada*.
*  Por cada dispensación generada, se debe generar un recurso **MedicationDispense**
*  Cada Recurso **MedicationDispense** generado debe ser enviado al **Repositorio Central** mediante la operación *Post*
*  El sistema del punto de dispensación, actualiza la receta representada en el recurso **RequestGroup** y mediante la operación *Put* sobre el endPoint del **Repositorio Central** actualiza dicho recurso. En caso de haber dispensado todas las prescipciones el parámeto *status* pasa a tener valor *completed*
*  El sistema de **Repositorio Central** responde al sistema del punto de dispensación indicando el estado de la actualización con o sin errores.
<br>
<br>
<br>
<br>

<div align="center">
  <img src="DS_Dispen.png"> 
  <p>Diagrama de Secuencias para Dispensación</p>
</div>


<br>
<br>


### Caso de Uso 3: Cambio de Estado Prescripciones Recetadas
<br>

Este caso nos prensenta la capacidad de realizar cambios en una prescripción tanto desde el sistema del Prestador como desde el sistema del Dispensador. Estos cambios obedecen a diferentes razones y se manifiestan como una actualización de las Prescripciones generadas durante el acto clínico con el paciente. Estos cambios se reducen a los siguientes

* *Desde el Prescriptor*

*  Cambio en el fármaco prescrito 
*  Eliminación de la Prescripción
*  Corrección de error en la Prescripción
*  Suspención de la Pescripción
<br>

*Nota:* En todos los casos se debe justificar la razon del cambio de estado, lo cual es factible mediante ciertos parámetros del recurso **MedicationRequest**
<br>

* *Desde el Dispensador*

*  Dispensación de farmaco distinto
*  No dispensación del Fármaco
*  Actualización del estado de una Prescripción (Ej: Retenida al ser dispensada)
<br>
*Nota:* En los casos de no dispensación o de dispensación de fármaco distinto se debe justificar este cambio. Lo anterior se realiza modificando los parámetros tanto en el recurso **MedicationDispense** como en el recurso **MedicationRequest**
<br>

La secuencia del caso de uso se describe a continuación

* **Dispensador o Prescriptor solicitan la Receta**

*  El usuario rescata de la receta generada el código de barras que contiene el valor del parámetro *identifierGroup* de la receta. En ambos casos debe ser ante la presencia del código de barras, ya sea porque el paciente solicita dispensación o porque este solicita al medico un cambio en la receta.
*  Mediante la operación *Get* el sistema correspondiente, consulta al endPoint del **RepositorioCentral** por la receta mediante el uso del parámetro *groupIdentifier*.
*  El sistema de **Repositorio Central** devuelve al sistema solicitante el recurso **RequestGroup** que hace de contenedor de las prescriciones generadas en formato de recurso **MedicationRequest**.

* **Actualización de las Prescripciones**

*  El sistema correspondiente lee del recurso **RequestGroup** cada uno de los recursos **MedicationRequest** contenidos en él.
*  Para cada prescrioción en la cual se realiza un *cambio de estado o actualización*, el sistema modifica los parámetros de su recurso **MedicationRequest** corrspondiente

* **Actualización del Repositorio Central**

*  El sistema **(del Prestador o Punto de Dispensación)**, realiza la operación *Update* al endPoint del **Repositorio Central**, por cada recurso **MedicationRequest** actualizado o modificado
*  El Sistema **Repositorio Central** responde a la solicitud indicando la actualización de los recursos o errores en la operacion solicitada
*  El sistema **Repositorio Central** actualiza los recursos **MedicationRequest** generando una nueva versión de estos.
<br><br>
<br>
<br>
<br>

<div align="center">
  <img src="DS_Cambio.png"> 
  <p>Diagrama de Secuencias para Cambios en Prescripciones</p>
</div>








