
Instance: Ejemplo1-Receta
InstanceOf: MedicamentoRecetaCL
Description: "Ejemplo de una receta con un fármaco"
Usage: #example
* id = "Receta1"
* contained[0] = PrescipcionEj
* contained[+] = PrescripcionEj2
* groupIdentifier.value = "7f5b95f78a375236d71f"
* status = #active
* intent = #order
* subject = Reference(Paciente1) 
* authoredOn = "2022-08-20T15:02:12.314Z"
* basedOn[0] = Reference(PrescipcionEj)
* basedOn[1] = Reference(PrescripcionEj2)



Instance: PrescripcionEj2
InstanceOf: PrescripcionRecetaCL
Usage: #inline
* id = "Receta4"
* status = #active
* intent = #order
* subject = Reference(Paciente1) 
* medicationReference = Reference(Medicamento2) "prednisona 20 mg comprimido"
* requester = Reference(Prestador1) 
* groupIdentifier.value = "7f5b95f78a375236d71f"
* dosageInstruction.text = "Administrar 1 Comprimido cada 4 horas por 24 horas"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 4
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.boundsDuration = 24 'h'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-08-20"
* dispenseRequest.performer = Reference(Organizacion1) "Centro de Salud Familiar Juan Pablo II (La Serena)"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient "Outpatient"
* courseOfTherapyType = CSCodificacionPatron#seasonal "Por temporada"
* identifier.type = CSTipoPrescripcion#Id_Local "Id_Local"
* identifier.system = "https://innovaquidad.cl/integracion_minsal/idRecetaElectronica"
* identifier.value = "e815615ef9ee7afb52be"
* identifier.assigner.identifier.system = "https://api-receta.minsal.cl/v2Organization/8qj5s1ostjswt3r95vnv"
* identifier.assigner.display = "Centro de Salud Familiar Juan Pablo II (La Serena)"

