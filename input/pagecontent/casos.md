### Casos de Uso Proyecto

El Sistema Nacional de Receta Electrónica del MINSAL, presenta diferentes casos de uso, que serán desarrollados durante el ciclo de vida del proceso. La consideración básica es que los casos de uso más recurrentes serán los de **Prescripción** y los de **Dispensación** de fármacos, sin embargo, también se debe considerar el que se **actualice el estado de cierta prescripción o dispensación** fármaco, ya sea cancelando la prescripción, actualizando un medicamento o actualizando el estado a entregado en caso de contener un fármaco cuya receta deba ser retenida.

Actualmente el SNRE se ha levantado en base a la generación de una *Receta* desde el prescriptor que contiene el detalle de cada fármaco prescrito. Este concepto se realizará por medio de la definición de un *agrupador* de prescripciones el cual será usado tanto para el caso de uso de prescripción como para el caso de uso de dispensación. Dado lo anterior el sistema de **Repositorio de  MINSAL** tendrá los servicios para poder diferenciar la Receta de las prescripciones individuales, sin embargo, en la dispensación deberá ser el sistema del punto de venta o entrega, aquel que recorra el recurso de receta para revisar cada prescripción contenida en este. 

Luego los Casos de Uso descritos serán los siguientes

* Prescripción
* Dispensación
* Actualización Prescripciones


### Caso de Uso 1: Prescripción
<br>
Este caso de uso describe la generación de una Receta con una o múltiples Prescripciones generadas durante un acto clínico. Esta Receta generada queda para uso del paciente en el proceso de Dispensación y se envía al Repositorio de Recetas del MINSAL. Este caso de uso presenta la siguiente secuenciación:
<br>

* **Prescriptor Genera Prescripciones por Fármacos** 

*  El *Prescriptor* genera cada una de las prescripciones de medicamentos individuales, generando el sistema informático estas Prescripciones en formato de recurso **MedictionRequest**. Cada uno de estos recursos generados deben contener un *groupIdentifier* idéntico entre sí, y cuyo valor será el que se genere por medio de un UUID (identificador único universal o universally unique identifier ).
*  Al cerrar el ciclo de creación de prescripciones, el sistema del prescriptor debe generar la Receta en el formato de recurso **RequestGroup**. Este recurso también debe replicar el valor del elemento *groupIdentifier* de los **MedicationRequest** generados. El valor del elemento *status* del **RequestGroup** debe ser siempre igual a *active*
<br>

* **Prescriptor Envía a Repositorio Central la Receta**

*  El sistema del Prescriptor genera una operación *Post* del recurso **RequestGroup** al EndPoint de MINSAL  para que la receta sea almacenada en el *Repositorio Central de Recetas*.
*  El Sistema de MINSAL responde al Sistema del Prescriptor con un *mensaje de estado de recepción* acusando recibo sin error o con errores
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

Este caso describe la secuencia de mensajes que se produce al momento en el cual se dispensa o se rechaza la dispensación de uno o más fármacos de la misma receta. El proceso tiene un punto de inicio cuando en el lugar de dispensación se hace la solicitud de la información de la receta por medio la digitación del identificador o por medio del código de barras que contiene el valor del  *groupIdentifier* generado  tanto en el agrupador como en las prescripciones individuales al momento de crearse la receta. 
<br>

Este proceso, además permite que el **Dispensador** genere cambios de estado en las prescripciones, indicando si esta se ha dispensado, la cantidad dispensada o si esta queda bloqueada al ser retenida. Estos elementos se notifican a MINSAL enviando el recurso **MedicationDispense**.
<br>
<br>

* **Dispensador recibe solicitud de Dispensación**

*  El **Dispensador** digita el código identificador o lee el código de barras de la receta para poder identificarla.
*  El código de barras identifica el valor de *groupIdentifier* sobre el cual debe hacer la consulta para recuperar la receta del **Repositorio Central** 
<br>

* **Dispensador consulta por Receta**

*  El sistema del **Dispensador** realiza la consulta al EndPoint del **Repositorio Central** por la receta mediante la operación *Get* sobre el recurso **RequestGroup** mediante el parámetro *groupIdentifier*
*  El Sistema de MINSAL contesta a la solicitud devolviendo el recurso agrupador correspondiente o indicando un error en caso de no encontrar un **RequestGroup** válido por el parámetro consultado
<br>

