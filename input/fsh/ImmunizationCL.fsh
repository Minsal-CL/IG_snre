Profile: ImmunizationCL
Parent: Immunization
Id: ImmunizationCL
Title: "Inmunización CL"
Description: "Definición de un evento de inmunización para las necesidades de interoperabilidad en Chile."


* identifier 0..* MS
* identifier ^short = "Identificador(es) por los que se conoce este registro de Inmunización"
* identifier ^definition = "Es el número de identificación del evento donde a un paciente se le administra una vacuna o registro de inmunización" 

* patient 1..1 MS
* patient only Reference (http://hl7.org/fhir/StructureDefinition/Patient)
* patient ^short = "Quién fue inmunizado"
* patient ^definition = "El paciente que recibió o no recibió la inmunización"

* performer 1..1 MS
* performer ^short = "Quién realizó el evento"
* performer ^definition = "Indica quién realizó el evento de inmunización"
* performer.actor 1..1 MS
* performer.actor only Reference (Practitioner or Organization)
* performer.actor ^short = "Practicante u organización que realizó la acción"
* performer.actor ^definition = "Practicante u organización que realizó la acción"

* programEligibility 0..* MS
* programEligibility ^short = "Indica la elegibilidad de un paciente para un programa de financiamiento"
* programEligibility ^definition = "Indica la elegibilidad de un paciente para un programa de financiamiento"
* programEligibility from http://hl7.org/fhir/ValueSet/immunization-program-eligibility (example)


* vaccineCode ^short = "Vacuna que se administró o se iba a administrar"
* vaccineCode ^definition = "Vacuna que se administró o se iba a administrar. Se proporciona valores que utilizan en el RNI (Registro Nacional de Inmunizaciones)"
* vaccineCode.extension ^short = "Nombre de vacuna administrada"
* vaccineCode.extension contains TiposVacunaCL named type 1..1 

* extension contains NombreCampanaCL named campana 1..1
* extension ^short = "Slice para definir la Campaña de Vacunación correspondiente"

* lotNumber ^short = "Número de lote de la vacuna"
* lotNumber ^definition = "Número de lote del producto de la vacuna"

* expirationDate ^short = "Fecha de caducidad de la vacuna"
* expirationDate ^definition = "Fecha de vencimiento del lote de la vacuna"

* protocolApplied ^short = "Protocolo seguido por el proveedor"
* protocolApplied ^definition = "El protocolo (conjunto de recomendaciones) que sigue el proveedor que administró la dosis"
* protocolApplied.doseNumberString 1..1 MS
* protocolApplied.doseNumberString ^short = "Número de dosis dentro de la serie"

* occurrenceDateTime  1..1 MS
* occurrenceDateTime ^short = "Fecha de administración de la vacuna" 
* occurrenceDateTime ^definition = "Fecha y hora en la que se realiza la inmunización o se administra la vacuna"

* status 1..1 MS
* status ^short = "completed | entered-in-error | not-done"
* status ^definition = "Indica el estado actual del evento de inmunización"

* statusReason 0..1 MS
* statusReason ^short = "Razón de no realizarse la inmunización"
* statusReason ^definition = "Indica la razón por la que no se realizó el evento de inmunización"
* statusReason.extension ^short = "Motivo de no realizar la inmunización"
* statusReason.extension contains RazonNOTinmunizacionCL named statusReason 1..1


* reaction 0..* MS
* reaction ^short = "Detalles de una reacción que proviene de la inmunización"
* reaction.date 0..1 
* reaction.date ^short = "Cuándo comenzó la reacción"
* reaction.date ^definition = "Fecha de reacción a la inmunización"

* location 1..1 MS
* location ^short = "Dónde se produjo la inmunización"
* location ^definition = "El lugar donde se produjo la administración de la vacuna"
* location only Reference (Location)

* location.extension ^short = "Extensión para los Sistemas de Salud, por ejemplo: S.S Viña del mar Quillota"
* location.extension contains ServicioSaludCL named location 1..1 




Extension: TiposVacunaCL
Id: TiposVacunaRNI
Title: "Código de tipos de Vacunas en Chile"
Description: "Esta extensión incluye códigos de los tipos de vacunas que existe en el Registro Nacional de Inmunizaciones RNI"
* value[x] only code
* value[x] ^short = "Código de Tipos de Vacunas"
* valueCode ^short = "Valor de la extensión"
* valueCode from VSTiposVacunas (extensible)




Extension:  NombreCampanaCL
Id: NombreCampana
Title: "Nombre de la Campaña de vacunación establecida por el RNI (Registro Nacional de Inmunizaciones)"
Description: "Esta extensión incluye los nombres de las distintas Campañas que se realizan y estan registradas en el RNI"
* value[x] only code
* value[x] ^short = "Código de las Campañas de Inmunización"
* valueCode ^short = "Valor de la extensión"
* valueCode from VSNombreCampana (extensible)



Extension: RazonNOTinmunizacionCL
Id: RazonNOrealizarseInm
Title: "Razones por las cuales no se pudo realizar la inmunización"
Description: "Esta extensión incluye las razones por la cuales no pudo llevarse a cabo la inmunización" 
* value[x] only code
* value[x] ^short = "Códigos de razones por la cual la inmunización no se pudo realizar"
* valueCode from VSRazonNOTinm (extensible)


Extension: ServicioSaludCL
Id: ServicioSalud 
Title: "Sistema Nacional de Servicios de Salud"
Description: "Esta extensión incluye los codigos de los Servicios de Salud que existen en el país"
* value[x] only code
* value[x] ^short = "Servicios de Salud de Chile"
* valueCode from VSCodigosServiciosSalud (extensible)
