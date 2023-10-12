### Casos de Uso Proyecto

*JJOC*
En la actualidad, el SNRE se implementa mediante la generación de una Receta por parte del prescriptor, que contiene el detalle de cada medicamento recetado. Este enfoque se logra mediante la definición de un "agrupador de prescripciones" que se utiliza tanto para el caso de prescripción como para el de dispensación. En consecuencia, el Repositorio del MINSAL cuenta con servicios para diferenciar la Receta de las prescripciones individuales. No obstante, en el proceso de dispensación, es el sistema del punto de venta o entrega el encargado de revisar cada prescripción contenida en la Receta

Actualmente el SNRE se ha levantado en base a la generación de una *Receta* desde el prescriptor que contiene el detalle de cada fármaco prescrito. Este concepto se realizará por medio de la definición de un *agrupador* de prescripciones el cual será usado tanto para el caso de uso de prescripción como para el caso de uso de dispensación. Dado lo anterior el sistema de **Repositorio de  MINSAL** tendrá los servicios para poder diferenciar la Receta de las prescripciones individuales, sin embargo, en la dispensación deberá ser el sistema del punto de venta o entrega, aquel que recorra el recurso de receta para revisar cada prescripción contenida en este.

Luego los Casos de Uso descritos serán los siguientes

* Prescripción
* Dispensación
* Actualización Prescripciones


### Caso de Uso 1: Prescripción
Este caso de uso describe la generación de una Receta con una o múltiples Prescripciones generadas durante un acto clínico. La Receta generada se envía al Repositorio de Recetas del MINSAL y queda disponible para el proceso de Dispensación. Este caso de uso presenta la siguiente secuencia:

* Prescriptor Genera Prescripciones por Fármacos
  * El Prescriptor genera cada una de las prescripciones con un único medicamento clínico por recurso **MedicationRequest**. Cada uno de estos recursos generados deben contener un *groupIdentifier* idéntico entre sí, y cuyo valor será el que se genere por medio de un UUID (identificador único universal o universally unique identifier).
  * Al cerrar el ciclo de creación de prescripciones, el sistema del prescriptor debe generar la Receta en el formato de recurso **RequestGroup**. Este recurso también debe replicar el valor del elemento groupIdentifier de los **MedicationRequest** generados. El valor del elemento status del **RequestGroup** debe ser siempre igual a active
* Prescriptor Envía a Repositorio Central la Receta
  * El sistema del Prescriptor genera una operación *POST* del recurso **RequestGroup** al EndPoint de MINSAL para que la receta sea almacenada en el Repositorio Central de Recetas.
  * El Sistema de MINSAL responde al Sistema del Prescriptor con un mensaje de estado de recepción acusando recibo sin error o con errores


<div align="center">
  <img src="DS_Presc.png"> 
  <p>Diagrama de Secuencias para Prescripción</p>
</div>

### Caso de Uso 2: Dispensación

Este caso describe la secuencia de mensajes que ocurre cuando se procede a dispensar o rechazar la dispensación de uno o varios medicamentos de una misma receta. El proceso comienza cuando en el lugar de dispensación se solicita la información de la receta. Esta solicitud puede realizarse de dos maneras: digitando o escaneando el código de barras que contiene el valor del "groupIdentifier". Este último valor se genera tanto en el agrupador como en las prescripciones individuales al momento de crear la receta.

Además, este proceso permite al Dispensador realizar cambios de estado en las prescripciones, indicando si la dispensación se ha realizado, la cantidad dispensada o si la prescripción se bloquea al ser retenida. Estos cambios se notifican a MINSAL mediante el envío del recurso **MedicationDispense**.

Aquí se detalla la secuencia de eventos:

* El Dispensador recibe la solicitud de dispensación.
  * El Dispensador digita el código identificador o lee el código de barras de la receta para poder identificarla.
  * El código de barras identifica el valor de groupIdentifier sobre el cual debe hacer la consulta para recuperar la receta del Repositorio Central

* Dispensador consulta por Receta
  * El sistema del Dispensador realiza la consulta al EndPoint del Repositorio Central por la receta mediante la operación *GET* sobre el recurso **RequestGroup** mediante el parámetro groupIdentifier
  * El Sistema de MINSAL contesta a la solicitud devolviendo el recurso agrupador correspondiente o indicando un error en caso de no encontrar un **RequestGroup** válido por el parámetro consultado
  * El sistema del punto de dispensación recorre el recurso agrupador obteniendo de éste cada una de las Prescripciones representadas en el formato de un recurso **MedicationRequest** contenidas en el agrupador Receta.
  * El Dispensador hace entrega de los fármacos paciente por el solicitante, hace registro de esto, de las modificaciones que se puedan producir entre lo que se dispensó v/s lo recetado y en los eventuales cambios de estado que existan en cada Prescripción recetada.
  * Por cada dispensación que es dispensada, se debe generar un recurso **MedicationDispense**
  * Cada Recurso **MedicationDispense** generado debe ser enviado al Repositorio Central mediante la operación *POST*
  * El sistema del punto de dispensación, actualiza la receta representada en el recurso RequestGroup y mediante la operación *PUT* sobre el EndPoint del Repositorio Central actualiza dicho recurso en caso de ser necesario.
  * El sistema de Repositorio Central responde al sistema del punto de dispensación indicando si el recurso *MedicationDispense* se generó sin errores o se identificaron errores en su generación.

<div align="center">
  <img src="DS_Dispen.png"> 
  <p>Diagrama de Secuencias para Dispensación</p>
</div>
### Caso de Uso 3: Cambio de Estado Prescripciones Recetadas
Este caso nos presenta la capacidad de realizar cambios en una prescripción tanto desde el sistema del Prescriptor como desde el sistema del Dispensador. Estos cambios obedecen a diferentes razones y se manifiestan como una actualización de las Prescripciones generadas durante el acto clínico con el paciente.
Estos cambios se reducen a los siguientes:

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








