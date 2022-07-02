Profile: EncuentroCL
Parent: Encounter
Id: EncuetroCL
Title: "Encuentro Clínico para Chile"
Description: "Definición de un Encuentro clínico  para las necesidades de interoperabilidad en Chile."


* identifier 0..* MS
* identifier ^short = "Identificador(es) por los que se conoce este encuentro"
* identifier ^definition = "Es el número de identificación del encuentro realizado"

* status 1..1 MS
* status ^short = "planificado | llegado | en curso | triaje en curso | terminado | triaje | cancelado | desconocido | no asistido | NSP"
* status ^definition = "Determina el estado del encuentro remoto conforme a los códigos definidos por el estándar" 

* type 1..* MS
* type ^short = "Tipo específico de Encuentro"
* type ^definition = "Específica el tipo de encuentro que se ha generado de forma remota"
* type.extension ^short = "Tipos de encuentro remoto"
* type.extension ^definition = "Se usa esta extensión para agregar el tipo de Encuentro que se genera de manera remota"
* type.extension contains TiposEncuentroRemotoCL named type 1..1

* serviceType 1..1 MS
* serviceType ^short = "Tipo de servicio que se realiza en el Encuentro"
* serviceType ^definition = "Categorización del servicio que se va a prestar en el encuentro (por ejemplo, servicio de Ginecología)"
* serviceType.extension ^short = "Tipo de servicio que se realiza en el encuentro remoto"
* serviceType.extension contains TiposdeservicioCL named serviceType 1..1 


* reasonCode 1..1 MS
* reasonCode ^short = "Razón codificada por la que tiene lugar el Encuentro"
* reasonCode ^definition = "Razón codificada por la que tiene lugar el Encuentro"
* reasonCode.text 1..1 MS
* reasonCode.text ^short = "Razón por la que tiene lugar el Encuentro"
* reasonCode.extension ^short = "Razones por las cuales NO se realiza el encuentro remoto"
* reasonCode.extension ^definition = "Se usa esta extensión para agregar las razones por las cuales no se pudo llevar a cabo el encuentro remoto"
* reasonCode.extension contains RazonNOTatencionCL named reasonCode 0..1 

