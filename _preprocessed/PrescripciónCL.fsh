// Originally defined on lines 1 - 216
Profile: PrescripcionRecetaCL
Parent: MedicationRequest
Id: RecetaPrescripcionCl
Title: "CL Prescripción"
Description: "Este Perfil describe la información contenida en la Prescripción de un medicamento para el Sistema Nacional de Receta Electrónica del MINSAL"
* identifier MS
* identifier.type MS
* identifier.type.coding MS
* identifier.type.coding.system MS
* identifier.type.coding.code MS
* identifier.type.coding.display MS
* identifier.system MS
* identifier.value MS
* identifier.assigner MS
* identifier.assigner.display MS
* identifier.assigner.reference MS
* status MS
* statusReason MS
* statusReason.coding MS
* statusReason.coding.system MS
* statusReason.coding.code MS
* statusReason.coding.display MS
* statusReason.text MS
* intent MS
* category MS
* category.coding MS
* category.coding.system MS
* category.coding.code MS
* category.coding.display MS
* medicationReference MS
* medicationReference.reference MS
* medicationReference.display MS
* subject MS
* subject.reference MS
* subject.display MS
* authoredOn MS
* requester MS
* requester.reference MS
* requester.display MS
* recorder MS
* recorder.reference MS
* recorder.display MS
* groupIdentifier MS
* groupIdentifier.value MS
* courseOfTherapyType MS
* courseOfTherapyType.coding MS
* courseOfTherapyType.coding.system MS
* courseOfTherapyType.coding.code MS
* courseOfTherapyType.coding.display MS
* note MS
* dosageInstruction MS
* dosageInstruction.text MS
* dosageInstruction.sequence MS
* dosageInstruction.patientInstruction MS
* dosageInstruction.asNeededBoolean MS
* dosageInstruction.timing MS
* dosageInstruction.timing.repeat MS
* dosageInstruction.timing.repeat.frequency MS
* dosageInstruction.timing.repeat.period MS
* dosageInstruction.timing.repeat.periodMax MS
* dosageInstruction.timing.repeat.periodUnit MS
* dosageInstruction.route MS
* dosageInstruction.route.coding MS
* dosageInstruction.route.coding.system MS
* dosageInstruction.route.coding.code MS
* dosageInstruction.route.coding.display MS
* dosageInstruction.method MS
* dosageInstruction.method.coding MS
* dosageInstruction.method.coding.system MS
* dosageInstruction.method.coding.code MS
* dosageInstruction.method.coding.display MS
* dosageInstruction.doseAndRate MS
* dispenseRequest MS
* dispenseRequest.validityPeriod MS
* dispenseRequest.validityPeriod.start MS
* dispenseRequest.validityPeriod.end MS
* dispenseRequest.quantity MS
* dispenseRequest.quantity.value MS
* dispenseRequest.expectedSupplyDuration MS
* dispenseRequest.expectedSupplyDuration.value MS
* dispenseRequest.expectedSupplyDuration.unit MS
* dispenseRequest.expectedSupplyDuration.system MS
* dispenseRequest.expectedSupplyDuration.code MS
* dispenseRequest.performer MS
* dispenseRequest.performer.reference MS
* dispenseRequest.performer.display MS
* priorPrescription.reference MS
* priorPrescription.display MS
* identifier 0..2
* identifier ^short = "Pueden ser 3 tipos de identificación de Receta: Id_Local| Id_Cheque| Id_Receta_Grafica"
* identifier ^definition = "La identificación local puede ser dada localmente, puede ser la de la Receta Cheque o la identificación dada al ser escaneada una receta a papel. En cualquir caso no pueden ir aparejadas una identificación de receta cheque con una de receta gráfica"
* identifier.type ^short = "Identifica el tipo de Prescripción códigos válidos Id_Local| Id_Cheque| Id_Receta_Grafica"
* identifier.type ^definition = "Se consideran 3 códgos externos al ValueSet dado la extensibilidad del binding"
* identifier.type.coding.system ^short = "Identidad del sistema de codificación"
* identifier.type.coding.system ^definition = "Identidad del sistema de codificación"
* identifier.type.coding.code ^short = "Símbolo o sintaxis definida en el sistema"
* identifier.type.coding.code from VSTipoPrescripcion (required)
* identifier.type.coding.display ^short = "Texto representativo del código"
* identifier.system ^short = "Namespace del identificador"
* identifier.system ^definition = "URL sobre la cual se determina el formato y procedencia del valor del identificador"
* identifier.value ^short = "Código Identificador"
* identifier.assigner.display ^short = "Organización en texto libre que dio el numero."
* identifier.assigner.display ^definition = "Organización en texto libre que dio el número identificador. DEBE ser informado en caso que la identificación sea de tipo Local"
* identifier.assigner.display ^short = "Nombre de la organización a la cual se hace la referencia"
* identifier.assigner.display ^short = "Nombre de la organización a la cual se hace la referencia"
* identifier.assigner.reference ^short = "Referencia a la organización que le dio el numero identificador"
* status from http://hl7.org/fhir/ValueSet/medicationrequest-status (required)
* status ^short = "active | on-hold | cancelled | completed | entered-in-error | stopped | draft | unknown código del estado de la receta del medicamento prescrito  (requerido)"
* intent ^short = "\tproposal | plan | order | original-order | reflex-order | filler-order | instance-order | option Intención para la cual es requerido el medicamento (requerido). Se Forzará siempre a order"
* intent from http://hl7.org/fhir/ValueSet/medicationrequest-intent (required)
* intent = #order
* statusReason ^short = "Este dato es Obligatorio condicional a que haya un cambio de estado de la Receta (R2). Es la razón por la cual se cambia el estado de la receta"
* statusReason.coding.system ^short = "Sistema de códigos a ocupar."
* statusReason.coding.code ^short = "Código relacionado al estado."
* statusReason.coding.code from VSStatusReason (extensible)
* statusReason.coding.display ^short = "Descripción del código."
* statusReason.text ^short = "Texto que representa el concepto. Si el código es #otra entonces debe describirse aquí la razón"
* statusReason.text ^definition = "Texto que representa el concepto. Si el código es #otra entonces debe describirse aquí la razón"
* groupIdentifier 1..1
* groupIdentifier.value 1..1
* groupIdentifier ^short = "Número identificador de grupo que debe ser el mismo con el cual se identificaron los fármacos prescritos en el acto clínico. Se genera como un NanoId."
* groupIdentifier ^definition = "Este número vincula el contenedor (RequestGroup) con todos los fármacos prescritos durante la atención del paciente (medicationRequest). Este hará el uso de Receta y el grupo de fármacos co misma identificación grupal. El formato debe ser NanoId."
* groupIdentifier ^comment = "El elemento groupIdentifier de los recursos MedicationRequest generados durante el mismo acto clínico deberán coincidir con el que se genere en el recurso RequestGroup. Este identificador debe ser generado como un valor NanoId."
* groupIdentifier.value ^short = "Identificador de grupo."
* groupIdentifier.value ^definition = "Identificador de grupo."
* category ^short = "Tipo de Acto clínico en el cual se realiza la Prescripción."
* category ^definition = "Se reconoce según la tabla de Hl7 cual es el tipo de acto clínico en el cual se desarrollan las prescripciones"
* category.coding.system ^short = "Namespace para códigos"
* category.coding.system ^definition = "CodeSystem de donde pertenecen los códigos a usar"
* category.coding.code ^short = "Código relacionado"
* category.coding.code ^definition = "Código relacionado"
* category.coding.code from VSCodificacionCategoria (extensible)
* category.coding.display ^short = "Glosa del código"
* category.coding.display ^definition = "Glosa del código según su definición de la tabla de HL7"
* medicationReference 1..1
* medicationReference ^short = "Referencia al medicamento que se prescribe."
* medicationReference ^definition = "Referencia al medicamento que se prescribe, la cual se encuentra disponible en el servicio de la TFC."
* medicationReference.reference ^short = "uri del recurso. Para el caso el repositorio se encuentra en \"https://api-receta.minsal.cl/v2/Medication\""
* medicationReference.display ^short = "Descripción del fármaco, según definición TFC"
* extension contains Prod-Comercial named PComercial 0..
* extension[PComercial] 0..1
* extension[PComercial] MS
* extension ^short = "Determinación del medicamento en Producto Comercial"
* extension ^definition = "Determinación de un medicamento en Producto Comercial. Para eso esta extensión define una Referencia solo a un recurso de medication. "
* subject only Reference(Patient)
* subject ^short = "Referencia al paciente a quien se le prescribe"
* subject ^definition = "La referencia en este caso solo se hace sobre el paciente al cual se le prescribe el fármaco independiente que sea otra la persona que hace retiro de estos"
* subject.reference ^short = "Referencia al recurso del paciente. \"http://api-receta.minsal.cl/v2/Patient\""
* subject.display ^short = "Nombre paciente"
* authoredOn ^short = "Fecha y hora en la cual fue prescrito el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz"
* authoredOn ^definition = "Fecha y hora en la cual fue prescrito el medicamento en formato YYYY-MM-DDThh:mm:ss+zz:zz, e.j. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 o 2017-01-01T00:00:00.000Z"
* requester 1..1
* requester only Reference(Practitioner)
* requester ^short = "Referencia al Prescriptor"
* requester ^definition = "En este caso la referencia será sobre una persona que es Prescritpr  validado por la SIS"
* requester.reference ^short = "Recurso asociado al Prescriptor  \"https://api-receta.minsal.cl/v2/Practitioner\""
* requester.display ^short = "Nombre Prescriptor"
* recorder 0..1
* recorder only Reference(Practitioner)
* recorder ^short = "Referencia a un sujeto, que será el que registra la receta"
* recorder ^definition = "En este caso la referencia será sobre una persona que es un prescriptor validado por la SIS"
* recorder.reference ^short = "Recurso asociado \"http://api-receta.minsal.cl/v2/Practitioner\""
* recorder.display ^short = "Nombre Prescriptor (Registrador)"
* courseOfTherapyType ^short = "Expresa el patrón en la administración del medicamento"
* courseOfTherapyType ^definition = "La descripción del patrón general de la administración del medicamento al paciente."
* courseOfTherapyType.coding.system ^short = "Sistema de códigos a ocupar, se hará uso sel det de valores de hl7 MedicationRequest-course-of-therapy "
* courseOfTherapyType.coding.code ^short = "Código relacionado con el patrón de administración"
* courseOfTherapyType.coding.display ^short = "Descripción del código"
* note ^short = "Texto libre en donde se expresan las instrucciones de como el medicamento debe ser administrado"
* note ^definition = "Información adicional sobre la prescripción que no puede ser transmitida por los otros atributos."
* dosageInstruction 1..*
* dosageInstruction ^short = "Instrucciones del dosaje del medicamento"
* dosageInstruction ^definition = "Indica cómo debe utilizar el paciente el medicamento."
* dosageInstruction.text ^short = "Instucciones en texto libre"
* dosageInstruction.patientInstruction ^short = "Instrucciones adicionales orientadas al paciente"
* dosageInstruction.patientInstruction ^definition = "Instrucciones adicionales orientadas al paciente"
* dosageInstruction.sequence 0..1
* dosageInstruction.sequence MS
* dosageInstruction.sequence ^short = "Secuencia de administracion del medicamento"
* dosageInstruction.sequence ^definition = "Indica el orden en el que se deben aplicar o interpretar las instrucciones de dosificación."
* dosageInstruction.timing.repeat ^short = "Administración del medicamento en temporalidad"
* dosageInstruction.timing.repeat.frequency ^short = "Cantidad de repeticiones"
* dosageInstruction.timing.repeat.frequency ^definition = "El número de veces que se debe repetir la acción dentro del periodo especificado. Si frequencyMax está presente, este elemento indica el límite inferior del rango permitido de la frecuencia."
* dosageInstruction.timing.repeat.period ^short = "Período en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.period ^definition = "Período en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.periodMax ^short = "Periodo máximo en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.periodMax ^definition = "Periodo máximo en el cual se realizan las repeticiones"
* dosageInstruction.timing.repeat.periodUnit ^short = "s | min | h | d | wk | mo | a - unidad de tiempo (UCUM)"
* dosageInstruction.timing.repeat.periodUnit ^definition = "Unidad de tiempo según Unidades de Tiempo definidias en UCUM"
* dosageInstruction.timing.repeat.periodUnit from http://hl7.org/fhir/ValueSet/units-of-time (required)
* dosageInstruction.asNeededBoolean ^short = "Se define para uso de fármaco sin receta o indicación en esta."
* dosageInstruction.asNeededBoolean ^definition = "Para indicar si el fármaco se puede usar sin respetar diretamente lo presctito en el dosaje, como por ejemplo medicamentos que se pueden usar en caso de SOS"
* dosageInstruction.route ^short = "vía por la cual es administrado el medicamento"
* dosageInstruction.route.coding.system ^short = "NameSpace de SNOMED-CT"
* dosageInstruction.route.coding.system ^definition = "NameSpace de SNOMED-CT"
* dosageInstruction.route.coding.code from VSViasAdmin (extensible)
* dosageInstruction.route.coding.code ^short = "Código de la vía por medio de subset de SNOMED-CT"
* dosageInstruction.route.coding.code ^definition = "Código de la vía por medio de subset de SNOMED-CT"
* dosageInstruction.route.coding.display ^short = "Descripción del código"
* dosageInstruction.route.coding.display ^definition = "Descripción del código"
* dosageInstruction.method ^short = "Forma exacta en la que el fármaco ingresa al organismo"
* dosageInstruction.method ^definition = "Forma exacta en la que el fármaco ingresa al organismo. En este caso se define la ruta plausible para vías de administración"
* dosageInstruction.method.coding.system ^short = "NameSpace de los códigos desde VS local. Definir URl Local para validar"
* dosageInstruction.method.coding.system ^definition = "NameSpace de los códigos desde SNOMED-CT."
* dosageInstruction.method.coding.code ^short = "Códigos del Set de Valores definidos desde SNOMED-CT"
* dosageInstruction.method.coding.code ^definition = "Código en SNOMED-CT correspondiente al método"
* dosageInstruction.method.coding.code from VSMetodos (extensible)
* dosageInstruction.doseAndRate.dose[x] only SimpleQuantity or Range
* dosageInstruction.doseAndRate.dose[x] MS
* dosageInstruction.doseAndRate.dose[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* dosageInstruction.doseAndRate.dose[x] ^type[0].extension.valueBoolean = true
* dosageInstruction.doseAndRate.dose[x] ^type[1].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* dosageInstruction.doseAndRate.dose[x] ^type[1].extension.valueBoolean = true
* dispenseRequest 1..1
* dispenseRequest ^short = "Autorización de la dispensación"
* dispenseRequest.validityPeriod 1..1
* dispenseRequest.validityPeriod ^short = "Periodo de validez de la Prescripción"
* dispenseRequest.validityPeriod ^definition = "Periodo de validez de la Prescripción"
* dispenseRequest.validityPeriod.start 1..1
* dispenseRequest.validityPeriod.end 1..1
* dispenseRequest.validityPeriod.start ^short = "Fecha de inicio de la validez de la prescripción. El formato es YYYY-MM-DD"
* dispenseRequest.validityPeriod.end ^short = "Fecha de fin de la validez de la prescripción. El formato es YYYY-MM-DD"
* dispenseRequest.validityPeriod.start ^definition = "Fecha de inicio de la validez de la prescripción. El formato es YYYY-MM-DD"
* dispenseRequest.validityPeriod.end ^definition = "Fecha de fin de la validez de la prescripción. El formato es YYYY-MM-DD"
* dispenseRequest.quantity ^short = "Cantidad de medicamento Dispensado"
* dispenseRequest.quantity.value ^short = "Valor de la cantidad del medicamento Dispensado. Obligatorio para fármaco Controlado"
* dispenseRequest.quantity.value ^definition = "Valor de la cantidad del medicamento Dispensado. Obligatorio para fármaco Controlado"
* dispenseRequest.quantity.value ^comment = "Obligatorio para fármaco Controlado"
* dispenseRequest.expectedSupplyDuration ^short = "Número de días que se espera que alcance lo que se dispensará"
* dispenseRequest.expectedSupplyDuration.value ^short = "Valor de la unidad de duración"
* dispenseRequest.expectedSupplyDuration.unit ^short = "Unidad temporal según UCUM"
* dispenseRequest.expectedSupplyDuration.value ^definition = "Valor de la unidad de duración"
* dispenseRequest.expectedSupplyDuration.unit ^definition = "Unidad temporal según UCUM"
* dispenseRequest.expectedSupplyDuration.system ^short = "Sistema de códigos temprales según UCUM"
* dispenseRequest.expectedSupplyDuration.code ^short = "Código según UCUM"
* dispenseRequest.expectedSupplyDuration.code from http://hl7.org/fhir/ValueSet/age-units (required)
* dispenseRequest.expectedSupplyDuration.system ^definition = "Sistema de códigos temprales según UCUM"
* dispenseRequest.expectedSupplyDuration.code ^definition = "Código según UCUM"
* dispenseRequest.performer ^short = "A quien se intenciona sea el que dispense. Obligatorio en Sector Público"
* dispenseRequest.performer ^definition = "Se debe referenciar a la API disponible. Obligatorio si es prescriptor público"
* dispenseRequest.performer ^comment = "Obligatorio si es prescriptor público."
* dispenseRequest.performer.reference ^short = "Recurso referenciado."
* dispenseRequest.performer.reference ^definition = "Recurso referenciado."
* dispenseRequest.performer.display ^short = "Nombre de la organización a la cual se intenciona sea quien dispense"
* priorPrescription ^short = "Prescripción u orden a la cual esta reemplaza"
* priorPrescription ^definition = "Prescripción u orden a la cual esta reemplaza"
* priorPrescription.reference ^short = "Recurso MedicationDispense que se reemplaza."
* priorPrescription.reference ^definition = "Recurso MedicationDispense que se reemplaza."
* priorPrescription.display ^short = "Detalle de la orden o prescripción a la cual esta reemplaza."

// Originally defined on lines 219 - 233
Extension: CantidadSimpleCL
Parent: Extension
Id: CantidadSimpleCL
Title: "Identificación del Contacto de un Paciente"
Description: "Identificación de contacto de paciente en especial para casos en los cuales este actúa como Tutor Legal"
* extension contains
    valor 0.. and
    sistema 0.. and
    codigo 0..
* extension[valor] 0..1
* extension[valor] MS
* extension[sistema] 0..1
* extension[sistema] MS
* extension[codigo] 0..1
* extension[valor] ^short = "Cantidad de Medicamento a Administrar"
* extension[valor].value[x] only decimal
* extension[sistema] ^short = "NameSpace para el código a usar"
* extension[sistema].value[x] only uri
* extension[codigo] ^short = "Código para la Unidad de la medida"
* extension[codigo].value[x] only Coding
* extension[codigo].valueCoding from VSUnidadAsistencial (required)
* value[x] 0..0
* extension[valor].extension 0..0
* extension[sistema].extension 0..0
* extension[codigo].extension 0..0

// Originally defined on lines 236 - 278
Instance: PrescripcionRecetaCL
InstanceOf: RecetaPrescripcionCl
Title: "Ejemplo Prescripción de Medicamento Oxycodone Vía Oral, una o dos tabletas al día cada 4 o 6 horas, para una solicitud según necesidad con pre-condiciones"
Usage: #example
* identifier.system = "http://recetaelectronica.minsal.cl/validar_tipo_receta"
* identifier.value = "RNCheque-1232"
* status = #active
* intent = #order
* category.coding.system = "http://terminology.hl7.org/CodeSystem/medicationrequest-category"
* category.coding.code = #outpatient
* groupIdentifier.value = "tv829fxi21tqloo5fl2n"
* medicationReference.reference = "https://api-receta.minsal.cl/v2/Medication/Medicamento#1345"
* medicationReference.display = "Oxycodone"
* extension[Prod_Comercial].valueReference.reference = "https://api-receta.minsal.cl/v2/Medication/med#1257"
* extension[Prod_Comercial].valueReference.display = "Oxycontin MR"
* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"
* authoredOn = "2021-06-12"
* requester.reference = "https://api-receta.minsal.cl/v2/Practitioner/PRestador#923421"
* requester.display = "Cecilia Ampuero"
* note.text = "Al paciente se le indicó que lo administrara durante comidas"
* dosageInstruction.text = "Una o dos tabletas cada 4 a 6 horas según necesidad en base a la intensidad del dolor renal"
* dosageInstruction.patientInstruction = "Una o dos tabletas cada 4 a 6 horas según necesidad en base a la intensidad del dolor renal"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.frequencyMax = 2
* dosageInstruction.timing.repeat.period = 4
* dosageInstruction.timing.repeat.periodMax = 6
* dosageInstruction.timing.repeat.periodUnit = #h
* dosageInstruction.route.coding.code = #421521009
* dosageInstruction.route.coding.display = "Tragarlo, instrucciones de dosage imperativas (qualifier value)"
* dosageInstruction.doseAndRate.doseRange.low.value = 1
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"
* dosageInstruction.doseAndRate.doseRange.low.value = 2
* dosageInstruction.doseAndRate.doseRange.low.unit = "Tableta"
* dispenseRequest.validityPeriod.start = "2021-06-12"
* dispenseRequest.validityPeriod.end = "2022-01-12"
* dispenseRequest.quantity.value = 30
* dispenseRequest.expectedSupplyDuration.system = "http://unitsofmeasure.org"
* dispenseRequest.expectedSupplyDuration.value = 10
* dispenseRequest.expectedSupplyDuration.unit = "Day"
* dispenseRequest.expectedSupplyDuration.code = #d

// Originally defined on lines 281 - 308
Instance: PrescripcionRecetaCL-2
InstanceOf: RecetaPrescripcionCl
Title: "Ejemplo de Prescripción de Hidroclorotizida + Valsartán, Prescrito dos veces al día Vía Oral, tragándoselo"
Usage: #example
* identifier.type.coding.code = #Id_Local
* identifier.type.coding.display = "Identificación Local"
* identifier.system = "http://recetaelectronica.minsal.cl/validar_tipo_receta"
* identifier.value = "10101010"
* identifier.assigner.display = "CESFAM COQUIMBO"
* status = #active
* intent = #order
* category.coding.code = #outpatient
* medicationReference = Reference(https://api-receta.minsal.cl/v2/Medication/1703591000167111) "Hidroclorotiazida 25 mg + Valsartán 160 mg comprimido"
* subject = Reference(https://api-receta.minsal.cl/v2/Patient/3254156114) "FELIPE MAURICIO MANCINI RUIZ-TAGLE"
* requester = Reference(https://api-receta.minsal.cl/v2/Practitioner/3253825513) "JUAN JOSÉ ORTEGA CALLEJAS"
* authoredOn = "2021-08-15T17:31:00Z"
* groupIdentifier.value = "64e51a53-97d3-44dc-bbfe-1c8697697763"
* dosageInstruction.sequence = 1
* dosageInstruction.timing.repeat.frequency = 2
* dosageInstruction.timing.repeat.period = 1
* dosageInstruction.timing.repeat.periodUnit = #d
* dosageInstruction.route = http://snomed.info/sct#26643006 "Vía Oral"
* dosageInstruction.method = http://snomed.info/sct#738995006 "Tragar (método de administración)"
* dosageInstruction.doseAndRate.doseQuantity.unit = "Comprimido"
* dosageInstruction.doseAndRate.doseQuantity.value = 2
* dispenseRequest.validityPeriod.start = "2021-08-15"
* dispenseRequest.validityPeriod.end = "2022-08-15"

