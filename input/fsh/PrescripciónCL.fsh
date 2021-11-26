Profile:        PrescripcionRecetaCL
Parent:         MedicationRequest
Id:             RecetaPrescripcionCl
Title:          "Prescripción_CL"
Description:    "Este Perfil describe la información contenida en la Prescripción de un medicamento para la Receta Electrónica Nacional del MINSAL"



* identifier MS

* identifier 0..2 
* identifier ^short = "Pueden ser 3 tipos de identificación de Receta: Id_Local| Id_Cheque| Id_Receta_Grafica"
* identifier ^definition = "La identificación local puede ser dada localmente, puede ser la de la Receta Cheque o la identificación dada al ser escaneada una receta a papel. En cualquir caso no pueden ir aparejadas una identificación de receta cheque con una de receta gráfica"
* identifier.type ^short = "Tipo de identificación segun tabla"
* identifier.type ^definition = "Tipo de identificación segun tabla que debe ser levantada localmene en la cual se consideran 3 códigos: Local|Cheque|Grafica" 
* identifier.type.coding.system ^short = "URL en la cual se levanta localmente la tabla con los 3 identificadores Id Local| Id_Cheque| Id Receta Gráfica " 
* identifier.type.coding.system ^definition = "Esta ruta no será usada aún"
* identifier.type.coding.system ^comment = "Dado que los códigos Id_Local| Id_Cheque | Id_Receta_Grafica" 
* identifier.type.coding.code ^short = "Valor del código que debe ser uno de los 3 Id Local| Id_Cheque| Id Receta Grafica, será normativo, se contempla en este primera etapa no levantar un EndPoint para validar esos códigos a modo de simplificar las implementaciones, por lo que la ruta *identification.type.system* no debiera ser considerada"
* identifier.type.coding.display ^short = "Téxto del código"
* identifier.system ^short = "Se identificará la url de la API sobre la cual se puede consultar por el valor del identificador generado"
* identifier.system ^definition = "URL sobre la cual se determina el formato y procedencia del valor del identificador"
* identifier.value ^short = "Numero identificador"
* identifier.assigner.display ^short = "Organización en texto libre que dio el numero identificador."
* identifier.assigner.display ^definition =	"Organización en texto libre que dio el numero identificador. DEBE ser informado en caso que la identificación sea de tipo Local"

* status and intent MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown código del estado de la receta del medicamento prescrito  (requerido)"
* intent ^short = "	proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option Intención para la cual es requerido el medicamento (requerido). Se Forzará siempre a order"
* intent = #order

* statusReason MS
* statusReason ^short = "Este dato es Obligatorio condicional a que haya un cambio de estado de la Receta (R2)... es la razón por la cual se cambia el estado de la receta"
* statusReason.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-status-reason"
* statusReason.coding.system ^short = "Sistema de códigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-status-reason "
* statusReason.coding.code ^short = "Código relacionado al estado"
* statusReason.coding.display ^short = "Descripción del estado"

//Identificador de Grupo
* groupIdentifier MS
* groupIdentifier 1..1
* groupIdentifier ^short = "Número identificador de grupo que debe ser el mismo con el cual se identificaron los farmacos prescritos en el acto clínico. Se genera como un NanoId"
* groupIdentifier ^definition = "Este numero vincula el contenedor (RequestGroup) con todos los farmacos prescritos durante la atención del paciente (medicationRequest). Este hará el uso de Receta y el grupo de farmacos co misma identificacion grupal. El formato debe ser NanoId"
* groupIdentifier ^comment = "El elemento groupIdentifier de los recursos MedicationRequest generados durante el mismo acto clínico deberán coincidir con el que se genere en el recurso RequestGroup. Este identificador debe ser generado como un valor NanoId"
* groupIdentifier.value ^short = "Identificador de grupo"

* category MS
* category ^short = "Tipo de Acto clínico en el cual se realiza la Prescripción. ´http://terminology.hl7.org/CodeSystem/medicationrequest-category´ (extensible) "
* category ^definition = "Se reconoce según la tabla de Hl7 cual es el tipo de acto clínico en el cual se desarrolla la prescripciones"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.system ^short = "Sistema de códigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-category"
* category.coding.system ^definition = "Sistema de códigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-category. Esto esta forzado"
* category.coding.code ^short = "Código relacionado"
* category.coding.display ^short = "Glosa del código"
* category.coding.display ^definition = "Glosa del código según su definición de la tabla de HL7"


