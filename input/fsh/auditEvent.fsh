Alias: $auditevent = http://minsal.cl/auditevent

Profile: MyAuditEvent
Parent: AuditEvent
Id: MyAuditEvent
* ^url = "https://example.org/fhir/StructureDefinition/MyAuditEvent"
* ^status = #draft
* . ^short = "Registro de eventos con el fin de mantener un log de seguridad"
* type MS
* type.system 1.. MS
* type.system = "http://minsal.cl/auditevent" (exactly)
* type.system from $auditevent (required)
* type.system ^short = "Sistema de validacion de los codigos"
* type.code = #access (exactly)
* type.code MS
* type.code ^short = "codigo del tipo de registro"
* type.display MS
* type.display ^short = "nombre del registro"
* subtype 1..1 MS
* subtype ^short = "Especificacion mas detallada del evento"
* subtype ^definition = "Nivel mayor de profundidad del evento"
* subtype.system 1.. MS
* subtype.system = "http://dicom.nema.org/resources/ontology/DCM" (exactly)
* subtype.code 1.. MS
* subtype.code = #110122 (exactly)
* subtype.code ^short = "Codigo del evento"
* subtype.display MS
* subtype.display ^short = "Nombre del evento"
* action 1.. MS
* action = #"Tipo de accion realizada" (exactly)
* action ^short = "Create| Read/View/Print | Update | Delete | Execute"
* period 1.. MS
* period ^short = "Cuando el evento ocurrio"
* recorded MS
* recorded ^short = "Momento cuando el evento fue guardado"