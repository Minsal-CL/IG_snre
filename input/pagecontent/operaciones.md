### Operaciones Básicas basadas en Métodos 

Las Operaciones que se pueden ejecutar como base en el manejo de recursos en FHIR se especifican desde el mismo estándar a través de [Resumen de operaciones](https://www.hl7.org/fhir/http.html#summary) 

 Nota: se debe considerar que todos los *requests* pueden incluir un opcional *Accept* como cabecera que indica el formato que se debe usar como respuesta (esto incluso se aplica a  DELETE dado que una OperationOutcome debe ser devuelta).

<table class="grid">

<tbody>

<tr>

<th>Operation</th>

<th>Path</th>

<th colspan="5">Request</th>

</tr>

<tr>

<th colspan="2"></th>

<th>Method</th>

<th>Content-Type</th>

<th>Body</th>

<th>Prefer</th>

<th>Conditional (If apply)</th>

</tr>

<tr>

<td>read</td>

<td>/[type]/[id]</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>O: ETag, If-Modified-Since, If-None-Match</td>

</tr>

<tr>

<td>vread</td>

<td>/[type]/[id]/_history/[vid]</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>update</td>

<td>/[type]/[id]</td>

<td>PUT</td>

<td>R</td>

<td>Resource</td>

<td>O</td>

<td>O: If-Match</td>

</tr>

<tr>

<td>patch</td>

<td>/[type]/[id]</td>

<td>PATCH</td>

<td>R (may be a patch type)</td>

<td>Patch</td>

<td>O</td>

<td>O: If-Match</td>

</tr>

<tr>

<td>delete</td>

<td>/[type]/[id]</td>

<td>DELETE</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>create</td>

<td>/[type]</td>

<td>POST</td>

<td>R</td>

<td>Resource</td>

<td>O</td>

<td>O: If-None-Exist</td>

</tr>

<tr>

<td rowspan="2">search</td>

<td>/[type]?</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>/[type]/_search?</td>

<td>POST</td>

<td>application/x-www-form-urlencoded</td>

<td>form data</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>search-all</td>

<td>?</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>capabilities</td>

<td>/metadata</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>transaction</td>

<td>/</td>

<td>POST</td>

<td>R</td>

<td>Bundle</td>

<td>O</td>

<td>N/A</td>

</tr>

<tr>

<td>history</td>

<td>/[type]/[id]/_history</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>history-type</td>

<td>/[type]/_history</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>history-all</td>

<td>/_history</td>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td rowspan="3">(operation)</td>

<td rowspan="3">/$[name], /[type]/$[name] or /[type]/[id]/$[name]</td>

<td>POST</td>

<td>R</td>

<td>Parameters</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>GET</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

<td>N/A</td>

</tr>

<tr>

<td>POST</td>

<td>application/x-www-form-urlencoded</td>

<td>form data</td>

<td>N/A</td>

<td>N/A</td>

</tr>

</tbody>

</table>

Notas:

*   N/A = no Presente, R = Requerido, O = opcional
*   Para las operaciones definidas en todos los recursos, incluyendo acceso directo al meta elemento, ver  [Resource Operations](resource-operations.html)

La aplicación específica de cada parámetro, para cada una de las operaciones, dependen de cada recurso, en los cuales el estándar especifica cuales se encuentran definidos para cada operación.

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

<td>read</td>

<td>R</td>

<td>R: Resource</td>

<td>N/A</td>

<td>R: ETag, Last-Modified</td>

<td>200, 404, 410</td>

</tr>

<tr>

<td>vread</td>

<td>R</td>

<td>R: Resource</td>

<td>N/A</td>

<td>R: ETag, Last-Modified</td>

<td>200, 404</td>

</tr>

<tr>

<td>update</td>

<td>R if body</td>

<td>O: Resource (Prefer)</td>

<td>N/A</td>

<td>R: ETag, Last-Modified</td>

<td>200, 201, 400, 404, 405, 409, 412, 422</td>

</tr>

<tr>

<td>patch</td>

<td>R if body</td>

<td>O: Resource (Prefer)</td>

<td>N/A</td>

<td>R: ETag, Last-Modified</td>

<td>200, 201, 400, 404, 405, 409, 412, 422</td>

</tr>

<tr>

<td>delete</td>

<td>R if body</td>

<td>O: OperationOutcome</td>

<td>N/A</td>

<td>N/A</td>

<td>200, 202, 204, 404, 405, 409, 412</td>

</tr>

<tr>

<td>create</td>

<td>R if body</td>

<td>O : Resource (Prefer)</td>

<td>R</td>

<td>R: ETag, Last-Modified</td>

<td>201, 400, 404, 405, 422</td>

</tr>

<tr>

<td>search</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>200, 401?</td>

</tr>

<tr>

<td>search-all</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>200, 401?</td>

</tr>

<tr>

<td>capabilities</td>

<td>R</td>

<td>R: CapabilityStatement</td>

<td>N/A</td>

<td>N/A</td>

<td>200, 404</td>

</tr>

<tr>

<td>transaction</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>200, 400, 404, 405, 409, 412, 422</td>

</tr>

<tr>

<td>history</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>200</td>

</tr>

<tr>

<td>history-type</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>200</td>

</tr>

<tr>

<td>history-all</td>

<td>R</td>

<td>R: Bundle</td>

<td>N/A</td>

<td>N/A</td>

<td>200</td>

</tr>

<tr>

<td>(operation)</td>

<td>R</td>

<td>R: Parameters/Resource</td>

<td>N/A</td>

<td>N/A</td>

<td>200</td>

</tr>

</tbody>

</table>

Nota: Esta Tabla lista los códigos de estado, pero otros más pueden ser descrito por la especificación de HTTP. Códigos adicionales son comúnmente errores de servidor y de protocolos de autentificación.

El listado de recursos se define en:

[sitio de recursos de FHIR](https://hl7.org/FHIR/resourcelist.html)

#### Búsquedas Soportadas

Los métodos y parámetros para la consulta de recursos se describen a continuación y se basan en la búsqueda sobre el recurso Paciente:
1.  En este caso los servidores **DEBEN** soportar buscar un recurso *Patient* usando el parámetro de búsqueda **[_id]:

    GET [base]/Patient[id]

    Ejemplos

    1.  GET [base]/Patient/1032702
    2.  GET [base]/Patient?id=1032702

Lo anterior es aplicable para un recurso ya creado, el cual se almacena con una identificación generada en el mismo momento de su generación.
2.  Los servidores **DEBEN** soportar buscar un recurso *Patient* mediante un identificador como el número RUN de la Cédula de Identidad Nacional por ejemplo, utilizando el parámetro de búsqueda **[identifier]:

    GET [base]/Patient?identifier={system|}[code]

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

    


#### Agregando recursos (creando recursos para ser almacenados)

POST [base]/Patient. En el *Body*, un recurso paciente compatible con el/los perfiles definidos en la guía de implementación Core-Cl (para este caso sería el perfil Paciente-CL)

### Terminología

#### Vocabularios

*Definición de Medicamentos*: Se utiliza la Terminología Farmacéutica Chilena (TFC), expuesta por medio de un servicio de terminología Local o desde MINSAL.

Profesionales de la Salud: desplegados a través de la Superintendencia de Salud y el sistema Midas, este registro se expone por medio del recurso FHIR *Practitioner*, y su profesión por medio del recurso *PractitionerRole*.

*Establecimientos de Salud*: utiliza su identificación por medio de código DEIS, y su registro se expone a través de los recursos FHIR *Location* y *Organization*, según corresponda.

*Farmacias*: utiliza el registro de farmacias Farmanet y se expone como los recursos FHIR *Location* y *Organization*.

*Pacientes*: Se identifican por medio de su número identificador que puede ser cualquier tipo de documento, especificado en las tablas de HL7 V3 relacionados con identificadores de personas.

*Tablas Maestras específicas*: se incluyen las de comunas, provincias y regiones, entre otras pertenecientes a la normativa Nacional. Estas son expuestas en la GI y deben ser en muchos casos levantadas a nivel local.
