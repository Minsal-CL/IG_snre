Profile:        DispensacionMedicamentoCL	
Parent:         MedicationDispense
Id:             DispensacionMedicamentoCl
Title:          "Dispensación_CL"
Description:    "Este Perfil ha sido desarrollado para cubrir las necesidades del Caso de Uso de Receta Electrónica desde la visión de la TFC que se usará para poder manejar farmacos ya registrados, y que deberán ser consultados por los prestadores a la hora de prescribir alguno."

//Identifier
* identifier MS
* identifier 0..1 
* identifier ^short = "Se usará en caso que se realice una dispensación con Id Local"
* identifier ^definition = "Es el numero de Id Local, generado a nivel del dispensador."



* identifier.system ^short = "Se identificará la url de la API sobre la cual se puede consultar por el valor del identificador generado"
* identifier.system MS 
* identifier.system 1..1
* identifier.value ^short = "número identificador"
* identifier.assigner.display ^short = "Se indica el nombre del dispensador que otorgo la identificacion"
* identifier.assigner.display MS

//status
* status MS
* status 1..1
* status ^short = " estado de la dispensación según estándar: cancelled | completed | entered-in-error | declined"
* status ^definition = "Estado de la dispensación, estos estaos pueden ser: preparation | in-progress | cancelled | on-hold | completed | entered-in-error | stopped | declined | unknown"
* status ^comment = "Si bien los códigos para este elemento son mas que los mostrados en esta guía solo se considerarán los expuestos para el caso local"

//statusRasonCodeableConcept
* statusReasonCodeableConcept MS
* statusReasonCodeableConcept ^short = "Razón por la cual no se realizó la dispensación"
* statusReasonCodeableConcept ^definition = "Razón por la cual no se realizó la dispensación, se debe utilizar la tabla definida por MINSAL."

* statusReasonCodeableConcept.coding.system ^short = "Codigos definidos para motivos de rechazo de la dispensacion. Tabla que será generada por MINSAL"
* statusReasonCodeableConcept.coding.system ^definition = "Codigos definidos para motivos de rechazo de la dispensacion. Tabla que será generada por MINSAL"
* statusReasonCodeableConcept.coding.system ^comment = "Tabla que será generada por MINSAL, quedará disponible para que cada sistema la levante localmente y apunte a ella en esta ruta"
* statusReasonCodeableConcept.coding.code ^short = "Codigo referente a la razon de porque no se entrego la dispensacion"
* statusReasonCodeableConcept.coding.system ^short = "Glosa del codigo"
* statusReasonCodeableConcept.text ^short = "Razon de la cancelacion. *Definir si es necesario este texto, ya que en caso de haber codificacion se puede usar display*"


//subject
* subject MS
* subject 1..1
* subject ^short = "Referencia a un sujeto|organización para nuestro caso sera un sujeto. Repositorio es ´https://api-receta.minsal.cl/v2/patient´ (Obligatorio)"
* subject ^definition = "La referencia en este caso solo se hace sobre el paciente al cual se le receta el fármaco independiente que sea otra la persona que hace retiro de estos. Se usa el repositorio ´https://api-receta.minsal.cl/v2/patient´"



//authorizingPrescription
* authorizingPrescription MS
* authorizingPrescription 1..1
* authorizingPrescription ^short = "Referencia a la prescripción que autoriza la dispensación."
* authorizingPrescription ^definition = "Referencia a la prescripción que autoriza la dispensación. esta debe ser referenciada al recurso MedicarionPrescrition involucrado en la receta presentada al momento de la dspensación"
* authorizingPrescription.reference ^short = "Referencia a la receta que autoriza la dispensación. ´https://api-receta.minsal.cl/v2/MedicationPrescription´ (Obligada) "
* authorizingPrescription.reference ^definition = "Referencia a la receta que autoriza la dispensación. esta debe ser referenciada al recurso MedicarionPrescrition involucrado en la receta presentada al momento de la dspensación. ´https://api-receta.minsal.cl/v2/MediationPrescription´ (Obligada)"


//medicationReference
* medicationReference MS
* medicationReference ^short = "Medicamento comercial dispensado. Como repositorio nacional: ´http://api-receta.minsal.cl/v2/medication´ (Obligatorio)"
* medicationReference ^definition = "Medicamento dispenado que obedece al Producto Comercial que fue entregado a quien lo retira. Este se describe mediante el recurso de medicamento desde el reposotorio de estos. Solo se agrega en caso de ser dispensado el medicamento de otra forma no es necesario. El repositorio es ´https://api-receta.minsal.cl/v2/medication´"
* medicationReference ^comment = "Solo se agrega en caso de ser dispensado el medicamento"


