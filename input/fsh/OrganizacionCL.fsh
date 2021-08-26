Profile:        OrganizaciondRecetaCL
Parent:         Organization
Id:             RecetaOrganizacionCl
Title:          "Organización_Receta_CL"
Description:    "Este Perfil ha sido desarrollado para cubrir las necesidades del Caso de Uso de Receta Electrónica. Sin embargo, se ha modelado con el fin de cubrir las necesidades nacionales de un Recurso de Organzación para cubrir las necesidades de una Organización Prestadora de salud o Dispensadora"

* active ^short = "estado de prestador o dispensador si esta facultado o no (true|false)"

* identifier and identifier.system and identifier.value MS
* identifier 1..*
* identifier ^short = "identificador de organizacion de salud (DEIS, RUT, Codigos para cietos tipos de REcintos, etc.)"
* identifier.system ^short = "indicador del sistema de indentificación usado pora determinar el valor del identificador"
* identifier.system ^definition = "Para el caso de Receta System debera contener dos posibles sistemas de identificacion: DEIS url http://minsal.cl/deis/codDeis o el de Farmacia XXXX XXXXX. En base a lo que se usará tiene que ser indicado en este campo)"

* name and alias MS
* name ^short = "Nombre Legal de la Organizacion" 
* alias ^short = "Nombre de Fantasía"  		

* telecom MS
* telecom ^short = "contactos de la organiazacon" 
* telecom.use ^short = "uso del contacto descrito (home | work | temp | old | mobile)" 


* address and address.use and address.line and address.city and address.district and address.state and address.country MS

* address.line ^short = "Calle o avenida, numero y casa o depto"
* address.city ^short = "Campo para Comuna de residencia"
* address.city from CodComunas (required)
* address.district ^short = "Campo para Provincia de Residencia"
* address.district from CodProvincia (required)
* address.state ^short = "Campo para Provincia de Región"
* address.state from CodRegion (required)
* address.country ^short = "Campo para País de Residencia"
* address.country from ISO3166COD (required)


ValueSet:    ISO3166COD
Title:       "Códigos de Países Segun Norma ISO-3166 N"
Id:          DOCType-V2-0203
Description: "Codigos para especificar tipos de identificadores usando lo definido en Hl7 V2.x"
* codes from system https://terminology.hl7.org/2.1.0/CodeSystem-v2-0203.html     

ValueSet:    CodComunas
Title:       "Códigos de Comunas en Chile"
Id:          CodNacComunas
Description: "Codigos definidos para identificar una comuna en Chile"
* codes from system https://apis.digital.gob.cl/dpa/comunas/     // api nacional

ValueSet:    CodProvincia
Title:       "Códigos de Provincias en Chile"
Id:          CodProv
Description: "Codigos definidos para identificar una provincia en Chile"
* codes from system https://apis.digital.gob.cl/dpa/provincias/   // api nacional

ValueSet:    CodRegion
Title:       "Códigos de Regiones en Chile"
Id:          CodReg
Description: "Codigos definidos para identificar una comuna en Chile"
* codes from system https://apis.digital.gob.cl/dpa/regiones/     // api nacional


Instance : OrganizacionRecetaCL
Title : "Ejemplo de Recurso de organización prestadora de salud"
InstanceOf : RecetaOrganizacionCl

	

* active = true
* identifier.system = "http://minsal.cl/deis/codigodeis"
* identifier.value = "1233"

* name = "Centro de Salud Familiar Rio Bueno de Linares"	
* alias = "Rio Bueno CESFAM"

* telecom.system = #phone
* telecom.use = #work
* telecom.value = "45325775"
	
	

* address.line = "Calle Central 33"
* address.city = #07401  //codigo de comuna por binding (linares)
* address.district = #074  //codigo de comuna por binding (linares)
* address.state = #07 //codigo por binding region (maule)
* address.country = #152	
	
	
	