Profile:        MedicamentoRecetaCL
Parent:         RequestGroup
Id:             RecetaCl
Title:          "Receta_CL"
Description:    "Este Perfil utiliza este recurso como un contenedor de Prescripciones para poder ser utilizadas como formato de Receta electrónica con los fármacos indicados por el clínico durante un acto médico."

* groupIdentifier MS
  * value MS
* status and intent and subject MS
  * reference and display MS
* authoredOn MS


//Identificador de Grupo
* groupIdentifier 1..1
* groupIdentifier ^short = "Número identificador de grupo que debe ser el mismo con el cual se identificaron los fármacos prescritos en el acto clínico. El identificador debe ser un NanoId"
* groupIdentifier ^definition = "Este número vincula el contenedor con todos los fármacos prescritos durante la atención del paciente. Este hará el uso de Receta y el grupo de fármacos con misma identificación grupal. El formato debe ser el de un NanoId"
* groupIdentifier.value ^short = "Identificador de grupo"

* status ^short = "	draft | active | on-hold | revoked | completed | entered-in-error | unknown"
* status ^definition = "El estado de la receta se describe como activa (aún no ha sido dispensada) o completada (se dispensó). En caso que las prescripciones no se dispensen entonces la receta pasa a estado cancelada"
* status ^comment = "Es válido hacer uso solo de los estados active y completed. En el caso que la receta ha sido recién creada esta se generá con estado **active**. Al momento de dispensar todos las prescripciones, la receta pasa a estado **completed**. Si esta nunca es dispensada se usa el código de **cancelled**"



* intent ^short = "proposal | plan | directive | order | original-order | reflex-order | filler-order | instance-order | option"
* intent ^definition = "Dado que la receta siempre sera creada para receta y enviada al repositorio Central entonces el estado se debe forzar a order"
* intent = #order
* intent ^comment = "Debe ser siempre order"


//subject

* subject only Reference(Patient)
* subject 1..1
* subject ^short = "Información acerca del paciente al cual se le ha indicado la receta"
* subject.reference ^short = "Referencia al recurso del paciente al cual se le arma la receta"
* subject.display ^short = "Nombre del paciente al cual pertenece el recurso que esta referenciando"


//creación
* authoredOn 1..1
* authoredOn ^short = "Fecha y hora cuando el medicamento fue dispensado. Formato YYYY-MM-DDThh:mm:ss+zz:zz, ej: 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z"
* authoredOn ^short = "Fecha y hora cuando el medicamento fue dispensado. Se debe especificar en formato de fecha según HL7. YYYY-MM-DDThh:mm:ss+zz:zz, ej. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z."
* authoredOn ^comment = "No soporta formato 24 hrs"





Instance : EjemploRecetaCL
Title : "Ejemplo de Recurso de una receta completa"
InstanceOf : RecetaCl

* contained[0] = medicationrequest-1
* contained[+] = medicationrequest-2
* groupIdentifier.value = "z4fxajxh2kdkock9pvsp"
* status = #active
* intent = #order
* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* authoredOn = "2021-06-12T17:31:00Z"

Instance: medicationrequest-1
InstanceOf: RecetaPrescripcionCl
Usage: #inline
* identifier.type.coding.code = #Id_Local
* identifier.type.coding.display = "Identificación Local"
* identifier.system = "http://recetaelectronica.minsal.cl/validar_tipo_receta"
* identifier.value = "10101010"
* identifier.assigner.display = "CESFAM COQUIMBO"