* medicationReference and medicationReference.reference MS
* medicationReference 1..1
* medicationReference ^short = "Referecia al medicamento que se dispensa por medio del acceso al recurso generado desde la TFC"
* medicationReference ^definition = "Referecia al medicamento que se dispensa por medio del acceso al recurso generado desde la TFC. Se especifica la API a la cual se debe acceder"
* medicationReference.reference ^short = "uri del recurso. Para el caso el repositorio se encuentra en ´https://api-receta.minsal.cl/v2/medication´"
* medicationReference.display ^short = "Descripción del fármaco"

* extension contains  Prod-Comercial named PComercial 0..1
* extension ^short = "Determinación del medicamento en Producto Comercial"
* extension ^definition = "Determinación de un medicamento en Producto Comercial. Para eso esta extensión define una Referecia solo a un recurso de medication. "

* subject and subject.reference MS
* subject ^short = "Referencia a un sujeto|organización para nuestro caso sera un sujeto"
* subject ^definition = "La referencia en este caso solo se hace sobre el paciente al cual se le receta el fármaco independiente que sea otra la persona que hace retiro de estos"
* subject.reference ^short = "La API sobre la cual se hace consulta de los recursos de los pacientes es ´http://api-receta.minsal.cl/v2/patient´" 
* subject.display ^short = "Nombre paciente"

* authoredOn MS
* authoredOn ^short = "Fecha y hora en la cual fue solicitado el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz"
* authoredOn ^definition = "Fecha y hora en la cual fue solicitado el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz, e.j. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 o 2017-01-01T00:00:00.000Z"

* requester and requester.reference MS
* requester 1..1	
* requester ^short = "Referencia a un sujeto que prescribe"
* requester ^definition = "En este caso la referencia será sobre una persona que es un prescriptor validado por la Super Intendecia"
* requester ^comment = "En una posterior versión evolutiva de la guía y el sistema de receta se deberá referenciar un ParactitionerRole"

* requester.reference ^short = "EndPoint sobre la cual se hace consulta de los recursos de los prescriptores es ´https://api-receta.minsal.cl/v2/practitioner´" 
* requester.display ^short = "Nombre Prescriptor"

* recorder and recorder.reference MS
* recorder 0..1
* recorder ^short = "Referencia a un sujeto|organización para nuestro caso sera un sujeto, que será el que registra la receta"
* recorder ^definition = "En este caso la referencia será sobre una persona que es un prescriptor validado por la Super Intendecia"
* recorder.reference ^short = "La API sobre la cual se hace consulta de los recursos de los pacientes es ´http://api-receta.minsal.cl/v2/practitioner´"
* recorder.display ^short = "Nombre Prescriptor"



* courseOfTherapyType MS
* courseOfTherapyType ^short = "Expresa el patrón en la administración del medicamento"
* courseOfTherapyType ^definition = "La descripción del patrón general de la administración del medicamento al paciente."
* courseOfTherapyType.coding.system = "https://www.hl7.org/fhir/valueset-medicationrequest-course-of-therapy.html"
* courseOfTherapyType.coding.system ^short = "Sistema de códigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-course-of-therapy "
* courseOfTherapyType.coding.code ^short = "Código relacionado continuous|acute|seasonal (Continuo, agudo o por temporada)"
* courseOfTherapyType.coding.display ^short = "Descripción del código"

* note MS
* note ^short = "Texto libre en donde se expresan las instrucciones de como el medicamento debe ser administrado"
* note ^definition = "Información adicional sobre la prescripción que no puede ser transmitida por los otros atributos."

* dosageInstruction and dosageInstruction.timing and dosageInstruction.route and dosageInstruction.doseAndRate  MS
* dosageInstruction 1..1
* dosageInstruction ^short = "Instrucciones del dosaje del medicamento"
* dosageInstruction ^definition = "Indica cómo debe utilizar el paciente el medicamento."
* dosageInstruction.text ^short = "Instucciones en texto libre"
* dosageInstruction.patientInstruction ^short = "Instrucciones adicionales orientadas al paciente"

