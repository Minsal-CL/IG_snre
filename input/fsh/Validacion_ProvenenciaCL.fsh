Profile:        ValidacionProcedenciaCL
Parent:         Provenance
Id:             ValProcCl
Title:          "Validación de la Procedencia de una Receta"
Description:    "Este Perfil describe la forma de validación respecto a la procedencia de una Receta genrada durante un acto clínico."

//Target
* target MS
* target 1..* 
* target ^short = "RequestGroup que se desea validar"
* target ^definition =  "Referencia los RequestGroup generados desde el sistema de prescipción y guardados en el Repositorio de Minsal"
* target.reference 1..1 
* target.reference ^short = "URL absoluta del RequestGrop a validar" 
* target.reference ^definition = "Una referencia a una ubicación en la que se encuentra el otro recurso. La referencia puede ser una referencia relativa, en cuyo caso es relativa a la URL base del servicio, o una URL absoluta que resuelve la ubicación donde se encuentra el recurso. La referencia puede ser específica de la versión o no. Si la referencia no es a un servidor FHIR RESTful, se debe asumir que es específica de la versión. Las referencias a fragmentos internos (que comienzan con ´#´) se refieren a recursos contenidos."
* target.reference ^comment = "El uso de URLs absolutas proporciona un enfoque estable y escalable adecuado para un contexto de nube/web, mientras que el uso de referencias relativas/lógicas proporciona un enfoque flexible adecuado para su uso cuando se comercializa a través de los límites del ecosistema cerrado.   Las URL absolutas no necesitan apuntar a un servidor FHIR RESTful, aunque es el enfoque preferido. Si la URL se ajusta a la estructura ´/[tipo]/[id]´, debe asumirse que la referencia es a un servidor FHIR RESTful."

//Registro
* recorded 1..1 MS
* recorded ^short = "Cuando se desarrollo el envío o actualización del RequestGroup" 
* recorded ^definition = "Instancia de tiempo en que fue notificado el cambio"

//Porque
* activity 0..1 MS
* activity ^short = "Actividad que ocurrió" 
* activity ^definition = "Una actividad es algo que ocurre durante un período de tiempo y actúa sobre o con entidades; puede incluir el consumo, el procesamiento, la transformación, la modificación, la reubicación, el uso o la generación de entidades."
* activity.coding.system from http://hl7.org/fhir/ValueSet/provenance-activity-type (extensible)

//Quien envia

* agent 1..* MS
* agent ^short = "El actor que genera el recuso"
* agent ^definition = "El actor que tiene la responsabilidad en la generación de la Receta"
* agent ^comment = "Puede haber más de un agente como por ejemplo el prescriptor y el sistema de prescripción. Para el Caso se sugiere obligar al actor Prescriptor"

* agent.type 0..1
* agent.type.coding.system from http://hl7.org/fhir/ValueSet/provenance-agent-type (extensible)
* agent.type ^short = "Referencia a lo que ejecuta el actor"
* agent.type ^definition = "participacion del actor, que rol cumple"

* agent.role 0..1 
* agent.role.coding.system from http://hl7.org/fhir/ValueSet/security-role-type (example)
* agent.role ^short = "El rol especifico del agente" 
* agent.role ^definition = "La función del agente con respecto a la actividad. La función de seguridad que habilita al agente con respecto a la actividad."

* agent.who 1..1 MS
* agent.who ^short = "Quien emite la receta"
* agent.who ^definition = "Definición mediate la id de un recurso al emisor de receta"
* agent.who.reference ^short = "Referencia al misor de la Receta"
* agent.who.reference ^definition = "Recurso que indica al practitioner que genera la receta a validar"

* signature 1..1 MS
* signature ^short = "firma del target (Receta)"
* signature ^definition = "Una firma digital en la(s) Referencia(s) de destino. El firmante debe coincidir con un Provenance.agent. Se indica la finalidad de la firma."

* signature.type ^short = "Indicación de la razón por la que la entidad firmó el objeto o los objetos"
* signature.type ^definition = "Indicación del motivo por el que la entidad ha firmado este documento. Puede incluirse explícitamente como parte de la información de la firma y puede utilizarse a la hora de determinar la responsabilidad de diversas acciones relativas al documento."
* signature.type.system from http://hl7.org/fhir/ValueSet/signature-type (preferred)
* signature.type.system ^short = "Sistema de Codificacion para el tipo de firma"
* signature.type.system ^definition = "identificación del tipo de firma por medio de systema definido"

* signature.when 1..1
* signature.when ^short = "Hora y Fecha de cuando se firmó la validacion"
* signature.when ^definition = "Hora y Fecha de cuando se firmó la validacion"

* signature.who 1..1
* signature.who ^short = "Referencia al firmante"
* signature.who ^definition = "Referencia al recurso del validador mediante la firma"

* signature.who.reference ^short = "Referencia al recurso que identifica al  firmante"
* signature.who.reference ^definition = "Referencia al recurso del validador mediante la firma"

* signature.sigFormat MS
* signature.sigFormat ^short = "Formato técnico de la firma"
* signature.sigFormat ^definition = "Un tipo mime que indica el formato técnico de la firma. Los tipos mime importantes son application/signature+xml para X ML DigSig, application/jose para JWS, e image/* para una imagen gráfica de una firma, etc"

* signature.data 1..1 MS
* signature.data ^short = "Contenido de la firma (XML DigSig.JWS, imagem, etc.)"
* signature.data ^definition = "La codificación base64 del contenido de la firma. Si la firma no se registra electrónicamente, este elemento estará vacío."



Instance : EjemplValidacion
Title : "Ejemplo de la Validación de una Receta por medio del Prescriptor"
InstanceOf : ValProcCl
Usage: #example




* target.reference = "http://Repositorio.cl/RequestGroup/RG#12224"

* recorded =  2015-08-27T08:39:24+10:00

* activity.coding.code = #LA
* activity.coding.display = "legally authenticated"

* agent.type.coding.code = #AUT
* agent.type.coding.display = "author"
* agent.who.reference = "http://Practitioner/Prac-author"

* signature.type.code = #1.2.840.10065.1.12.1.1
* signature.when = 2015-08-27T08:39:24+10:00

* signature.who = Reference(Practitioner/Prac-author)

* signature.sigFormat = #application/signature+xml
* signature.data = "Li4u"