* status = #active
* intent = #order
* category.coding.code = #inpatient
* medicationReference = Reference(https://api-receta.minsal.cl/v2/Medication/1703591000167111) "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
* subject = Reference(https://api-receta.minsal.cl/v2/Patient/3254156114) "FELIPE MAURICIO MANCINI RUIZ-TAGLE"
* requester = Reference(https://api-receta.minsal.cl/v2/Practitioner/3253825513) "JUAN JOSÉ ORTEGA CALLEJAS"
* authoredOn = "2021-08-15T17:31:00Z"
* groupIdentifier.value = "z4fxajxh2kdkock9pvsp"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = $sct#26643006 "Vía Oral"
* dosageInstruction.method = $sct#738995006 "Tragar (método de administración)"


* dosageInstruction.doseAndRate.doseQuantity.unit = "Comprimido"
* dosageInstruction.doseAndRate.doseQuantity.value = 2



* dispenseRequest.validityPeriod.start = "2021-08-15"
* dispenseRequest.validityPeriod.end = "2022-08-15"


Instance: medicationrequest-2
InstanceOf: RecetaPrescripcionCl
Usage: #inline

* identifier.type.coding.code = #Id_Local
* identifier.type.coding.display = "Identificación Local"
* identifier.system = "http://recetaelectronica.minsal.cl/validar_tipo_receta"
* identifier.value = "10101011"
* identifier.assigner.display = "CESFAM COQUIMBO"

* status = #completed


* intent = #order

* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #outpatient
//* category.coding.display = "Inpatient"

* groupIdentifier.value = "z4fxajxh2kdkock9pvsp"

* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Medicamento#1028"

* subject = Reference(https://api-receta.minsal.cl/v2/Patient/3254156114) "FELIPE MAURICIO MANCINI RUIZ-TAGLE"
* requester = Reference(https://api-receta.minsal.cl/v2/Practitioner/3253825513) "JUAN JOSÉ ORTEGA CALLEJAS"
* authoredOn = "2021-08-15T17:31:00Z"


* note.text = "Al paciente se le indicó lo tome 2 veces al día"

* dosageInstruction.text = "Una tableta cada 12 hrs por 5 días"
* dosageInstruction.patientInstruction = "Una tableta al desayuno y otro a la cena, por 5 días"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 12

* dosageInstruction.timing.repeat.periodUnit = #h

* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #421521009
* dosageInstruction.route.coding.display = "tragarlo, instrucciones de dosage imperativas (qualifier value)"

* dosageInstruction.doseAndRate.doseRange.low.value = 1
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"



* dispenseRequest.validityPeriod.start = "2021-06-12"
* dispenseRequest.validityPeriod.start = "2022-01-12"
* dispenseRequest.quantity.value = 10
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.value = 5
* dispenseRequest.expectedSupplyDuration.unit = "días"
* dispenseRequest.expectedSupplyDuration.code = #d





Alias: $sct = http://snomed.info/sct

Instance : EjemploRecetaCL-2
Title : "Ejemplo de Recurso de una receta con solo un fármaco prescrito, Paracetamol 500mg"
InstanceOf : RecetaCl
Usage: #example

* contained = MedicamentoPres
* status = #active
* intent = #order
* groupIdentifier.value = "a4om197ytt5njq4xyclo"
* subject = Reference(https://api-receta.minsal.cl/v2/Patient/1115090713) "PABLO PIZARRO"
* authoredOn = "2021-08-22T17:31:00Z"

Instance: MedicamentoPres
InstanceOf: RecetaPrescripcionCl
Usage: #inline

* note.text = "Administrar durante comidas"
* status = #active
* intent = #order

* subject = Reference(https://api-receta.minsal.cl/v2/Patient/1115090713) "PABLO PIZARRO"
* category.coding.code = #inpatient
* requester = Reference(https://api-receta.minsal.cl/v2/Practitioner/3245690418) "Maria Carmen De los angeles Del rio Gonzalez"
* authoredOn = "2021-08-22T17:31:00Z"
* dispenseRequest.validityPeriod.end = "2021-09-22"
* dispenseRequest.validityPeriod.start = "2021-08-22"
* groupIdentifier.value = "a4om197ytt5njq4xyclo"
* dosageInstruction.route = $sct#26643006 "Vía Oral"
* dosageInstruction.method = $sct#738995006 "Tragar (método de administración)"
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.repeat.boundsDuration = 1 #d
* dosageInstruction.timing.repeat.boundsDuration.system = "http://unitsofmeasure.org"


* dosageInstruction.doseAndRate.doseQuantity.value = 1 
* dosageInstruction.doseAndRate.doseQuantity.unit = "comprimido"
* medicationReference = Reference(https://api-receta.minsal.cl/v2/Medication/1682851000167115) "Paracetamol 500 mg comprimido"