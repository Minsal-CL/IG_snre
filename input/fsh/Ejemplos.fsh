Instance : PacienteCL
Title : "Ejemplo de Recurso Paciente Nacional"
Description: "Paciente ficticio nacional CI Chilena, sin sistema de validación \"http://regcivil.cl/Validacion/RUN\" ficticio , cuyo nombre se decribe mediante el oficial y uno social. La dirección tampoco es Real"
InstanceOf : CorePacienteCl
Usage : #example

	 
	//Identificación por Cédula Chilena
* identifier.use = #official    //obligado
* identifier.type.extension[paises].valueCodeableConcept.coding.system =  "urn:iso:std:iso:3166"
* identifier.type.extension[paises].valueCodeableConcept.coding.code = #152
* identifier.type.extension[paises].valueCodeableConcept.coding.display = "Chile"
* identifier.type.coding.system = "https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSCodigoDNI"
* identifier.type.coding.code = #NNCHL
* identifier.type.coding.display = "Chile"

* identifier.system = "http://regcivil.cl/Validacion/RUN"
* identifier.value = "15.236.327-k"

//registro de paciente activo
* active = true

//Nombre Oficial
* name[NombreOficial].use = #official
* name[NombreOficial].family = "Rosales"
* name[NombreOficial].family.extension[mothers-family].valueString	 = "Bosh" //uso de la extensión
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
* address.city.extension[ComunasCl].url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/ComunasCl"
* address.city.extension[ComunasCl].valueCode = #05602 "Algarrobo"

* address.district.extension[ProvinciasCl].url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/ProvinciasCl"
* address.district.extension[ProvinciasCl].valueCode = #151 "Arica"

* address.state.extension[RegionesCl].url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/RegionesCl"
* address.state.extension[RegionesCl].valueCode = #03 "Atacama"

* address.country.extension[CodigoPaises].url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/CodigoPaises"
* address.country.extension[CodigoPaises].valueCodeableConcept.coding.system = #CL "Chile"


* contact.extension.url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/IdContacto"

* contact.extension.extension[0].url = "tutId"
* contact.extension.extension[=].valueIdentifier.type = https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSCodigoDNI#NNCHL "Chile"
* contact.extension.extension[=].valueIdentifier.system = "http://regcivil.cl/Validacion/RUN"
* contact.extension.extension[=].valueIdentifier.value = "8987321-7"

* contact.extension.extension[+].url = "docProc"
* contact.extension.extension[=].valueCodeableConcept.coding.system  = "urn:iso:std:iso:3166"
* contact.extension.extension[=].valueCodeableConcept.coding.code = #152 
* contact.extension.extension[=].valueCodeableConcept.coding.display = "Chile"


* contact.relationship = http://terminology.hl7.org/CodeSystem/v2-0131#N "Next-of-Kin"
* contact.name.use = #official
* contact.name.family = "Calleja"
* contact.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-mothers-family"
* contact.name.family.extension.valueString = "Morales"
* contact.name.given[0] = "Juana"
* contact.name.given[+] = "Josefa"

* communication.language.coding.system = "https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSCodigoslenguaje"
* communication.language.coding.code = #es-CL "Spanish"
* communication.language.coding.display = "Chile, Chilean Spanish"