//whenHandedOver
* whenHandedOver MS
* whenHandedOver 1..1
* whenHandedOver ^short = "Fecha y hora cuando el medicamento fue dispensado. Formato YYYY-MM-DDThh:mm:ss+zz:zz, ej: 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z"
* whenHandedOver ^short = "Fecha y hora cuando el medicamento fue dispensado. Se debe especificar en formato de fecha según HL7. YYYY-MM-DDThh:mm:ss+zz:zz, ej. 2018, 1973-06, 1905-08-23, 2015-02-07T13:28:17-05:00 or 2017-01-01T00:00:00.000Z."
* whenHandedOver ^comment = "No soporta formato 24 hrs"

//quantity
* quantity MS
* quantity 1..1
* quantity ^short = "Dosis recetada del medicamento"
* quantity ^definition = "Cantidad del medicamento dispensado"

//note
* note MS
* note ^short = "Información sobre la receta"

//dosageInstruction 
//* dosageInstruction
* dosageInstruction MS
* dosageInstruction ^short = "Cómo se debe administrar el medicamento. Este se llena automaticamente al vincularlo con la Prescripción"
* dosageInstruction ^definition = "Si bien se especifica, al momento de vicular el recuso con el recurso MedicationPrescription, este elemento con todas sus rutas se completan de manera automática, por lo que no es deber del dispensador llenar estos campos."
* dosageInstruction ^comment = "Este elemento y todos los que lo desriben se completan de manera automática al vincularse este recucurso conun recurso MedicationRequest"
* dosageInstruction.sequence ^short = "Secuencia de administracion del medicamento"
* dosageInstruction.sequence ^definition = "Indica el orden en el que se deben aplicar o interpretar las instrucciones de dosificación."
* dosageInstruction.text ^short = "Instruccion de dosificación"
* dosageInstruction.additionalInstruction ^short = "Instrucciones, advertencias y/o efectos secundarios"
* dosageInstruction.patientInstruction ^short = "Instrucciones para el paciente"
* dosageInstruction.patientInstruction ^definition = "Instrucciones con detalle o lenguaje que los pacientes puedan comprender"
* dosageInstruction.timing ^short = "Cuando se debe administrar los medicamentos"

* dosageInstruction.asNeededBoolean ^short = "En caso de SOS, se usa, considerar este valor como booleano"
* dosageInstruction.route ^short = "Como se debe administrar el medicamento (Via de administración o como debe el farmaco entrar al cuerpo)"
* dosageInstruction.method ^short = "Tecnica para administrar el medicamento"
* dosageInstruction.method ^definition = "Es un valor codificado que indica el método mediante el cual se introduce el medicamento en el cuerpo o sobre él. Más comúnmente utilizado para inyecciones. Por ejemplo, empuje lento; Profundo IV."
* dosageInstruction.doseAndRate ^short = "Cantidad de los medicamentos a administrar"

//performer
* performer MS
* performer 1..2
* performer ^slicing.discriminator.type = #value
* performer ^slicing.discriminator.path = "function.coding.code"
* performer ^slicing.rules = #closed

* performer contains
	Dispensador 1..1 and Validador 0..1

* performer ^short = "Profesional que realizó la orden."
* performer ^comment = "Se definen dos tipos de dispensador, no excluyentes mutuamente. El primero es el dispensador del fármaco pero el segundo es el validador. El dispensador es obligado. Ambos son iguales desde el punto de vista del desarrollo de cada slice es el mismo solo debe cambiar el valor del código del la ruta performer.function.code"

* performer[Dispensador] MS
* performer[Dispensador] ^short = "Aquel individuo que realiza la entega de medicamentos"
* performer[Dispensador] ^definition = "Se entiende por dispensador al individuo que entrega los medicamentos a quien los solicite en el punto de entrega. Simpre el en proceso de dispensación existe un dispensador"

* performer[Dispensador].function 1..1
* performer[Dispensador].function ^short = "Función que desarrolla el Performer, en este caso dispensador"
* performer[Dispensador].function ^definition = "Función que desarrolla el Performer, en este caso dispensador"
//* performer[Dispensador].function.coding.system ^short = "Sistema sobre el cual se obtiene el código de tipo de dispensador"
//* performer[Dispensador].function.coding.system ^definition = "Sistema sobre el cual se obtiene el código de tipo de dispensador, en este caso será una tabla local"
//* performer[Dispensador].function.coding.system ^comment = "La tabla quedará disponible por MINSAL para que los desarrolladores la puedan levantar localmente"
* performer[Dispensador].function.coding.code ^short = "Código del tipo de dispensador. Debe ser 01 para el Dispensador Obligado"
* performer[Dispensador].function.coding.code ^definition = "Código del tipo de dispensador según tabla maestra. En este caso debe ser 01"
* performer[Dispensador].function.coding.code = #Dispensador

