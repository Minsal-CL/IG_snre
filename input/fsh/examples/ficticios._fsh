
Instance : Paciente1
Title : "Ejemplo de Recurso Paciente Nacional"
Description: "Paciente de referencia basado en la Core-CL"
InstanceOf : CorePacienteCl
Usage : #example

* id = "Paciente1"
//Identificación por Cédula Chilena
* identifier.use = #official    //obligado
* identifier.type.extension[paises].valueCodeableConcept.coding.system =  "urn:iso:std:iso:3166"
* identifier.type.extension[paises].valueCodeableConcept.coding.code = #152
* identifier.type.extension[paises].valueCodeableConcept.coding.display = "Chile"
* identifier.type.coding.system = "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodigoDNI"
* identifier.type.coding.code = #NNCHL
* identifier.type.coding.display = "Chile"

* identifier.system = "http://regcivil.cl/Validacion/RUN"
* identifier.value = "15.236.327-k"

//registro de paciente activo
* active = true

//Nombre Oficial
* name[NombreOficial].use = #official
* name[NombreOficial].family = "Vader"
* name[NombreOficial].family.extension[mothers-family].valueString	 = "Organa" //uso de la extensión
* name[NombreOficial].given[0] = "Marietta"
* name[NombreOficial].given[+] = "María"
* name[NombreOficial].given[+] = "Ximena"

//nombre social
* name[NombreSocial].use = #usual
* name[NombreSocial].given = "Xime"

//dos contactos, un celular y un email
* telecom.system = #phone
* telecom.use = #mobile
* telecom.value = "943561833"

* telecom[1].system = #email
* telecom[1].use = #work
* telecom[1].value = "mariRosal@mimail.com"

//sexo registrado al nacer y fecha de nacimiento
* gender = #female
* birthDate = "1983-03-24"

// Una sola dirección
* address.use = #home
* address.line = "Av Los Chirimoyos, 32, casa 4"


* address.city.extension[ComunasCl].url = "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/ComunasCl"
* address.city.extension[ComunasCl].valueCodeableConcept.coding.system = "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodComunasCL"
* address.city.extension[ComunasCl].valueCodeableConcept.coding.code = #05602
* address.city.extension[ComunasCl].valueCodeableConcept.coding.display =  "Algarrobo"

* address.district.extension[ProvinciasCl].url = "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/ProvinciasCl"
* address.district.extension[ProvinciasCl].valueCodeableConcept.coding.system = "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodProvinciasCL" 
* address.district.extension[ProvinciasCl].valueCodeableConcept.coding.code = #056 
* address.district.extension[ProvinciasCl].valueCodeableConcept.coding.display = "San Antonio"

* address.state.extension[RegionesCl].url = "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/RegionesCl"
* address.state.extension[RegionesCl].valueCodeableConcept.coding.system  = "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL" 
* address.state.extension[RegionesCl].valueCodeableConcept.coding.code  = #05 
* address.state.extension[RegionesCl].valueCodeableConcept.coding.display  = "Valparaíso"



* contact.extension.url = "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/IdContacto"

* contact.extension.extension[0].url = "tutId"
* contact.extension.extension[=].valueIdentifier.type = https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodigoDNI#NNCHL "Chile"
* contact.extension.extension[=].valueIdentifier.system = "http://regcivil.cl/Validacion/RUN"
* contact.extension.extension[=].valueIdentifier.value = "8987321-7"



* contact.relationship = http://terminology.hl7.org/CodeSystem/v2-0131#N "Next-of-Kin"
* contact.name.use = #official
* contact.name.family = "Calleja"
* contact.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-mothers-family"
* contact.name.family.extension.valueString = "Morales"
* contact.name.given[0] = "Juana"
* contact.name.given[+] = "Josefa"

* communication.language.coding.system = "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodigoslenguaje"
* communication.language.coding.code = #es-CL "Spanish"
* communication.language.coding.display = "Spanish"


Instance : Loc1
Title : "Ejemplo de  Localización Farmacia"
Description: "Ejemplo de la localización relacionada con una Farmacia específica ubicada en la comuna de Viña del Mar"
InstanceOf : CoreLocalizacionCl

* id = "Loc1"
* identifier.value = "23144561"
* identifier.system = "http://miderfarm.cl/validador_id"
* status = #active
* name = "Gran Farmacia Gran"
* alias = "La gran"

* type.coding.code = #PHARM
* type.coding.system = "http://terminology.hl7.org/CodeSystem/v3-RoleCode"
* type.coding.display = "Pharmacy"

* telecom.system = #phone
* telecom.value = "(+56) 234221678"
* telecom.use = #work


* position.longitude = 42.2565
* position.latitude = -71.550261

* managingOrganization.reference = "Organization/ORG1"

* hoursOfOperation.daysOfWeek = #mon
* hoursOfOperation.daysOfWeek = #tue
* hoursOfOperation.daysOfWeek = #wed
* hoursOfOperation.daysOfWeek = #thu
* hoursOfOperation.daysOfWeek = #fri
* hoursOfOperation.daysOfWeek = #sat
* hoursOfOperation.allDay = false
* hoursOfOperation.openingTime = 09:00:00
* hoursOfOperation.openingTime = 19:00:00

