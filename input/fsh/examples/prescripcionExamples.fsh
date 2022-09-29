Instance: Ejemplo1-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1654171000167115) "diclofenaco sódico 50 mg supositorio"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "7f5b95f78a375236d71f"
* dosageInstruction.text = "Administrar 1 Supositorio cada 12 horas por 5 días"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 12
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.boundsDuration = 5 'd'
* dosageInstruction.route = CSViasAdmin#37161004 "vía de administración en el recto (calificador)"
* dosageInstruction.method = CSMetodos#738993004 "Inserción (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#supositorio "Supositorio"
* dispenseRequest.validityPeriod.start = "2022-08-20"
* dispenseRequest.validityPeriod.end = "2022-08-27"
* category = 
http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#acute "Terapia a corto plazo (aguda)"
* note.text = "En caso de fiebre"



Instance: Ejemplo2-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1690341000167110) "prednisona 20 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "47g7a524age7b5a2cf0a"
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
* dispenseRequest.performer = Reference(Organization/8qj5s1ostjswt3r95vnv) "Centro de Salud Familiar Juan Pablo II (La Serena)"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient "Outpatient"
* courseOfTherapyType = CSCodificacionPatron#seasonal "Por temporada"
* identifier.type = CSTipoPrescripcion#Id_Local "Id_Local"
* identifier.system = "https://innovaquidad.cl/integracion_minsal/idRecetaElectronica"
* identifier.value = "e815615ef9ee7afb52be"
* identifier.assigner.identifier.system = "https://api-receta.minsal.cl/v2/Organization/8qj5s1ostjswt3r95vnv"
* identifier.assigner.display = "Centro de Salud Familiar Juan Pablo II (La Serena)"

Instance: Ejemplo3-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1683511000167113) "ácido alendrónico 70 mg comprimido y carbonato de calcio 1289 mg (calcio 500 mg) + colecalciferol 400 UI comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "51c6bcc8ga342820c9b9"
* dosageInstruction.text = "Administrar 1 Comprimido cada 1 semana por 1 año. Administrar el día Lunes"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #wk
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.timing.repeat.dayOfWeek = #mon
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-20"
* dispenseRequest.validityPeriod.end = "2023-08-20"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#continuous "Terapia continua a largo plazo"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/1973011000167111)
* note.text = "Consumir a primera hora de la mañana, con el estómago vacío. Alimento luego de 1 hora de tomar el medicamento"


Instance: Ejemplo4-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1667301000167110) "clonazepam 0,5 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "61g5ge0c02769206396c"
* dosageInstruction.text = "Administrar 1 Comprimido cada 12 horas por 30 días"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 12
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.boundsDuration = 30 'd'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-09-18"
* dispenseRequest.quantity.value = 60
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#discharge "Discharge"
* courseOfTherapyType = CSCodificacionPatron#acute "Terapia a corto plazo (aguda)"
 

Instance: Ejemplo5-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1667701000167114) "insulina humana NPH 1000 UI/10 mL (100 UI/mL) inyectable"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "825c1968g3621adgbc17"
* dosageInstruction.text = "Administrar 10 - 20 Unidades Internacionales cada 12 horas por 3 días"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 12
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.boundsDuration = 3 'd'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#740685003 "Inyección (método de administración)"
* dosageInstruction.doseAndRate.doseRange.low = 10 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#unidades-internacionales "Unidades Internacionales"
* dosageInstruction.doseAndRate.doseRange.high = 20 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#unidades-internacionales "Unidades Internacionales"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-08-26"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#inpatient "Inpatient"
* courseOfTherapyType = CSCodificacionPatron#acute "Terapia a corto plazo (aguda)"
////* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/2034051000167119) "insulatard suspensión inyectable (Novo Nordisk)"
* note.text = "Administrar la cantidad según resultado de glucosa en sangre"

Instance: Ejemplo6-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1669781000167113) "enalapril 10 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "bcg7g47e8geabbd2590z"
* dosageInstruction.text = "Administrar 1 Comprimido cada 1 día por 1 año"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2023-08-19"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#continuous "Terapia continua a largo plazo"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/1965501000167112) "enalten 10 mg comprimido (Saval)"

Instance: Ejemplo7-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1667741000167112) "hidroclorotiazida 25 mg + triamtereno 50 mg comprimido"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "bcg7g47e8geabbd2590z"
* dosageInstruction.text = "Administrar 1 Comprimido cada 1 día por 1 año"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.timing.repeat.boundsDuration = 1 'a'
* dosageInstruction.route = CSViasAdmin#26643006 "vía Oral route (calificador)"
* dosageInstruction.method = CSMetodos#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2023-08-19"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#continuous "Terapia continua a largo plazo"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = Reference(Medication/2034171000167114) "hidroronol T comprimido (ITF - Labomed)"
* note.text = "Tomar en las mañanas"


Instance: Ejemplo8-prescipcion
InstanceOf: PrescripcionRecetaCL
Usage: #example
* status = #active
* intent = #order
* subject = Reference(Patient/Paciente1) "María Carmen de los Angeles Del río"
* medicationReference = Reference(Medication/1668191000167115) "ketorolaco 30 mg comprimido sublingual"
* requester = Reference(Practitioner/3309267) "Maria Carmen De los angeles Del rio Gonzalez"
* groupIdentifier.value = "f89ba220g4455d6891f7"
* dosageInstruction.text = "Administrar 0.5 - 1 Comprimidos cada 8 - 12 horas por 1 a 2 semanas"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.period = 8
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.timing.repeat.periodMax = 12
* dosageInstruction.timing.repeat.boundsRange.low = 1 'wk' "wk"
* dosageInstruction.timing.repeat.boundsRange.high = 2 'wk' "wk"
* dosageInstruction.route = CSViasAdmin#37839007 "vía de administración por debajo de la lengua (calificador)"
* dosageInstruction.method = CSMetodos#738990001 "Administración (método de administración)"
* dosageInstruction.doseAndRate.doseRange.low = 0.5 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dosageInstruction.doseAndRate.doseRange.high = 1 https://rme.hl7chile.cl/CodeSystem/CSUnidadAsistencial#comprimido "Comprimido"
* dispenseRequest.validityPeriod.start = "2022-08-19"
* dispenseRequest.validityPeriod.end = "2022-09-18"
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#community "community"
* courseOfTherapyType = CSCodificacionPatron#acute "Terapia a corto plazo (aguda)"
//* extension[ProdComercial].url = "https://rme.hl7chile.cl/StructureDefinition/ProdComercial"
////* extension[ProdComercial].valueReference = "Medication/1976661000167112"
* note.text = "Tomar según intensidad del dolor"