* subject 1..1 MS
* subject only Reference (http://hl7.org/fhir/StructureDefinition/Patient)
* subject ^short = "Referencia al paciente del encuentro"
* subject ^definition = "La referencia al paciente que está presente en el encuentro clínico remoto"

* appointment 0..1 MS
* appointment ^short = "Reserva de un evento de atención médica entre paciente(s), profesional(es), persona(s) relacionada(s) y/o dispositivo(s)" 
* appointment ^definition = "Cita o agendamiento médico, la cual es resultado de un encuentro"
* appointment.display 1..1 
* appointment.display ^short = "Descripción de la reserva o cita médica"
* appointment.display ^definition = "Descripción del agendamiento que se realiza en el encuentro remoto, ej: próximo control 3 meses " 


* participant ^slicing.discriminator.type = #value
* participant ^slicing.discriminator.path = "type"
* participant ^slicing.rules = #open
* participant ^slicing.description = "Este slice se genera para diferenciar participantes secundarios vs el participante principal"
* participant ^short = "Participantes involucrados en el encuentro sin considerar al paciente" 

* participant contains partPrincipal 1..1 MS and partSecundario 0..* MS

* participant[partPrincipal] ^short = "Determinación del(os) participante(s) principal(es) del encuentro sin contar el paciente, en este caso el facultativo o medico principal"
* participant[partPrincipal].type 1..1 MS
* participant[partPrincipal].type from http://hl7.org/fhir/ValueSet/encounter-participant-type (required)
* participant[partPrincipal].type ^short = "Rol del participante en el encuentro"
* participant[partPrincipal].type ^definition = "Este slice corresponde al médico encargado de este encuentro, por lo tanto, se fuerza la codificación a intérprete principal"
* participant[partPrincipal].type.coding 
* participant[partPrincipal].type.coding ^short = "Código definido por un sistema terminológico"
* participant[partPrincipal].type.coding.code = #PPRF
* participant[partPrincipal].type.coding.code ^short = "Código del tipo de participante involucrado en el encuentro"

* participant[partPrincipal].extension contains EspecialidadesMedico named especialidad 1..1
* participant[partPrincipal].individual 1..1
* participant[partPrincipal].individual  only Reference (Practitioner)
* participant[partPrincipal].individual ^short = "Médico principal involucrado en el encuentro"


* participant[partSecundario] ^short = "Determinación del(os) participante(s) secundario(s) del encuentro"
* participant[partSecundario].type 1..1 MS
* participant[partSecundario].type from http://hl7.org/fhir/ValueSet/encounter-participant-type (required)
* participant[partSecundario].type ^short = "Rol del participante en el encuentro"
* participant[partSecundario].type ^definition = "Este slice corresponde a los actores secundarios que participan en el encuentro, por lo tanto se fuerza la codificación a intérprete secundario"
* participant[partSecundario].type.coding 
* participant[partSecundario].type.coding ^short = "Código definido por un sistema terminológico"
* participant[partSecundario].type.coding.code = #SPRF
* participant[partSecundario].type.coding.code ^short = "Código del tipo de participante involucrado en el encuentro"

* participant[partSecundario].extension contains ContactopartCL named contact 1..1
* participant[partSecundario].extension ^short = "Contacto de los participantes secundarios"
* participant[partSecundario].extension ^definition = "Contacto de los participantes involucrados en el encuentro, que no sea paciente ni el médico principal "

* diagnosis 1..1 MS
* diagnosis ^short = "Diagnóstico relevante para este encuentro"
* diagnosis ^definition = "Diagnóstico relevante para este encuentro"
* diagnosis.condition ^short = "El diagnóstico o procedimiento relevante para el encuentro"
* diagnosis.condition only Reference (Condition)
* diagnosis.extension contains ObservacionesNotas named Observaciones 0..1

* serviceProvider 1..1 MS
* serviceProvider ^short = "La organización (instalación) responsable de este encuentro"
* serviceProvider only Reference (Organization)

* period 1..1 MS
* period ^short = "La hora de inicio y finalización del encuentro"
* period ^definition = "La hora de inicio y finalización del encuentro"
* period.start 1..1 MS
* period.start ^short = "Hora de inicio"
* period.end 1..1 MS
* period.end ^short = "Hora de finalización"

* length 1..1 MS
* length ^short = "Cantidad de tiempo que duró el encuentro (menos tiempo ausente)"
* length ^definition = "Cantidad de tiempo que duró el encuentro (menos tiempo ausente)"


* extension contains NotasCL named notas 0..1










Extension:  TiposEncuentroRemotoCL
Id: TiposEncuentro
Title: "Código de tipos de encuentro remoto"
Description: "Esta extensión incluye códigos de los tipos de encuentro que se realizan de forma remota"
* value[x] only code
* value[x] ^short = "Código de Tipos de Encuentro"
* valueCode ^short = "Valor de la extensión"
* valueCode from VSTiposEncuentro (extensible)


Extension:  TiposdeservicioCL
Id: TiposServicio
Title: "Código de los tipos de servicio que se atiende"
Description: "Esta extensión incluye códigos de servicios que se entregan de forma remota"
* value[x] only code
* value[x] ^short = "Códigos de Tipos de Servicios de Salud"
* valueCode from VSTiposServicio (extensible)


Extension:  EspecialidadCL
Id: EspecialidadesMedico
Title: "Especialidad del medico principal"
Description: "Esta extensión incluye los codigos de las especialidades que puede tener el medico principal"
* value[x] only code
* value[x] ^short = "Codigo de especialidades"
* valueCode ^short = "Valor de la extensión"
* valueCode from VSEspecialidadesDeisCL (extensible)

Extension:  ContactopartCL
Id: ContactoParticipantes
Title: "Contacto de los participantes secundarios del encuentro"
Description: "Esta extensión incluye los codigos de los medios de contacto que se tiene para los participantes secundarios"
* value[x] only ContactPoint
* value[x] ^short = "Codigo de contactos"
* valueContactPoint.system from VSContactosec 

Extension:  RazonNOTatencionCL
Id: RazonNOrealizarse
Title: "Código de las razones por la cual no se pudo realizar la atención"
Description: "Esta extensión incluye codigos de razones por la cuales no pudo llevarse a cabo el encuentro remoto"
* value[x] only code
* value[x] ^short = "Códigos de razones por la cual el encuentro remoto no se pudo realizar"
* valueCode from VSRazonNOT (extensible)


Extension:  NotasCL
Id: NotasEncuentro
Title: "Notas realizadas en un encuentro por Comite"
Description: "Esta extensión incluye los codigos de los medios de contacto que se tiene para los participantes secundarios"
* value[x] only string
* value[x] ^short = "Notas realizadas en un encuentro por Comite"

Extension:  ObservacionesNotas
Id: ObservacionesDiagnostico
Title: "Observaciones o comentarios simples respecto a un diagnostico"
Description: "Esta extension sirve para insertar comentarios acerca a un diagnostico medico realizado en un encuentro remoto"
* value[x] only string
* value[x] ^short = "Observaciones o comentarios simples de un diagnostico"