/* 		Extension 		*/
/*	Pais de Origen	*/
Extension:   PaisOrigenNacionalidadCl
Id:          CodigoPaises
Title:       "Codigo de Identificación de países"
Description: "Esta extensión incluye códigos de paises de origen"
* value[x] only CodeableConcept
* value[x] ^short = "Código de País"
* url 1..1 MS
* valueCodeableConcept 1..1 MS
* valueCodeableConcept.coding 1..1 MS
* valueCodeableConcept.coding.system 1..1 MS
* valueCodeableConcept.coding.system from CodPaises (extensible)

/* 		Extension 		*/
/*	Comunas Chile	*/
Extension:   ComunasCl
Id:          ComunasCl
Title:       "Códigos para Comunas en Chile"
Description: "Esta extensión que permite codiificar las Comunas en Chile en el campo de Dirección"
* value[x] only code
* value[x] ^short = "Código de Comunas"
* valueCode 1..1 MS
* url 1..1 MS
* valueCode from VSCodigosComunaCL (extensible)

/* 		Extension 		*/
/*	Provincias Chile	*/
Extension:   ProvinciasCl
Id:          ProvinciasCl
Title:       "Códigos para Provincias en Chile"
Description: "Esta extensión que permite codificar las Provincias en Chile en el campo de Dirección"
* value[x] only code
* value[x] ^short = "Código de Provincias"
* valueCode 1..1 MS
* url 1..1 MS
* valueCode  from VSCodigosProvinciasCL (extensible)

/* 		Extension 		*/
/*	Regiones Chile	*/
Extension:   RegionesCl
Id:          RegionesCl
Title:       "Códigos para Regiones en Chile"
Description: "Esta extensión que permite codificar las Regiones en Chile en el campo de Dirección"
* value[x] only code
* value[x] ^short = "Código de Provincias"
* valueCode 1..1 MS
* url 1..1 MS
* valueCode  from VSCodigosRegionesCL (extensible)

Extension:   IdentificacionContactoCl
Id:          IdContacto
Title:       "Identificación del Contacto de un Paciente"
Description: "Identificación de contacto de paciente en especial para casos en los cuales este actúa como Tutor Legal"
* extension contains
	tutId 1..* MS and
	docProc 1..1 MS
* url MS

//* extension[tutId].url = "tutId"
* extension[tutId] ^short = "Identificación del Tutor"
* extension[tutId] ^definition = "Identificación del Tutor"
* extension[tutId] 1..1 MS
* extension[tutId].url MS
* extension[tutId].value[x] only Identifier
* extension[tutId].valueIdentifier 1..1 MS
* extension[tutId].valueIdentifier.type 1..1 MS
* extension[tutId].valueIdentifier.type.coding.code 1..1 MS
* extension[tutId].valueIdentifier.type.coding.system 1..1 MS
* extension[tutId].valueIdentifier.type.coding.display 0..1 MS
* extension[tutId].valueIdentifier.system 1..1 MS
* extension[tutId].valueIdentifier.value 1..1 MS

//* extension[docProc].url = "docProc"
* extension[docProc] ^short = "País de procedencia del documento"
* extension[docProc].value[x] only CodeableConcept
* extension[docProc].url MS
* extension[docProc].valueCodeableConcept from CodPaises (required)
* extension[docProc].valueCodeableConcept 1..1 MS
* extension[docProc].valueCodeableConcept.coding 1..1 MS
* extension[docProc].valueCodeableConcept.coding.code 1..1 MS
* extension[docProc].valueCodeableConcept.coding.system 1..1 MS
* extension[docProc].valueCodeableConcept.coding.display 0..1 MS