* performer[Dispensador].actor ^short = "Profesional que realiza la dispensación. El endPoint es ´http://api-receta.minsal.cl/v2/practitioner´ "
* performer[Dispensador].actor.reference ^short = "La referencia del recurso especificado debe ser al endPoint ´http://api-receta.minsal.cl/v2/practitioner´"
* performer[Dispensador].actor.reference ^definition = "La referencia del recurso especificado debe ser al endPoint ´http://api-receta.minsal.cl/v2/practitioner´. En el caso nacional el dispensador estaría dentro de los recucursos desarrollados para Prestadores"


* performer[Validador] MS
* performer[Validador] ^short = "Aquel individuo que realiza la validaciín ante la entega de medicamentos"
* performer[Validador] ^definition = "Se entiende por dispensador al individuo que valida la entrega los medicamentos a quien los solicite en el punto de entrega. Por lo común es un Químico Farmaceutico de Profesión"

* performer[Validador].function 1..1
* performer[Validador].function ^short = "Función que desarrolla el Validador, en este caso siempre será un QF"
* performer[Validador].function ^definition = "Función que desarrolla el Performer, en este caso validador"
//* performer[Validador].function.coding.system ^short = "Sistema sobre el cual se obtiene el código de tipo de performer"
//* performer[Validador].function.coding.system ^definition = "Sistema sobre el cual se obtiene el código de tipo de performer, en este caso será una tabla local"
//* performer[Validador].function.coding.system ^comment = "La tabla quedará disponible por MINSAL para que los desarrolladores la puedan levantar localmente"
* performer[Validador].function.coding.code ^short = "Código de validador. Debe ser 02 para definir un validador"
* performer[Validador].function.coding.code ^definition = "Código de validador según tabla maestra. En este caso debe ser 02"
* performer[Validador].function.coding.code = #Validador

* performer[Validador].actor ^short = "Profesional que realiza la validación. El endPoint es ´http://api-receta.minsal.cl/v2/practitioner´ "
* performer[Validador].actor.reference ^short = "La referencia del recurso especificado debe ser al endPoint ´http://api-receta.minsal.cl/v2/practitioner´"
* performer[Validador].actor.reference ^definition = "La referencia del recurso especificado debe ser al endPoint ´http://api-receta.minsal.cl/v2/practitioner´. En el caso nacional el dispensador estaría dentro de los recucursos desarrollados para Prestadores"


//localización

* location 1..1
* location MS
* location ^short = "Ubicación Georeferenciada de la dispensación"
* location ^definition = "La ubicación física principal en la cual se desarrolló la dispensación"
* location.reference ^short = "Identificación del recurso de lcalización de los dispensadores. ´https://api-receta.minsal.cl/v2/location´ (Obligatoria)"
* location.reference ^definition = "El repositorio Central tendrá listda la ubicación de todos los dispensadores en recurso location. Estas deberán ser alcanzadas desde ´https://api-receta.minsal.cl/v2/location´ (Obligatoria)"

//receiver
* receiver MS
* receiver 0..1

* receiver ^short = "Persona a la cual se le hace entrega de los fármacos."
* receiver.display ^short = "Se debe  escribir el nombre y apellido de quien recibe el medicamento "
* receiver.display ^definition = "Se define el nombre y apellido de quien recibe el medicamento. Este elemento si bien no es obligatorio debería serlo en el servicio público y solo en caso que quien recibe el medicamento no sea el paciente sobre el cual fueron recetados "
* receiver.display ^comment = "Debe ser obligatorio en dispensaciones realizadas en el sector de salud Público"


//"Profesional quien hizo la receta. La manera correcta de hacer la referencia es referenciando a la API de MINSAL, mas el identificador del médico (https://api.receta.minsal.asimov.cl/practitioner)"

//location
//* location MS
//* location ^short = "Referencia a la geo-localizacion del dispensador de los medicamentos"

//detectedIssue
* detectedIssue  and detectedIssue.display MS
* detectedIssue ^short = "Evento adverso detectado como contraindicación al farmaco dispensado"
* detectedIssue ^definition = "Indica un problema clinico real o potencial, con acciones clinicas posibles, por ejemplo, una interaccion farmaco-farmaco, doble dosis de medicamentos, etc."
* detectedIssue.display ^short = "Texto libre que describe el potencial evento adverso o contraindicación"
* detectedIssue.display ^definition = "Texto libre que describe el potencial evento adverso o contraindicación. Por momento solo se considera la redacción en texto libre de este campo"



