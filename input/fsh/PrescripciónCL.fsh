Profile:        PrescripcionRecetaCL
Parent:         MedicationRequest
Id:             RecetaPrescripcionCl
Title:          "Prescripción_CL"
Description:    "ESte Perfil describe la información contenida en la prescripción de un medicamento para la Receta Electrónica Nacional del MINSAL"



* identifier MS

* identifier 0..2 
* identifier ^short = "Pueden ser 3 tipos de identificación de Receta: Id Local| Id_Cheque| Id Receta Gráfica"
* identifier ^definition = "La identificación local puede ser dada localmente, puede ser la de la Receta Cheque o la identificación dada al ser escaneada una receta a papel. En cualquir caso no pueden ir aparejadas una identificación de receta cheque con una de receta gráfica"
* identifier.type ^short = "tipo de identificación segun tabla"
* identifier.type ^definition = "Tipo de identificación segun tabla que debe ser levantada localmene en la cual se consideran 3 códigos: Local|Cheque|Grafica" 
* identifier.system ^short = "Se identificará la url de la API sobre la cual se puede consultar por el valor del identificador generado"
* identifier.system ^definition = "URL sobre la cual se determina el formato y procedencia del valor del identificador"
* identifier.value ^short = "número identificador"
* identifier.assigner.display ^short = "Organización en texto libre que dio el numero identificador."
* identifier.assigner.display ^definition =	"Organización en texto libre que dio el numero identificador. DEBE ser informado en caso que la identificación sea de tipo Local"

* status and intent MS
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown código del estado de la receta del medicamento prescrito  (requerido)"
* intent ^short = "	proposal | plan | order | original-order | reflex-order | filler-order | instance-order | option Intención para la cual es requerido el medicamento (requerido). Se Forzará siempre a order"
* intent = #order

* statusReason MS
* statusReason ^short = "Este dato es Obligatorio condicional a que haya un cambio de estado de la Receta (R2)... es la razon por la cual se cambia el estado de la receta"
* statusReason.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-status-reason"
* statusReason.coding.system ^short = "Sistema de codigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-status-reason "
* statusReason.coding.code ^short = "codigo relacionado al estado"
* statusReason.coding.display ^short = "descripción del estado"

//Identificador de GRupo
* groupIdentifier MS
* groupIdentifier 1..1
* groupIdentifier ^short = "Número identificador de grupo que debe ser el mismo con el cual se identificaron los farmacos prescritos en el acto clínico"
* groupIdentifier ^definition = "Este numero vincula el contenedor (RequestGroup) con todos los farmacos prescritos durante la atención del paciente (medicationRequest). Este hará el uso de Receta y el grupo de farmacos co misma identificacion grupal. El formato debe ser UUID"
* groupIdentifier ^comment = "El elemento groupIdentifier de los recursos MedicationRequest generados durante el mismo acto clínico deberán coincidir con el que se genere en el recurso RequestGroup. ESte identificador debe ser generado como un valor UUID"
* groupIdentifier.value ^short = "identificador de grupo"

* category MS
* category ^short = "Tipo de Acto clínico en el cual se realiza la Prescripción. ´http://terminology.hl7.org/CodeSystem/medicationrequest-category´ (extensible) "
* category ^definition = "Se reconoce según la tabla de Hl7 cual es el tipo de acto clínico en el cual se desarrolla la prescripciones"
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.system ^short = "Sistema de codigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-category"
* category.coding.system ^definition = "Sistema de codigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-category. Esto esta forzado"
* category.coding.code ^short = "codigo relacionado"
* category.coding.display ^short = "Glosa del código"
* category.coding.display ^definition = "Glosa del código según su definición de la tabla de HL7"


* medicationReference and medicationReference.reference MS
* medicationReference 1..1
* medicationReference ^short = "Referecia al medicamento que se dispensa por medio del acceso al recurso generado desde la TFC"
* medicationReference ^definition = "Referecia al medicamento que se dispensa por medio del acceso al recurso generado desde la TFC. Se especifica la API a la cual se debe acceder"
* medicationReference.reference ^short = "url del recurso. Para el caso el repositorio se encuentra en ´https://api-receta.minsal.cl/v2/medication´"
* medicationReference.display ^short = "descripción del fármaco"

* extension contains  Prod-Comercial named PComercial 0..1
* extension ^short = "Determinación del medicamento en Producto Comercial"
* extension ^definition = "Determinación de un medicamento en Producto Comercial. Para eso esta extnsión define una Referecia solo a un recurso de medication. "

* subject and subject.reference MS
* subject ^short = "Referencia a un sujeto|organización para nuestro caso sera un sujeto"
* subject ^definition = "La referencia en este caso solo se hace sobre el paciente al cual se le receta el fármaco independiente que sea otra la persona que hace retiro de estos"
* subject.reference ^short = "La API sobre la cual se hace consulta de los recursos de los pacientes es ´http://api-receta.minsal.cl/v2/patient´" 
* subject.display ^short = "nombre paciente"

