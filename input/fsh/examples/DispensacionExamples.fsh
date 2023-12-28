
Instance: Ejemplo1-Dispensacion
InstanceOf: DispensacionMedicamentoCL
Description: "Dispensación de medicamento comercial"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2022-08-17T14:16:46.924Z"
* status = #completed
* authorizingPrescription = Reference(Ejemplo1-prescipcion)
* medicationReference = Reference(Medicamento1) "enalapril maleato 10 mg comprimido (Lab Chile) 20 comprimidos"
* subject = Reference(Paciente1)
* quantity.value = 3
* quantity.system = "http://unitsofmeasure.org"
* location = Reference(Loc1) "FarmaShield - Local: 73"
* performer[Dispensador].function.coding = CSFuncionProfesionalDispensacion#Dispensador
* performer[Dispensador].actor = Reference(Prestador1)
* dosageInstruction.text = "Administrar 1 Comprimido cada 1 día por 1 año"
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"

* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.sequence = 1
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* whenHandedOver = "2022-08-20T15:27:32.349Z"


Instance: Ejemplo2-Dispensacion
InstanceOf: DispensacionMedicamentoCL
Description: "Dispensación de medicamento Lab Chile con rango indicado"
Usage: #example
* meta.versionId = "1"
* meta.lastUpdated = "2022-08-17T14:16:46.924Z"
* status = #completed
* authorizingPrescription = Reference(Ejemplo1-prescipcion)
* medicationReference = Reference(Medicamento1) "enalapril maleato 10 mg comprimido (Lab Chile) 20 comprimidos"
* subject = Reference(Paciente1)
* quantity.value = 3
* quantity.system = "http://unitsofmeasure.org"
* location = Reference(Loc1) "FarmaShield - Local: 73"
* performer[Dispensador].function.coding = CSFuncionProfesionalDispensacion#Dispensador
* performer[Dispensador].actor = Reference(Prestador1)
* dosageInstruction.text = "Administrar 1 pastilla cada 1 día por 1 año hasta un máximo de 20 mg x día"
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseRange.low.value = 10
* dosageInstruction.doseAndRate.doseRange.low.system = "https://interoperabilidad.minsal.cl/fhir/ig/snre/CodeSystem/CSUnidadAsistencial"
* dosageInstruction.doseAndRate.doseRange.low.code = #miligramo
* dosageInstruction.doseAndRate.doseRange.high.value = 20
* dosageInstruction.doseAndRate.doseRange.high.system = "https://interoperabilidad.minsal.cl/fhir/ig/snre/CodeSystem/CSUnidadAsistencial"
* dosageInstruction.doseAndRate.doseRange.high.code = #miligramo

* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.sequence = 1

* whenHandedOver = "2022-08-20T15:27:32.349Z"