Instance: PrescipcionEj
InstanceOf: PrescripcionRecetaCL
Usage: #inline
* status = #active
* intent = #order
* subject = Reference(Paciente1) 
* medicationReference = Reference(Medicamento2) "clonazepam 0,5 mg comprimido"
* requester = Reference(Prestador1) 
* groupIdentifier.value = "7f5b95f78a375236d71f"
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
 

Instance : Prestador1
Title : "Ejemplo de Recurso Prestador como base para un Core Nacional"
Description: "Ejemplo de un Prestador no Real con identificadores en Systemas con API\"s no disponibles"
InstanceOf : CorePrestadorCl

* id = "Prestador1"	
 
//Identificación por Cédula Chilena
* identifier[run].use = #official    //obligado
//* identifier[RUN].system = "https://api.minsal.cl/v1/personas/datos/basicos/run"
* identifier[run].value = "8336277-3" // endPoint definido por perfil
* identifier[run].system = "http://registrocivil.cl/run"

//registro de prestador activo
* active = true
//Nombre Prestador
* name.use = #official
* name.family = "Esparta"
* name.given = "Leonidas"
* name.given[1] = "Rey"


//dos contactos, un celular y un email

* telecom.system = #phone
* telecom.use = #mobile
* telecom.value = "9345666"

* telecom[1].system = #email
* telecom[1].use = #work
* telecom[1].value = "Leonidas300@mimail.com"

//sexo registrado al nacer y fecha de nacimiento
* gender = #male
* birthDate = "1974-08-12"



* qualification[Cert].identifier.value = "cert"
* qualification[Cert].code.coding.system = "https://api.minsal.cl/v1/catalogos/profesiones/"
* qualification[Cert].code.coding.code = #2112  // endPoint definido por perfil
* qualification[Cert].code.coding.display = "Certificado Profesional Médico Cirujano" //codigo de título profesional Universitario
* qualification[Cert].code.text = "Certificado(s)"

* qualification[Esp][0].identifier.value = "esp"
* qualification[Esp][0].code.coding.system = "https://api.minsal.cl/v1/catalogos/tiposEspecialidadMedica/"
* qualification[Esp][0].code.coding.code = #122  // endPoint definido por perfil
* qualification[Esp][0].code.coding.display = "Cardiólogia"
* qualification[Esp][0].code.text = "Especialidad(es)" 

* qualification[Esp][+].identifier.value = "esp"
* qualification[Esp][=].code.coding.system = "https://api.minsal.cl/v1/catalogos/tiposEspecialidadMedica/"
* qualification[Esp][=].code.coding.code = #1234  // endPoint definido por perfil
* qualification[Esp][=].code.coding.display = "Medicina interna"
* qualification[Esp][=].code.text = "Especialidad(es)" 



Instance : Medicamento1
Title : "Ejemplo de comprimido Tareg - D 160"
Description: "Medicamento comprimido Tareg -D160 referemciado como medicamento en la TFC, considerando el de 25 comprimidos"
InstanceOf : CoreMedicamentoCl

* id = "Medicamento1"	
* identifier[DescripcionId].use = #official
* identifier[DescripcionId].system = "http://minsal.cl/semantikos/description-id"
* identifier[DescripcionId].value = "1991971000167110"

* identifier[ConceptId].use = #official
* identifier[ConceptId].system = "http://minsal.cl/semantikos/concept-id"
* identifier[ConceptId].value = "840851000167103"

* code.text = "Tareg - D 160 / 25 comprimido recubierto (Novartis)"
* code.coding.system = "http://minsal.cl/semantikos/description-id"
* code.coding.code = #1991971000167110  
* code.coding.display = "Tareg - D 160 / 25 comprimido recubierto (Novartis)"



Alias: $description-id = http://minsal.cl/semantikos/description-id

Instance: Medicamento2
Title : "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
Description: "Definición de Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido Código de descripción = 1703591000167111 y de Cocepto = 696681000167108 según TFC"
InstanceOf: CoreMedicamentoCl
Usage: #example

* id = "Medicamento2"

* identifier[DescripcionId].use = #official
* identifier[DescripcionId].system = "http://minsal.cl/semantikos/description-id"
* identifier[DescripcionId].value = "1703591000167111"
* identifier[ConceptId].use = #official
* identifier[ConceptId].system = "http://minsal.cl/semantikos/concept-id"
* identifier[ConceptId].value = "696681000167108"
* code.text = "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
* code = $description-id#1703591000167111 "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido" 

Instance: Medicamento3
InstanceOf: Medication
Title : "Ejemplo de Recurso Medicamento"
Description: "Medicamento ficticio"
Usage: #example
* id = "Medicamento3"



Instance : Organizacion1
Title : "Ejemplo Organización Prestadora de Salud"
Description: "CESFAM Rio Bueno (Ficticio) con ID DEIS no real"
InstanceOf : CoreOrganizacionCl
Usage : #example

	 
* id = "ORG1"	
* active = true
* identifier.system = "http://minsal.cl/deis/codigodeis"
* identifier.value = "1233"

* name = "Centro de Salud Familiar Rio Bueno de Linares"	
* alias = "Rio Bueno CESFAM"

* telecom.system = #phone
* telecom.use = #work
* telecom.value = "45325775"
	
	

* address.line = "Calle Central 33"
* address.city = #07401  //codigo de comuna por binding (linares, no validable aun)
* address.district = #074  //codigo de comuna por binding (linares, no validable aun)
* address.state = #07 //codigo por binding region (maule)
* address.country = #152	