* authoredOn MS
* authoredOn ^short = "Fecha y hora en la cual fue solicitado el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz"
* authoredOn ^definition = "Fecha y hora en la cual fue solicitado el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz, e.j. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 o 2017-01-01T00:00:00.000Z"

* requester and requester.reference MS
* requester 1..1	
* requester ^short = "referencia a un sujeto que prescribe"
* requester ^definition = "En este caso la referencia será sobre una persona que es un prescriptor validado por la Super Intendecia"
* requester ^comment = "en una posterior versiín evolutiva de la guía y el sistema de receta se deberá referenciar un ParactitionerRole"

* requester.reference ^short = "La API sobre la cual se hace consulta de los recursos de los prescriptores es ´https://api-receta.minsal.cl/v2/practitioner´" 
* requester.display ^short = "nombre Prescriptor"

* recorder and recorder.reference MS
* recorder 0..1
* recorder ^short = "referencia a un sujeto|organización para nuestro caso sera un sujeto, que será el que registra la receta"
* recorder ^definition = "En este caso la referencia será sobre una persona que es un prescriptor validado por la Super Intendecia"
* recorder.reference ^short = "La API sobre la cual se hace consulta de los recursos de los pacientes es ´http://api-receta.minsal.cl/v2/practitioner´"
* recorder.display ^short = "Nombre Prescriptor"



* courseOfTherapyType MS
* courseOfTherapyType ^short = "Expresa el patrón en la administración del medicamento"
* courseOfTherapyType ^definition = "La descripción del patrón general de la administración del medicamento al paciente."
* courseOfTherapyType.coding.system = "https://www.hl7.org/fhir/valueset-medicationrequest-course-of-therapy.html"
* courseOfTherapyType.coding.system ^short = "Sistema de codigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-course-of-therapy "
* courseOfTherapyType.coding.code ^short = "código relacionado continuo|agudo|temporada"
* courseOfTherapyType.coding.display ^short = "descripción del código"

* note MS
* note ^short = "texto libre en donde se expresan las instrucciones de como el medicamento debe ser administrado"
* note ^definition = "Información adicional sobre la prescripción que no puede ser transmitida por los otros atributos."

* dosageInstruction and dosageInstruction.timing and dosageInstruction.route and dosageInstruction.doseAndRate  MS
* dosageInstruction 1..1
* dosageInstruction ^short = "instrucciones del dosaje del medicamento"
* dosageInstruction ^definition = "Indica cómo debe utilizar el paciente el medicamento."
	* dosageInstruction.text ^short = "instucciones en texto libre"
	* dosageInstruction.patientInstruction ^short = "instrucciones adicionales orientadas al paciente"

	* dosageInstruction.timing.repeat ^short = "repetitividad en la administración del medicamento"
		* dosageInstruction.timing.repeat.frequency ^short = "cantidad de repeticiones"
		* dosageInstruction.timing.repeat.period ^short = "perido en el cual se realizan las repeticiones"
		* dosageInstruction.timing.repeat.periodMax ^short = "perido máximo en el cual se realizan las repeticiones"
		* dosageInstruction.timing.repeat.periodUnit ^short = "s | min | h | d | wk | mo | a - unidad de tiempo (UCUM) (Requerida)"
	
	* dosageInstruction.asNeededBoolean ^short = "En caso de SOS, se usa, considerar este valor como booleano"
	
	* dosageInstruction.route ^short = "via por la cual es administrado el medicamento"
		* dosageInstruction.route.coding.system = "http://hl7.org/fhir/ValueSet/route-codes"
		* dosageInstruction.route.coding.system ^short = "Sistema basado en subset de Snomed CT"
		* dosageInstruction.route.coding.code ^short = "codigo de la via de Snomed" 
		* dosageInstruction.route.coding.display ^short = "descripcióncipón del código"

	* dosageInstruction.doseAndRate ^short = "cantidad de medicamento administrado puede ser Cantidad o Rango"
		
			* dosageInstruction.doseAndRate.doseQuantity.value ^short = "valor de la cantidad a administrar"
			* dosageInstruction.doseAndRate.doseQuantity.unit ^short = "unidad de la cantidad administrada"
			* dosageInstruction.doseAndRate.doseQuantity.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
			* dosageInstruction.doseAndRate.doseQuantity.system ^short = "se usa el sistema de códigos de V3 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm "
			* dosageInstruction.doseAndRate.doseQuantity.code ^short = "codigo para la unidad"
		
			* dosageInstruction.doseAndRate.doseRange.low.value ^short = "valor mínmo del rango"
			* dosageInstruction.doseAndRate.doseRange.low.unit ^short = "unidad de la cantidad administrada"
			* dosageInstruction.doseAndRate.doseRange.low.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
			* dosageInstruction.doseAndRate.doseRange.low.system ^short = "se usa el sistema de códigos de V3 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm "
			* dosageInstruction.doseAndRate.doseRange.low.code ^short = "codigo para la unidad"

			* dosageInstruction.doseAndRate.doseRange.high.value ^short = "valor máximo del rango"
			* dosageInstruction.doseAndRate.doseRange.high.unit ^short = "unidad de la cantidad administrada"
			* dosageInstruction.doseAndRate.doseRange.high.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
			* dosageInstruction.doseAndRate.doseRange.high.system ^short = "se usa el sistema de códigos de V3 http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm "
			* dosageInstruction.doseAndRate.doseRange.high.code ^short = "codigo para la unidad"
		
		