Instance : DispensacionMedicamentoCL
Title : "Ejemplo de la dispensacion del Medicamento Oxycodone Via Oral"
InstanceOf : DispensacionMedicamentoCl	

//////////////////
* identifier.system = "http://minsal.cl/portalReceta/dispensacion"
* identifier.value = "Dispensacion-001"

//////////////////
* status = #completed

//////////////////
* statusReasonCodeableConcept.coding.system = "http://minsal.cl/razon-de-no-dispensacion"
* statusReasonCodeableConcept.coding.code = #1123654
* statusReasonCodeableConcept.coding.display = "medicamento agotado"

//////////////////
* medicationReference.reference = "https://api-receta.minsal.cl/v2/medication/Med#22353"

//////////////////
//* performer[Dispensador].function.coding.system = "http://farmaciaLocal.cl/api-R/Tablas/TablaFunc"
* performer[Dispensador].function.coding.code = #Dispensador
* performer[Dispensador].function.coding.display = "Vendedor"
* performer[Dispensador].actor.reference = "https://api-receta.minsal.cl/v2/practitioner/Di#14785214"
* performer[Dispensador].actor.display = "Juan Bastidas"
//* performer[Dispensador].function.text = "Dispensador de la Prescripción"

//* performer[Validador].function.coding.system = "http://farmaciaLocal.cl/api-R/Tablas/TablaFunc"
* performer[Validador].function.coding.code = #Validador
* performer[Validador].function.coding.display = "Químico Farmaceutico"
* performer[Validador].actor.reference = "https://api-receta.minsal.cl/v2/practitioner/Di#245993"
* performer[Validador].actor.display = "Sofia Galindo"
//* performer[Validador].function.text = "Validador de la Prescripción Dispensada"

//////////////////
* subject.reference = "https://api-receta.minsal.cl/v2/Patient/Paciente#2411224"
* subject.display = "Patricio Perez"



////////////////////////
* location.reference = "https://api-receta.minsal.cl/v2/location/145874"

///////////////////////
* authorizingPrescription.reference = "https://api-receta.minsal.cl/v2/medicationReference/Pres#1321"



/////////////////////
* whenHandedOver = "2020-01-10T16:22:12-04:00"

//////////////////////
* quantity.value = 1
* quantity.system = "http://unitsofmeasure.org"
//* quantity.code = "mL"

/////////////////////
* note.text = "El medicamento solo se receta en caso de dolor extremo y cuando este persista por mas de 10 dias"

* dosageInstruction.sequence = 1
* dosageInstruction.text = "una-dos pastillas cada 4-6 horas en caso de aumento de dolor"
* dosageInstruction.additionalInstruction.coding.system = "http://snomed.info/sct"
* dosageInstruction.additionalInstruction.coding.code = #418639000
* dosageInstruction.additionalInstruction.coding.display = "Advertencia. Puede provocar somnolencia. Si le afecta no conduzca ni maneje maquinaria. Evitar las bebidas alcohólicas (valor calificativo)"
* dosageInstruction.patientInstruction = "Tomar una o dos pastillas cada 4-6 horas en caso de aumento de dolor"
* dosageInstruction.timing.repeat.frequency = 1
* dosageInstruction.timing.repeat.period = 4
* dosageInstruction.timing.repeat.periodMax = 6
* dosageInstruction.timing.repeat.periodUnit = #h

* dosageInstruction.asNeededBoolean = false

* dosageInstruction.route.coding.system = "http://snomed.info/sct"
* dosageInstruction.route.coding.code = #26643006
* dosageInstruction.route.coding.display = "Ruta Oral"
* dosageInstruction.method.coding.system = "http://snomed.info/sct"
* dosageInstruction.method.coding.code = #421521009
* dosageInstruction.method.coding.display = "Tragarsela - imperativo contar con información de dosaje (qualifier value)"
* dosageInstruction.doseAndRate.type.coding.system = "http://terminology.hl7.org/CodeSystem/dose-rate-type"
* dosageInstruction.doseAndRate.type.coding.code =  #ordered
* dosageInstruction.doseAndRate.type.coding.display =  "Ordered"
* dosageInstruction.doseAndRate.doseRange.low.value = 1.0
* dosageInstruction.doseAndRate.doseRange.low.unit = "TAB"
* dosageInstruction.doseAndRate.doseRange.low.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
* dosageInstruction.doseAndRate.doseRange.low.code = #TAB
* dosageInstruction.doseAndRate.doseRange.high.value = 2.0 
* dosageInstruction.doseAndRate.doseRange.high.unit = "TAB"
* dosageInstruction.doseAndRate.doseRange.high.system = "http://terminology.hl7.org/CodeSystem/v3-orderableDrugForm"
* dosageInstruction.doseAndRate.doseRange.high.code = #TAB