* dosageInstruction.timing.repeat ^short = "Repetitividad en la administración del medicamento"
* dosageInstruction.timing.repeat.frequency ^short = "Cantidad de repeticiones"
* dosageInstruction.timing.repeat.period ^short = "Período en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.periodMax ^short = "Periodo máximo en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.periodUnit ^short = "s | min | h | d | wk | mo | a - unidad de tiempo (UCUM) (Requerida)"
* dosageInstruction.timing.repeat.frequency ^definition = "El número de veces que se debe repetir la acción dentro del periodo especificado. Si frequencyMax está presente, este elemento indica el límite inferior del rango permitido de la frecuencia."
* dosageInstruction.timing.repeat.period ^definition = "Indica la duración del tiempo durante el cual deben producirse las repeticiones; por ejemplo, para expresar ´3 veces al día´, 3 sería la frecuencia y ´1 día´ sería el periodo. Si periodMax está presente, este elemento indica el límite inferior del rango permitido de la longitud del periodo."
* dosageInstruction.timing.repeat.periodMax ^definition = "Periodo máximo en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.periodUnit ^definition = "s | min | h | d | wk | mo | a - unidad de tiempo (UCUM) (Requerida)"

* dosageInstruction.asNeededBoolean ^short = "Se define para uso de fármaco sin receta o indicación en esta."
* dosageInstruction.asNeededBoolean ^definition = "Para indicar si el fármaco se puede usar sin respetar diretamente lo presctito en el dosaje, como por ejemplo medicamentos que se pueden usar en caso de SOS"
	

* dosageInstruction.route ^short = "via por la cual es administrado el medicamento"
* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.system ^short = "Sistema basado en subset de Snomed CT"
* dosageInstruction.route.coding.code ^short = "Código de la via de Snomed" 
* dosageInstruction.route.coding.display ^short = "Descripción del código"
* dosageInstruction.route ^definition = "Vía por la cual es administrado el medicamento"
* dosageInstruction.route.coding.system ^definition = "Sistema basado en subset de Snomed CT"
* dosageInstruction.route.coding.code ^definition = "Código de la via de Snomed" 
* dosageInstruction.route.coding.display ^definition = "Descripción del código"

* dosageInstruction.method MS
* dosageInstruction.method ^short = "Forma exacta en el fármaco ingresa al organismo"
* dosageInstruction.method ^definition = "Forma exacta en el fármaco ingresa al organismo. En este caso se define la ruta plausible para vías de administración"
* dosageInstruction.method.coding.system = "http://snomed.info/sct"
* dosageInstruction.method.coding.system ^short = "Se usará Snomed Ct para la definición del set de valores"
* dosageInstruction.method.coding.system ^definition = "Se usará Snomed Ct para la definición del set de valores definidos para este caso"
* dosageInstruction.method.coding.code ^short = "Código en Snomed-Ct correspondiente al método"
* dosageInstruction.method.coding.code ^definition = "Código en Snomed-Ct correspondiente al método"
* dosageInstruction.route.coding.code ^short = "Código del metodo indicado"
* dosageInstruction.route.coding.code ^definition = "Código del metodo indicado"

	
* dosageInstruction.doseAndRate ^short = "Cantidad de medicamento administrado puede ser Cantidad o Rango"	
* dosageInstruction.doseAndRate ^definition = "Cantidad de medicamento administrado puede ser Cantidad o Rango, solo se puede usar uno de ellos en el Dosaje"
* dosageInstruction.doseAndRate.doseQuantity.value ^short = "Valor de la cantidad a administrar"
* dosageInstruction.doseAndRate.doseQuantity.unit ^short = "Unidad de la cantidad administrada"
* dosageInstruction.doseAndRate.doseQuantity.value ^definition = "Valor de la cantidad a administrar"
* dosageInstruction.doseAndRate.doseQuantity.unit ^definition = "Unidad de la cantidad administrada"
			
* dosageInstruction.doseAndRate.doseQuantity.system ^short = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseQuantity.system ^definition = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseQuantity.code ^short = "Código para el tipo de forma del fármaco"
* dosageInstruction.doseAndRate.doseQuantity.code ^definition = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
		
* dosageInstruction.doseAndRate.doseRange.low.value ^short = "Valor mínimo del rango"
* dosageInstruction.doseAndRate.doseRange.low.unit ^short = "Unidad de la cantidad administrada"
			