*  El sistema del punto de dispensación recorre el recurso agrupador obteniendo de éste cada una de las Prescripciones representadas en el formato de un recurso **MedicationRequest**  contenidas en el agrupador Receta.
*  El **Dispensador** hace entrega de los fármacos paciente por el solicitante, hace registro de esto, de las modificaciones que se puedan producir entre lo que se dispensó v/s lo recetado y en los eventuales cambios de estado que existan en cada *Prescripción recetada*.

*  Por cada dispensación que es dispensada, se debe generar un recurso **MedicationDispense**

*  Cada Recurso **MedicationDispense** generado debe ser enviado al **Repositorio Central** mediante la operación *Post*
*  El sistema del punto de dispensación, actualiza la receta representada en el recurso **RequestGroup** y mediante la operación *PUT* sobre el EndPoint del **Repositorio Central** actualiza dicho recurso en caso de ser necesario. 

* El sistema de **Repositorio Central** responde al sistema del punto de dispensación indicando si el recurso **MedicationDispense** se generó sin errores o se identificaron errores en su generación.
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

Este caso nos presenta la capacidad de realizar cambios en una prescripción tanto desde el sistema del Prescriptor como desde el sistema del Dispensador. Estos cambios obedecen a diferentes razones y se manifiestan como una actualización de las Prescripciones generadas durante el acto clínico con el paciente. Estos cambios se reducen a los siguientes

* *Desde el Prescriptor*

*  Cambio en el fármaco prescrito 
*  Eliminación de la Prescripción
*  Corrección de error en la Prescripción
*  Suspensión de la prescripción
<br>

*Nota:* En todos los casos se debe justificar la razón del cambio de estado, lo cual es factible mediante ciertos parámetros del recurso **MedicationRequest**
<br>

* *Desde el Dispensador*

*  Dispensación de fármaco distinto
*  No dispensación del Fármaco
*  Actualización del estado de una prescripción (Ej: Retenida al ser dispensada)
<br>
*Nota:* En los casos de no dispensación o de dispensación de fármaco distinto se debe justificar este cambio. Lo anterior se realiza modificando los parámetros en el recurso **MedicationDispense**
<br>

La secuencia del caso de uso se describe a continuación

* **Dispensador o Prescriptor solicitan la Receta**

*  El usuario rescata de la receta generada el código de barras que contiene el valor del parámetro *identifierGroup* de la receta. En ambos casos debe ser ante la presencia del código de barras, ya sea porque el paciente solicita dispensación o porque este solicita al médico un cambio en la receta.
*  Mediante la operación *GET* el sistema correspondiente, consulta al EndPoint del **Repositorio Central** por la receta mediante el uso del parámetro *groupIdentifier*.
*  El sistema de **Repositorio Central** devuelve al sistema solicitante el recurso **RequestGroup** que hace de contenedor de las prescripciones generadas en formato de recurso **MedicationRequest**.

* **Actualización de las Prescripciones**

*  El sistema correspondiente lee del recurso **RequestGroup** cada uno de los recursos **MedicationRequest** contenidos en él.
*  Para cada prescripción en la cual se realiza un *cambio de estado o actualización*, el sistema modifica los parámetros de su recurso **MedicationRequest** correspondiente

* **Actualización de las dispensaciones**

* El sistema de dispensación lee el recurso **MedicationDispense** que se desea modificar.
* Para la dispensación en la cual se realiza un cambio de estado o actualización, el sistema modifica los parámetros del recurso **MedicationDispense**.
* **Actualización del Repositorio Central**
* El sistema **(del Prestador o Punto de Dispensación)** realiza la operación *UPDATE* al EndPoint del **Repositorio Central**, por cada recurso **MedicationRequest** actualizado o modificado o **MedicationDispense** si corresponde
* El Sistema **Repositorio Central** responde a la solicitud indicando la actualización de los recursos o errores en la operación solicitada
* El sistema **Repositorio Central** actualiza los recursos **MedicationRequest** o **MedicationDispense** cuando corresponda, generando una nueva versión de estos.

<br><br>
<br>
<br>
<br>

<div align="center">
  <img src="DS_Cambio.png"> 
  <p>Diagrama de Secuencias para Cambios en Prescripciones</p>
</div>








