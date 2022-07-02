### Operaciones Básicas basada en Métodos 

Las Operaciones que se pueden ejecutar como base en el manejo de recuros en FHIR se especifican desde el mismo estándar  traves de [Resumen de operaciones](https://www.hl7.org/fhir/http.html#summary) 

 Como nota que  _todos_ los requests pueden incluir un opcional `Accept` como cabecera que indica el formato que se debe usar como respuesta (esto incluso se aplica a  `DELETE` dado que una OperationOutcome debe ser devuelta).

<table class="grid">

<tbody>

<tr>

<th>Interacción</th>

<th>Ruta</th>

<th colspan="5">Request</th>

</tr>

<tr>

<th colspan="2"></th>

<th>Método</th>

<th>Content-Type</th>

<th>Body</th>

<th>Prefer</th>

<th>Condcional (si aplica)</th>

</tr>

<tr>

<td>`read`</td>

<td>`/[type]/[id]`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>O: `ETag`, `If-Modified-Since`, `If-None-Match`</td>

</tr>

<tr>

<td>`vread`</td>

<td>`/[type]/[id]/_history/[vid]`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`update`</td>

<td>`/[type]/[id]`</td>

<td>`PUT`</td>

<td>R</td>

<td>Resource</td>

<td>O</td>

<td>O: `If-Match`</td>

</tr>

<tr>

<td>`patch`</td>

<td>`/[type]/[id]`</td>

<td>`PATCH`</td>

<td>R (may be a patch type)</td>

<td>Patch</td>

<td>O</td>

<td>O: `If-Match`</td>

</tr>

<tr>

<td>`delete`</td>

<td>`/[type]/[id]`</td>

<td>`DELETE`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`create`</td>

<td>``/[type]``</td>

<td>POST</td>

<td>R</td>

<td>Resource</td>

<td>O</td>

<td>O: `If-None-Exist`</td>

</tr>

<tr>

<td rowspan="2">`search`</td>

<td>`/[type]?`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`/[type]/_search?`</td>

<td>`POST`</td>

<td>`application/x-www-form-urlencoded`</td>

<td>form data</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`search-all`</td>

<td>`?`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`capabilities`</td>

<td>`/metadata`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`transaction`</td>

<td>`/`</td>

<td>`POST`</td>

<td>R</td>

<td>`Bundle`</td>

<td>O</td>

<td>N/A</td>

</tr>

<tr>

<td>`history`</td>

<td>`/[type]/[id]/_history`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`history-type`</td>

<td>`/[type]/_history`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`history-all`</td>

<td>`/_history`</td>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td rowspan="3">(operation)</td>

<td rowspan="3">`/$[name]`, `/[type]/$[name]` or `/[type]/[id]/$[name]`</td>

<td>`POST`</td>

<td>R</td>

<td>Parameters</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`GET`</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>`POST`</td>

<td>`application/x-www-form-urlencoded`</td>

<td>form data</td>

<td>N/A</td>

<td>N/A</td>

</tr>

</tbody>

</table>

Notas:

*   N/A = no Presente, R = Requerido, O = opcional
*   Para las operaciones definidas en todos los recursos, incluyendo acceso directo al meta elemento, ver  [Resource Operations](http://hl7.org/fhir/resource-operations.html)

La aplicación específica de cada parametro, para cada una de las operaciones, dependen de cada recurso, en en los cuales el estándar especifica cuales se encuentran definidos para cada operción.

<table class="grid">

<tbody>

<tr>

<th>Interacción</th>

<th colspan="6">Respuesta</th>

</tr>

<tr>

<th colspan="1"></th>

<th>Content-Type</th>

<th>Body</th>

<th>Location</th>

<th>Versionado</th>

<th>Status Codes</th>

</tr>

<tr>

<td>`read`</td>

<td>R</td>

<td>R: Resource</td>

<td>N/A</td>

<td>R: `ETag`, `Last-Modified`</td>

<td>`200`, `404`, `410`</td>

</tr>

<tr>

<td>`vread`</td>

<td>R</td>

<td>R: Resource</td>

<td>N/A</td>

<td>R: `ETag`, `Last-Modified`</td>

<td>`200`, `404`</td>

</tr>

<tr>

<td>`update`</td>

<td>R if body</td>

<td>O: Resource (Prefer)</td>

<td>N/A</td>

<td>R: `ETag`, `Last-Modified`</td>

<td>`200`, `201`, `400`, `404`, `405`, `409`, `412`, `422`</td>

</tr>

<tr>

<td>`patch`</td>

<td>R if body</td>

<td>O: Resource (Prefer)</td>

<td>N/A</td>

<td>R: `ETag`, `Last-Modified`</td>

<td>`200`, `201`, `400`, `404`, `405`, `409`, `412`, `422`</td>

</tr>

<tr>

<td>`delete`</td>

<td>R if body</td>

<td>O: OperationOutcome</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`, `202`, `204`, `404`, `405`, `409`, `412`</td>

</tr>

<tr>

<td>`create`</td>

<td>R if body</td>

<td>O : Resource (Prefer)</td>

<td>R</td>

<td>R: `ETag`, `Last-Modified`</td>

<td>`201`, `400`, `404`, `405`, `422`</td>

</tr>

<tr>

<td>`search`</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`, `401`?</td>

</tr>

<tr>

<td>`search-all`</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`, `401`?</td>

</tr>

<tr>

<td>`capabilities`</td>

<td>R</td>

<td>R: CapabilityStatement</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`, `404`</td>

</tr>

<tr>

<td>`transaction`</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`, `400`, `404`, `405`, `409`, `412`, `422`</td>

</tr>

<tr>

<td>`history`</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`</td>

</tr>

<tr>

<td>`history-type`</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`</td>

</tr>

<tr>

<td>`history-all`</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`</td>

</tr>

<tr>

<td>(operation)</td>

<td>R</td>

<td>R: Parameters/Resource</td>

<td>N/A</td>

<td>N/A</td>

<td>`200`</td>

</tr>

</tbody>

</table>

Nota: Esta Tabla lista los códigos de estado, pero otros mas pueden ser descrito por la especificación de HTTP. Códigos adicionales son comunmente errores de servidor y de protocolos de autentificación.

El listado de recursos se define en:

[sitio de recursos de FHIR] (https://hl7.org/FHIR/resourcelist.html)

#### Búsquedas Soportadas

Los Métodos y los parámetros para la consulta de recursos se describen a continuación y se basan en la busqueda sobre recurso Paciente:

1.  En este caso los servidores **DEBEN** soportar buscar un recurso Patient usando el parametro de búsqueda **[`_id`]:

    `GET [base]/Patient[id]`

    Ejemplos

    1.  GET [base]/Patient/1032702
    2.  GET [base]/Patient?_id=1032702

Lo anterior es aplicable para un recurso ya creado el cual se alamacena con una identificación generada en ese momento    

2.  Los servidores **DEBEN** soportar buscar un recurso Patient por un identificador como el numero RUN de la Cédula de Identidad Nacional, utilizando el parámetro de búsqueda **[`identifier`]:

    `GET [base]/Patient?identifier={system|}[code]`

    Ejemplo:

    1.  <table>

        <tbody>

        <tr>

        <td>GET [base]/Patient?identifier=http://minsal.cl/API/Paciente</td>

        <td>|99999999</td>

        </tr>

        </tbody>

        </table>

    

3.  Ejemplos de búsquedas por otros parámetros

    Ejemplo:

    1.  GET [base]/Patient?name=Villanueva

    


#### Agregado de Recursos (Creando Recursos para ser almacenados)

POST [base]/Patient En el Body, un recurso paciente compatible con el/los perfiles definidos core definido en el Core-CL (para este caso sería el perfil Paciente-Cl)

### Terminologia

#### Vocabularios

_Definición de Medicamentos:_ Se utiliza la Terminología de Farmacos Chilena (TFC), expuesta por medio de un servicio de terminolgía Local o desde MINSAL

_Profesionales de la Salud:_ desplegados a travez de la Super Intendencia y el sistema Midas, este registro se expone por medio del recurso  FHIR Practitioner, y la especialidad por medio dek recurso PractitionerRole.

_Establecimientos de Salud_: utiliza su identificación por medio de código DEIS, y su registro se expone a traves de los recursos FHIR Location y Organization, según corresponda.

_Farmacias_: utiliza el registro de farmacias Farmanet y se expone como como los recursos FHIR Location y Organization.

_Pacientes:_ Se identifican por medio de su número identificador que pude ser cualquier tipo de documento especificado en las tablas de HL7 V3 relcionados con identificadores de personas.

_Tablas Maestras específicas:_ se incluyen las de comunas, provincias y regiones, entre otras pertenecientes a la normativa Nacional que son expuestas en la GI y que deben ser en muchos casos levantadas a nivel local