* dosageInstruction.doseAndRate.doseRange.low.system ^short = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseRange.low.code ^short = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
		
* dosageInstruction.doseAndRate.doseRange.high.value ^short = "Valor mínimo del rango"
* dosageInstruction.doseAndRate.doseRange.high.unit ^short = "Unidad de la cantidad administrada"
			
* dosageInstruction.doseAndRate.doseRange.high.system ^short = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseRange.high.code ^short = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
		    
* dosageInstruction.doseAndRate.doseRange.low.value ^definition = "Valor mínimo del rango"
* dosageInstruction.doseAndRate.doseRange.low.unit ^definition = "Unidad de la cantidad administrada"
			
* dosageInstruction.doseAndRate.doseRange.low.system ^definition = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseRange.low.code ^definition = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
		
* dosageInstruction.doseAndRate.doseRange.high.value ^definition = "Valor mínimo del rango"
* dosageInstruction.doseAndRate.doseRange.high.unit ^definition = "Unidad de la cantidad administrada"
			
* dosageInstruction.doseAndRate.doseRange.high.system ^definition = "Se definirá mas adelante "
* dosageInstruction.doseAndRate.doseRange.high.code ^definition = "Código para el tipo de forma del fármaco, este en principio no será validado estará dado en la Norma Técnica"
		
		
		
		
* dispenseRequest and dispenseRequest.validityPeriod and dispenseRequest.quantity and dispenseRequest.expectedSupplyDuration and dispenseRequest.performer MS				
* dispenseRequest 1..1
* dispenseRequest ^short = "Autorización de la dispensación"
* dispenseRequest.validityPeriod 1..1
* dispenseRequest.validityPeriod ^short = "Periodo de validez de la Prescripción"
* dispenseRequest.validityPeriod ^definition = "Periodo de validez de la Prescripción"
* dispenseRequest.validityPeriod.start ^short = "Fecha de inicio de la validez de la prescripción. El formato es YYYY-MM-DD"
* dispenseRequest.validityPeriod.end ^short = "Fecha de fin de la validez de la prescripción. El formato es YYYY-MM-DD"
* dispenseRequest.validityPeriod.start ^definition = "Fecha de inicio de la validez de la prescripción. El formato es YYYY-MM-DD"
* dispenseRequest.validityPeriod.end ^definition = "Fecha de fin de la validez de la prescripción. El formato es YYYY-MM-DD"
	
* dispenseRequest.quantity ^short = "Cantidad de medicamento Dispensado"
* dispenseRequest.quantity.value ^short = "Valor de la cantida del medicamento Dispensado. Obligatorio para fármaco Con	trolado"
* dispenseRequest.quantity.value ^definition = "Valor de la cantida del medicamento Dispensado. Obligatorio para fármaco Controlado"
* dispenseRequest.quantity.value ^comment = "Obligatorio para fármaco Controlado"

* dispenseRequest.expectedSupplyDuration ^short = "Número de días que dura lo que se ha dispensado" 
* dispenseRequest.expectedSupplyDuration.value ^short = "Valor de la unidad de duracion" 
* dispenseRequest.expectedSupplyDuration.unit ^short = "Unidad temporal segun UCUM"
* dispenseRequest.expectedSupplyDuration.value ^definition = "Valor de la unidad de duracion" 
* dispenseRequest.expectedSupplyDuration.unit ^definition = "Unidad temporal segun UCUM"
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.system ^short = "Sistema de códigos temprales segun UCUM"
* dispenseRequest.expectedSupplyDuration.code ^short = "Código segun UCUM"
* dispenseRequest.expectedSupplyDuration.system ^definition = "Sistema de códigos temprales segun UCUM"
* dispenseRequest.expectedSupplyDuration.code ^definition = "Código segun UCUM"
	
* dispenseRequest.performer ^short = "A quien se intenciona sea el que dispense. Obligatorio en Sector Público"
* dispenseRequest.performer ^definition = "Se debe referenciar a la API de minsal´https://api-receta.minsal.cl/v2/practitioner´. Obligatorio si es prescriptor público"
* dispenseRequest.performer ^comment = "Obligatorio si es prescriptor público"
* dispenseRequest.performer.reference ^short = "Recurso referenciado. "

