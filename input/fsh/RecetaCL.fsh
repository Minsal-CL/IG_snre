Profile:        MedicamentoRecetaCL
Parent:         RequestGroup
Id:             RecetaCl
Title:          "Receta_CL"
Description:    "Este Perfil usa este recurso como un contenedor de Prescripciones para poder ser usadas como formato de Receta electrónica con los farmacos indicados por el clínico durante un acto médico."



//Identificador de Grupo
* groupIdentifier MS
* groupIdentifier 1..1
* groupIdentifier ^short = "Número identificador de grupo que debe ser el mismo con el cual se identificaron los farmacos prescritos en el acto clínico"
* groupIdentifier ^definition = "dEste numero vincula el contenedor con todos los farmacos prescritos durante la atención del paciente. Este hará el uso de Receta y el grupo de farmacos co misma identificacion grupal. El formato debe ser xxxxxxxx"
* groupIdentifier.value ^short = "identificador de grupo"

* status and intent MS
* status ^short = "	draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* status ^definition = "Dado que la receta siempre sera creada completa y enviada al repositorio Central entonces el estado se debe forzar a completed"
* status = #completed
* status ^comment = "Debe ser siempre completed"

* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
* intent ^definition = "Dado que la receta siempre sera creada para receta y enviada al repositorio Central entonces el estado se debe forzar a order"
* intent = #order
* intent ^comment = "Debe ser siempre order"


//subject
* subject MS
* subject 1..1
* subject ^short = "Informacion acerca del paciente al cual se le ha indicado la receta"
* subject.reference ^short = "Referencia al recurso del paciente al cual se le arma la receta"


//creación
* authoredOn MS
* authoredOn 1..1
* authoredOn ^short = "Fecha y hora cuando el medicamento fue dispensado. Formato YYYY-MM-DDThh:mm:ss+zz:zz, ej: 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z"
* authoredOn ^short = "Fecha y hora cuando el medicamento fue dispensado. Se debe especificar en formato de fecha según HL7. YYYY-MM-DDThh:mm:ss+zz:zz, ej. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z."
* authoredOn ^comment = "No soporta formato 24 hrs"

Instance : EjemploRecetaCL
Title : "Ejemplo de Recurso de una receta completa"
InstanceOf : MedicamentoRecetaCL

* contained[0] = medicationrequest-1
* contained[+] = medicationrequest-2


* groupIdentifier.value = "00001"

* status = #completed
* intent = #order


* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"

* authoredOn = "2021-06-12T17:31:00Z"




Instance: medicationrequest-1
InstanceOf: MedicationRequest
Usage: #example


* identifier.system = "https://minsal.cl/portalReceta/prescripciones"
* identifier.value = "RNCheque-1234"

* status = #active


* intent = #order

* category.coding.code = #inpatient
//* category.coding.display = "Inpatient"

* groupIdentifier.value = "FARM2122-1206211145-11"

* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Medicamento#1028"

* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"

* authoredOn = "2021-06-12"

* requester.reference = "https://api-receta.minsal.cl/v2/Practitoner/PRestador#923421"
* requester.display = "Cecilia Ampuero"

* note.text = "Al paciente se le indicó lo tome 2 veces al día"

* dosageInstruction.text = "Una tableta cada 12 hrs por 5 días"
* dosageInstruction.patientInstruction = "Una tableta al desayuno y otro a la cena"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 12

* dosageInstruction.timing.repeat.periodUnit = #h

* dosageInstruction.route.coding.code = #421521009
* dosageInstruction.route.coding.display = "tragarlo, instrucciones de dosage imperativas (qualifier value)"

* dosageInstruction.doseAndRate.doseRange.low.value = 1
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"



* dispenseRequest.validityPeriod.start = "2021-06-12"
* dispenseRequest.validityPeriod.start = "2022-01-12"
* dispenseRequest.quantity.value = 10
* dispenseRequest.expectedSupplyDuration.value = 5
* dispenseRequest.expectedSupplyDuration.unit = "días"
* dispenseRequest.expectedSupplyDuration.code = #d




Instance: medicationrequest-2
InstanceOf: MedicationRequest
Usage: #example

* identifier.system = "https://minsal.cl/portalReceta/prescripciones"
* identifier.value = "RNCheque-1234"

* status = #active


* intent = #order

* category.coding.code = #inpatient
//* category.coding.display = "Inpatient"

* groupIdentifier.value = "FARM2122-1206211145-11"

* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Medicamento#1028"

* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"

* authoredOn = "2021-06-12"

* requester.reference = "https://api-receta.minsal.cl/v2/Practitioner/PRestador#923421"
* requester.display = "Cecilia Ampuero"

* note.text = "Al paciente se le indicó lo tome 2 veces al día"

* dosageInstruction.text = "Una tableta cada 12 hrs por 5 días"
* dosageInstruction.patientInstruction = "Una tableta al desayuno y otro a la cena"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 12

* dosageInstruction.timing.repeat.periodUnit = #h

* dosageInstruction.route.coding.code = #421521009
* dosageInstruction.route.coding.display = "tragarlo, instrucciones de dosage imperativas (qualifier value)"

* dosageInstruction.doseAndRate.doseRange.low.value = 1
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"



* dispenseRequest.validityPeriod.start = "2021-06-12"
* dispenseRequest.validityPeriod.start = "2022-01-12"
* dispenseRequest.quantity.value = 10
* dispenseRequest.expectedSupplyDuration.value = 5
* dispenseRequest.expectedSupplyDuration.unit = "días"
* dispenseRequest.expectedSupplyDuration.code = #d