* generalPractitioner.reference = "http://fhir.cl/Organization/15"
* generalPractitioner.display = "Hospital Barros Luco"
/*
Instance : PacienteCL2
Title : "Ejemplo de Recurso Paciente Extranjero"
Description: "Paciente ficticio extrangero, con identificación Pasaporte de origen Salvadoreño sin sistema real de validación del número de Pasaporte."
InstanceOf : CorePacienteCl
Usage : #example

// Nacionalidad por medio de la extensión
* extension[nacionalidad].valueCodeableConcept.coding.system = "urn:iso:std:iso:3166"
* extension[nacionalidad].valueCodeableConcept.coding.code = #222
* extension[nacionalidad].valueCodeableConcept.coding.display = "El Salvador"

 
//Identificación por Pasaporte Salvadoreño
* identifier.use = #official    //obligado
* identifier.type.extension[paises].valueCodeableConcept.coding.system = "urn:iso:std:iso:3166"
* identifier.type.extension[paises].valueCodeableConcept.coding.code = #222
* identifier.type.extension[paises].valueCodeableConcept.coding.display = "El Salvador"
* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #PPN
* identifier.type.coding.display = "Passport number"
* identifier.system = "http://Pasaportes.cl/Validacion/Pass"
* identifier.value = "P3334521.2"


//registro de paciente activo
* active = true

//Nombre Oficial
* name[NombreOficial].use = #official
* name[NombreOficial].family = "Cabrales"
* name[NombreOficial].family.extension[mothers-family].valueString = "Rivas"
* name[NombreOficial].given = "Wilmer"
* name[NombreOficial].given[1] = "Andres"
* name[NombreOficial].given[2] = "de Dios"


//un contactos, un email

* telecom.system = #email
* telecom.use = #home
* telecom.value = "wilCAB12l@wilmermail.com"

//sexo registrado al nacer y fecha de nacimiento
* gender = #male
* birthDate = "1968-11-03"



// Una sola dirección
* address.use = #temp
* address.line = "Calle 4 Norte, 52, pieza 802"
* address.city = "15101"  //codigo de comuna por binding (Arica)
* address.district = "151"  //codigo de comuna por binding (Arica)
* address.state = "15" //codigo por binding region (Arica)
* address.country = #152

 
Instance: PacienteCl-3
InstanceOf: CorePacienteCl
Description: "Paciente ficticio nacional CI Chilena con sistema de validación no real, cuyo nombre es solo el oficial. La dirección tampoco es Real"
Title : "Paciente Nacional, con datos actualizados, declarando nacionalidad"
Usage: #example

* meta.versionId = "2"
* meta.lastUpdated = "2021-07-13T00:22:41.166Z"

* extension[nacionalidad].valueCodeableConcept.coding.system = "urn:iso:std:iso:3166"
* extension[nacionalidad].valueCodeableConcept.coding.code = #152
* extension[nacionalidad].valueCodeableConcept.coding.display = "Chile"


* identifier.use = #official
* identifier.type.extension[paises].valueCodeableConcept.coding.system = "urn:iso:std:iso:3166"
* identifier.type.extension[paises].valueCodeableConcept.coding.code = #152
* identifier.type.extension[paises].valueCodeableConcept.coding.display = "Chile"
* identifier.type.coding.system = "https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSCodigoDNI"
* identifier.type.coding.code = #NNCHL
* identifier.type.coding.display = "Chile"
* identifier.system = "http://regcivil.cl/Validacion/RUN"
* identifier.value = "15602754-5"

* active = true
* name[NombreOficial].use = #official
* name[NombreOficial].family = "PIZARRO"

* name[NombreOficial].family.extension[mothers-family].valueString = "DELGADO" //uso de la extensión

* name[NombreOficial].given[0] = "PABLO"
* name[NombreOficial].given[+] = "RODRIGO"

* telecom.system = #email
* telecom.value = "ppizarro.delgado@minsal.cl"
* telecom.use = #work

* gender = #male
* birthDate = "1983-08-04"

* address.use = #home
* address.city = "13120"
* address.district = "131"
* address.state = "13"
* address.country = #152
* deceasedBoolean = false 


Instance: PacienteCl-4
InstanceOf: CorePacienteCl
Title : "Ejemplo de Recurso de paciente Nacional con contacto declarado"
Description: """Paciente ficticio nacional CI Chilena, 
     * sin sistema de validación \"http://regcivil.cl/Validacion/RUN\" ficticio , 
     * cuyo nombre se decribe mediante el oficial y uno social. 
     * La dirección tampoco es Real.
     * Se agrega al paciente un acompañante patiente."""
Usage: #example

* meta.versionId = "2"
* meta.lastUpdated = "2021-07-13T00:22:41.166Z"
* meta.profile = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/CorePacienteCl"

* extension.url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/CodigoPaises"
* extension.valueCodeableConcept.coding.system  = "urn:iso:std:iso:3166"
* extension.valueCodeableConcept.coding.code  = #152
* extension.valueCodeableConcept.coding.display  = "Chile"

* identifier.use = #official
* identifier.type.extension[paises].valueCodeableConcept.coding.system =  "urn:iso:std:iso:3166"
* identifier.type.extension[paises].valueCodeableConcept.coding.code = #152
* identifier.type.extension[paises].valueCodeableConcept.coding.display = "Chile"


* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #PPN
* identifier.type.coding.display = "Passport Number"

* identifier.system = "http://regcivil.cl/Validacion/Passport"
* identifier.value = "P102145874"

* active = true
* name[NombreOficial].use = #official
* name[NombreOficial].family = "Ortega"
* name[NombreOficial].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-mothers-family"
* name[NombreOficial].family.extension.valueString = "Callejas"
* name[NombreOficial].given[0] = "Juan"
* name[NombreOficial].given[+] = "José"
* name[NombreSocial].use = #usual
* name[NombreSocial].given = "JuanJo"
* telecom.system = #email
* telecom.value = "juan@jo.cl"
* telecom.use = #home
* gender = #male
* birthDate = "1980-08-04"
* address.use = #home
* address.city = "13120"
* address.district = "131"
* address.state = "13"
* address.country = "152"

* contact.extension.url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/IdContacto"
* contact.extension.extension[0].url = "tutId"
* contact.extension.extension[=].valueIdentifier.type = https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSCodigoDNI#NNCHL "Chile"
* contact.extension.extension[=].valueIdentifier.system = "http://regcivil.cl/Validacion/RUN"
* contact.extension.extension[=].valueIdentifier.value = "8987321-7"

* contact.extension.extension[+].url = "docProc"
* contact.extension.extension[=].valueCodeableConcept.coding.system  = "urn:iso:std:iso:3166"
* contact.extension.extension[=].valueCodeableConcept.coding.code = #152 
* contact.extension.extension[=].valueCodeableConcept.coding.display = "Chile"

* contact.relationship = http://terminology.hl7.org/CodeSystem/v2-0131#N "Next-of-Kin"
* contact.name.use = #official
* contact.name.family = "Calleja"
* contact.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-mothers-family"
* contact.name.family.extension.valueString = "Morales"
* contact.name.given[0] = "Juana"
* contact.name.given[+] = "Josefa"


Instance: PacienteCl-5
InstanceOf: CorePacienteCl
Title : "Ejemplo de Recurso de paciente Nacional con contacto declarado y extensión en dirección"
Description: """Paciente ficticio nacional CI Chilena, 
     * sin sistema de validación \"http://regcivil.cl/Validacion/RUN\" ficticio , 
     * cuyo nombre se decribe mediante el oficial y uno social. 
     * La dirección tampoco es Real.
     * Se agrega al paciente un acompañante patiente
     * La dirección se declara con códigos por extensión."""
Usage: #example

* meta.versionId = "2"
* meta.lastUpdated = "2021-07-13T00:22:41.166Z"
* meta.profile = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/CorePacienteCl"

* extension.url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/CodigoPaises"
* extension.valueCodeableConcept.coding.system  = "urn:iso:std:iso:3166"
* extension.valueCodeableConcept.coding.code  = #152
* extension.valueCodeableConcept.coding.display  = "Chile"

* identifier.use = #official
* identifier.type.extension[paises].valueCodeableConcept.coding.system =  "urn:iso:std:iso:3166"
* identifier.type.extension[paises].valueCodeableConcept.coding.code = #152
* identifier.type.extension[paises].valueCodeableConcept.coding.display = "Chile"


* identifier.type.coding.system = "http://terminology.hl7.org/CodeSystem/v2-0203"
* identifier.type.coding.code = #PPN
* identifier.type.coding.display = "Passport Number"

* identifier.system = "http://regcivil.cl/Validacion/Passport"
* identifier.value = "P102145874"

* active = true
* name[NombreOficial].use = #official
* name[NombreOficial].family = "Ortega"
* name[NombreOficial].family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-mothers-family"
* name[NombreOficial].family.extension.valueString = "Callejas"
* name[NombreOficial].given[0] = "Juan"
* name[NombreOficial].given[+] = "José"
* name[NombreSocial].use = #usual
* name[NombreSocial].given = "JuanJo"
* telecom.system = #email
* telecom.value = "juan@jo.cl"
* telecom.use = #home
* gender = #male
* birthDate = "1980-08-04"
* address.use = #home
* address.city = "Ñuñoa"
* address.city.extension[comunas].valueCode = #13120
* address.district = "Santiago"
* address.district.extension[provincias].valueCode = #131
* address.state = "Metropolitana de Santiago"
* address.state.extension[regiones].valueCode = #13

* address.country = "Chile"
* address.country.extension[paises].valueCodeableConcept.coding.code = #152
* address.country.extension[paises].valueCodeableConcept.coding.system = "urn:iso:std:iso:3166"

* contact.extension.url = "https://hl7chile.cl/fhir/ig/CoreCL/StructureDefinition/IdContacto"
* contact.extension.extension[0].url = "tutId"
* contact.extension.extension[=].valueIdentifier.type = https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSCodigoDNI#NNCHL "Chile"
* contact.extension.extension[=].valueIdentifier.system = "http://regcivil.cl/Validacion/RUN"
* contact.extension.extension[=].valueIdentifier.value = "8987321-7"

* contact.extension.extension[+].url = "docProc"
* contact.extension.extension[=].valueCodeableConcept.coding.system  = "urn:iso:std:iso:3166"
* contact.extension.extension[=].valueCodeableConcept.coding.code = #152 
* contact.extension.extension[=].valueCodeableConcept.coding.display = "Chile"

* contact.relationship = http://terminology.hl7.org/CodeSystem/v2-0131#N "Next-of-Kin"
* contact.name.use = #official
* contact.name.family = "Calleja"
* contact.name.family.extension.url = "http://hl7.org/fhir/StructureDefinition/humanname-mothers-family"
* contact.name.family.extension.valueString = "Morales"
* contact.name.given[0] = "Juana"
* contact.name.given[+] = "Josefa"



Instance: AuditEventEx
InstanceOf: AuditEventCl
Title : "Ejemplo de un Audit-Event Search."
Description: "Log de Audición de una operacion Search."


Usage: #example
* type = http://terminology.hl7.org/CodeSystem/audit-event-type#rest "Restful Operation"
* subtype = http://hl7.org/fhir/restful-interaction#search "search"
* action = #E
* recorded = "2021-08-22T23:42:24Z"
* outcome = #0
* agent[0].type = http://terminology.hl7.org/CodeSystem/extra-security-role-type#humanuser "human user"
* agent[=].who.identifier.value = "95"
* agent[=].altId = "601847123"
* agent[=].name = "Grahame Grieve"
* agent[=].requestor = true

* agent[=].network.address = "Workstation1.ehr.familyclinic.com"
* agent[=].network.type = #1


* source.observer.reference = "Practitioner/3240"


* entity.what.reference = "Organization/ORG1"

Instance: BundleEx
InstanceOf: BundleCl
Title : "Ejemplo Simple de Bundle de Transacción"
Description: "Bundle de Transacción con un recurso Practitioner y un Recurso Organization"
Usage: #example

* identifier.system = "http://sistema.cl/Transacciones/"
* identifier.value = "Bundle-001"

* type = #transaction
* timestamp = "2020-09-25T00:00:00-03:00"

* entry[0].fullUrl = "Organization/ORG1"


* entry[=].request.method = #POST
* entry[=].request.url = "Organization"

* entry[+].fullUrl = "Practitioner/3020"

* entry[=].request.method = #POST
* entry[=].request.url = "Practitioner"


Instance : EspecialidadCL
Title : "Ejemplo de Recurso de especialidad"
Description: "Define el Rol de un Médico durante la Operación de un paciente en Urgencia"
InstanceOf : CoreEspecialidadCl

* active = true

* practitioner.reference = "Practitioner/3240"
* practitioner.display = "Johanna Rosa Silva Reyes"

* specialty.coding.system = "https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSEspecialidadesDeisCL"
* specialty.coding.code = #06
* specialty.text = "Cirujano Cardiovascular"

* specialty[1].coding.system = "https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSEspecialidadesDeisCL"
* specialty[1].coding.code = #03
* specialty[1].text = "Médico Cardiólogo"

* specialty[2].coding.system = "https://hl7chile.cl/fhir/ig/CoreCL/CodeSystem/CSEspecialidadesDeisCL"
* specialty[2].coding.code = #30
* specialty[2].text = "Médico internista"


 Instance : LocalizacionEjemploCL1
Title : "Ejemplo Localización Farmacia"
Description: "Ejemplo de la localización relacionada con una Farmacia específica ubicada en la comuna de Viña del Mar"
InstanceOf : CoreLocalizacionCl

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

* address.line = "Calle 10 Norte, 1240, Viña del Mar"
* address.city = #05109 
* address.district = #051
* address.state = #05
* address.country = #152

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

Instance : MedicamentoCl
Title : "Ejemplo de comprimido Tareg - D 160"
Description: "Medicamento comprimido Tareg -D160 referemciado como medicamento en la TFC, considerando el de 25 comprimidos"
InstanceOf : CoreMedicamentoCl

	
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

Instance: MedicamentoCl-2
Title : "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
Description: "Definición de Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido Código de descripción = 1703591000167111 y de Cocepto = 696681000167108 según TFC"
InstanceOf: CoreMedicamentoCl
Usage: #example

* identifier[DescripcionId].use = #official
* identifier[DescripcionId].system = "http://minsal.cl/semantikos/description-id"
* identifier[DescripcionId].value = "1703591000167111"
* identifier[ConceptId].use = #official
* identifier[ConceptId].system = "http://minsal.cl/semantikos/concept-id"
* identifier[ConceptId].value = "696681000167108"
* code.text = "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
* code = $description-id#1703591000167111 "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido" 

Instance : OrganizacionCl
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
	
	
Instance : PrestadorCL
Title : "Ejemplo de Recurso Prestador como base para un Core Nacional"
Description: "Ejemplo de un Prestador no Real con identificadores en Systemas con API\"s no disponibles"
InstanceOf : CorePrestadorCl

* id = "3240"	
 
//Identificación por Cédula Chilena
* identifier[RUN].use = #official    //obligado
//* identifier[RUN].system = "https://api.minsal.cl/v1/personas/datos/basicos/run"
* identifier[RUN].value = "8336277-3" // endPoint definido por perfil
* identifier[RUN].system = "http://api_run/run"
* identifier[RNPI].use = #secondary    //obligado
//* identifier[RNPI].system = "https://apis.superdesalud.gob.cl/api/prestadores/registro/"
* identifier[RNPI].value = "999999"  // endPoint definido por perfil


//registro de prestador activo
* active = true

//Nombre Prestador
* name.use = #official


* name.family.extension[mothers-family].valueString = "Reyes"

* name.given = "Johanna"
* name.given[1] = "Rosa"


//dos contactos, un celular y un email

* telecom.system = #phone
* telecom.use = #mobile
* telecom.value = "9345666"

* telecom[1].system = #email
* telecom[1].use = #work
* telecom[1].value = "DraSilva@mimail.com"

//sexo registrado al nacer y fecha de nacimiento
* gender = #female
* birthDate = "1974-08-12"

// Una sola dirección
* address.use = #home
* address.line = "Naranjos, 22, depto 32"
* address.city = #09101  //codigo de comuna por binding (temuco)
* address.district = #091  //codigo de privincia por binding (cautin)
* address.state = #09 //codigo por binding region (araucania)
* address.country = #152

//un titulo y una especialidad
* qualification[Cert].code.coding.system = "https://api.minsal.cl/v1/catalogos/profesiones/"
* qualification[Cert].code.coding.code = #2112  // endPoint definido por perfil
* qualification[Cert].code.coding.display = "Certificado Profesional Médico Cirujano" //codigo de título profesional Universitario
* qualification[Cert].code.text = "Certificado(s)"
* qualification[Esp].code.coding.system = "https://api.minsal.cl/v1/catalogos/tiposEspecialidadMedica/"
* qualification[Esp].code.coding.code = #122  // endPoint definido por perfil
* qualification[Esp].code.coding.display = "Cardiólogia"
* qualification[Esp][1].code.coding.system = "https://api.minsal.cl/v1/catalogos/tiposEspecialidadMedica/"
* qualification[Esp][1].code.coding.code = #1234  // endPoint definido por perfil
* qualification[Esp][1].code.coding.display = "Medicina interna"
* qualification[Esp].code.text = "Especialidad(es)" 


Instance : EjemplValidacionProvCl
Title : "Ejemplo de la Validación de una Receta por medio del Prescriptor"
Description: "Ejemplo de una Receta en Request Group que contiene una receta, en la cual el prestador que la ha desarollado genera una validación por medio de una firma" 
InstanceOf : ProvenanceCl
Usage: #example




* target.reference = "RequestGroup/RG12224"

* recorded =  2015-08-27T08:39:24+10:00

* activity.coding.system = "http://terminology.hl7.org/CodeSystem/v3-DocumentCompletion"
* activity.coding.code = #LA
* activity.coding.display = "legally authenticated"

* agent.type.coding.system = "http://terminology.hl7.org/CodeSystem/provenance-participant-type"   
* agent.type.coding.code = #author
* agent.type.coding.display = "author"
* agent.who.reference = "Practitioner/3240"

* signature.type.system = "urn:iso-astm:E1762-95:2013"
* signature.type.code = #1.2.840.10065.1.12.1.1
* signature.when = 2015-08-27T08:39:24+10:00

* signature.who = Reference(Practitioner/3240)

* signature.sigFormat = #application/signature+xml
* signature.data = "Li4u"


Instance: example
InstanceOf: RequestGroup
Description: "Solo un ejemplo"
Usage: #example

* id = "RG12224"

* status = #draft
* intent = #plan
*/