* priorPrescription MS		
* priorPrescription ^short = "Prescripciónu orden a la cual esta reemplaza"
* priorPrescription ^definition = "Prescripciónu orden a la cual esta reemplaza"
* priorPrescription.reference ^short = "Recurso MedicationDispense que se reemplaza. "

		



 

Instance : PrescripcionRecetaCL
Title : "Ejemplo Prescripción de Medicamento Oxycodone Via Oral, una o dos tabletas al día cada 4 o 6 horas, para una solicitud segun necesidad con pre-condiciones"
InstanceOf : RecetaPrescripcionCl	
Usage: #example

* identifier.system = "https://minsal.cl/portalReceta/prescripciones"
* identifier.value = "RNCheque-1232"

* status = #active
//* statusReason.coding.code = #altchoice
//* statusReason.coding.display = "Probar otra alternativa primero"

* intent = #order

* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #outpatient
//* category.coding.display = "Inpatient"

* groupIdentifier.value = "tv829fxi21tqloo5fl2n"

* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Medicamento#1345"
* medicationReference.display = "Oxycodone"

//* extension.url = "PComercial"
* extension[Prod_Comercial].valueReference.reference = "https://api-receta.minsal.cl/v2/medication/med#1257"
* extension[Prod_Comercial].valueReference.display = "Oxycontin MR"

* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"

* authoredOn = "2021-06-12"

* requester.reference = "https://api-receta.minsal.cl/v2/Practitioner/PRestador#923421"
* requester.display = "Cecilia Ampuero"

* note.text = "Al paciente se le indicó que lo administrara durante comidas"

* dosageInstruction.text = "Una o dos tabletas cada 4 a 6 horas segun necesidad en base a la intensidad del dolor renal"
* dosageInstruction.patientInstruction = "Una o dos tabletas cada 4 a 6 horas segun necesidad en base a la intensidad del dolor renal"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.frequencyMax = 2
* dosageInstruction.timing.repeat.period = 4
* dosageInstruction.timing.repeat.periodMax = 6
* dosageInstruction.timing.repeat.periodUnit = #h

* dosageInstruction.route.coding.code = #421521009
* dosageInstruction.route.coding.display = "Tragarlo, instrucciones de dosage imperativas (qualifier value)"

* dosageInstruction.doseAndRate.doseRange.low.value = 1
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"

* dosageInstruction.doseAndRate.doseRange.low.value = 2
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"

* dispenseRequest.validityPeriod.start = "2021-06-12"
* dispenseRequest.validityPeriod.start = "2022-01-12"
* dispenseRequest.quantity.value = 30

* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.value = 10
* dispenseRequest.expectedSupplyDuration.unit = "Day"
* dispenseRequest.expectedSupplyDuration.code = #d


Alias: $sct = http://snomed.info/sct

Instance: PrescripcionRecetaCL-2
Title: "Ejemplo de Prescripción de Hidroclorotizida + Valsartán, Prescrito dos veces al día Vía Oral, tragándoselo"
InstanceOf: RecetaPrescripcionCl
Usage: #example

* identifier.type.coding.code = #Id_Local
* identifier.type.coding.display = "Identificación Local"
* identifier.system = "https://sistema_de_dispensacion_local/prescripciones"
* identifier.value = "10101010"
* identifier.assigner.display = "CESFAM COQUIMBO"

* status = #active
* intent = #order
* category.coding.code = #outpatient
* medicationReference = Reference(https://api-receta.minsal.cl/v2/Medication/1703591000167111) "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
* subject = Reference(https://api-receta.minsal.cl/v2/Patient/3254156114) "FELIPE MAURICIO MANCINI RUIZ-TAGLE"
* requester = Reference(https://api-receta.minsal.cl/v2/Practitioner/3253825513) "JUAN JOSÉ ORTEGA CALLEJAS"
* authoredOn = "2021-08-15T17:31:00Z"
* groupIdentifier.value = "64e51a53-97d3-44dc-bbfe-1c8697697763"
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = $sct#26643006 "Vía Oral"
* dosageInstruction.method = $sct#738995006 "Tragar (método de administración)"


* dosageInstruction.doseAndRate.doseQuantity.unit = "Comprimido"
* dosageInstruction.doseAndRate.doseQuantity.value = 2



* dispenseRequest.validityPeriod.start = "2021-08-15"
* dispenseRequest.validityPeriod.end = "2022-08-15"