* dispenseRequest and dispenseRequest.validityPeriod and dispenseRequest.quantity and dispenseRequest.expectedSupplyDuration and dispenseRequest.performer MS				
* dispenseRequest 1..1
* dispenseRequest ^short = "Autorización de la dispensación"
    * dispenseRequest.validityPeriod 1..1
	* dispenseRequest.validityPeriod ^short = "periodo de validez de la Prescripción"
		* dispenseRequest.validityPeriod.start ^short = "fecha de inicio de la validez de la prescripción. El formato es YYYY-MM-DD"
		* dispenseRequest.validityPeriod.end ^short = "fecha de fin de la validez de la prescripción. El formato es YYYY-MM-DD"
	
	* dispenseRequest.quantity ^short = "Cantidad de medicamento Dispensado"
		* dispenseRequest.quantity.value ^short = "Valor de la cantida del medicamento Dispensado. Obligatorio para fármaco Cotrolado"
		* dispenseRequest.quantity.value ^definition = "Valor de la cantida del medicamento Dispensado. Obligatorio para fármaco Cotrolado"
		* dispenseRequest.quantity.value ^comment = "Obligatorio para fármaco Cotrolado"

	* dispenseRequest.expectedSupplyDuration ^short = "numero de días que dura lo que se ha dispensado" 
		* dispenseRequest.expectedSupplyDuration.value ^short = "valor de la unidad de duracion" 
		* dispenseRequest.expectedSupplyDuration.unit ^short = "unidad temporal segun UCUM"
		* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
		* dispenseRequest.expectedSupplyDuration.system ^short = "sistema de codigos temprales segun UCUM"
		* dispenseRequest.expectedSupplyDuration.code ^short = "Código segun UCUM"
	
	* dispenseRequest.performer ^short = "A quien se intenciona sea el que dispense. Obligatorio en Sector Público"
	* dispenseRequest.performer ^definition = "Se debe referenciar a la API de minsal´https://api-receta.minsal.cl/v2/practitioner´. Obligatorio si es prescriptor público"
	* dispenseRequest.performer ^comment = "Obligatorio si es prescriptor público"
		* dispenseRequest.performer.reference ^short = "Recurso referenciado. "

* priorPrescription MS		
* priorPrescription ^short = "prescripciónu orden a la cual esta reemplaza"
	* priorPrescription.reference ^short = "recurso MedicationDispense que se reemplaza. "

		



 

Instance : PrescripcionRecetaCL
Title : "Ejemplo Prescripción de Medicamento Oxycodone Via Oral, para una solicitud segun necesidad con pre-condiciones"
InstanceOf : RecetaPrescripcionCl	

* identifier.system = "https://minsal.cl/portalReceta/prescripciones"
* identifier.value = "RNCheque-1232"

* status = #active
* statusReason.coding.code = #altchoice
* statusReason.coding.display = "probar otra alternativa primero"

* intent = #order

* category.coding.code = #inpatient
//* category.coding.display = "Inpatient"

* groupIdentifier.value = "FARM2122-1206211145-11"

* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Medicamento#1345"
* medicationReference.display = "Oxycodone"

* extension.url = "PComercial"
* extension.valueReference.reference = "https://api-receta.minsal.cl/v2/medication/med#1257"
* extension.valueReference.display = "Oxycontin MR"

* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"

* authoredOn = "2021-06-12"

* requester.reference = "https://api-receta.minsal.cl/v2/Practitioner/PRestador#923421"
* requester.display = "Cecilia Ampuero"

* note.text = "Al paciente se le indicó que lo administrara durante comidas"

* dosageInstruction.text = "Una o dos tabletas cada 4 a 6 horas segun necesidad en base a la intensidad del dolor renal"
* dosageInstruction.patientInstruction = "Una o dos tabletas cada 4 a 6 horas segun necesidad en base a la intensidad del dolor renal"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 4
* dosageInstruction.timing.repeat.periodMax = 6
* dosageInstruction.timing.repeat.periodUnit = #h

* dosageInstruction.route.coding.code = #421521009
* dosageInstruction.route.coding.display = "tragarlo, instrucciones de dosage imperativas (qualifier value)"

* dosageInstruction.doseAndRate.doseRange.low.value = 1
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"

* dosageInstruction.doseAndRate.doseRange.low.value = 2
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"

* dispenseRequest.validityPeriod.start = "2021-06-12"
* dispenseRequest.validityPeriod.start = "2022-01-12"
* dispenseRequest.quantity.value = 30
* dispenseRequest.expectedSupplyDuration.value = 10
* dispenseRequest.expectedSupplyDuration.unit = "días"
* dispenseRequest.expectedSupplyDuration.code = #d

