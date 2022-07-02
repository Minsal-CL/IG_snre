### Versión de Desarrollo
<br>

Esta Guía es la continuación de la versión 1.0.0 STU baloteada en diciembre del 2021, y agrega nuevos perfiles, permitiendo ir mejorando las cacacidades de la CORE en función de las nececidades del medio.
### Cómo leer esta Guía
<br>

Esta Guía sigue un formato especificado para **FHIR R4**, y se divide en varias paginas que proporcianan información **General del Core** y la explicacipon técnica de los **Artefactos Generados**. El menú se encuentra en la parte superior en la *barra de menú*.
<br>

* [Home](index.html): Provee la introducción acerca de esta guía.
* [Objetivos](Alcances-Objetivos.html): Describe los objetivos estratégicos de HL7, HL7 Internacional y el como esta guía se engancha con los objetivos estratégicos nacionales y organizacionales.
* [Generalidades](Aspectos-Generales.html): Se especifican algunos conceptos importantes para poder comprender la lectura de los artefactos con el fin de hacer uso de la guía con objetivos de implementación
* Operaciones: Define las operaciones más usadas para el intercambo, manejo, consulta, actualización, etc. de Recursos Generados en un servidor.
* Artefactos: Estas páginas proveen descripciones detalladas y definiciones formales para los artefectos FHIR definidos en la guía.
    * [Perfiles](Perfiles.html): Descripción de los perfiles Core generados para Chile
    * [Extensiones](Extensiones.html): Descripción de todas las extensiones creadas para satisfacer las necesidades nacionales para los perfiles creados
    * [ValueSets](Set-De-Validacion-ValueSets.html): Descripción de los sets de valores creados para poder hacer uso dentro de las necesidades locales de los perfiles creados.
* [Ejemplos](Set-Ejemplos.html): Listado de ejemplos descritos a lo largo de la guía
* [Descargas](Todas-Descargas.html): Schematrones para descarga local 
<br>
<br>


### Perfiles de la Guía
<br>

Cada perfil define los elementos obligatorios mínimos, extensiones y requerimientos terminológicos que **DEBEN** cumplirse. Para cada perfil, estos requerimientos se declaran con un sencillo resumen narrativo.
<br>

Tambien se presenta una tabla jerárquica con una vista lógica del contenido como *Snapshot* y *Differential* . Para cada perfil también expresamos el conjunto de interacciones FHIR Restful asociadas (búsquedas, operaciones u otras interacciones)

* [Paciente_CL](StructureDefinition-CorePacienteCl.html)
* [Prestador_CL](StructureDefinition-CorePrestadorCl.html)
* [Especialidad_Prestador_CL](StructureDefinition-CoreEspecialidadCl.html)
* [Organización_CL](StructureDefinition-CoreOrganizacionCl.html)
* [Medicamento_CL](StructureDefinition-CoreMedicamentoCl.html) 
* [Localización_CL](StructureDefinition-CoreLocalizacionCl.html)
* [Provenance_CL](StructureDefinition-ProvenanceCl.html)
* [Auditoría_CL](StructureDefinition-AuditEventCl.html)
* [Encuetro_CL](StructureDefinition-EncuetroCL.html)
* [Inmunizacion_CL](StructureDefinition-ImmunizationCL.html)
* [Documento_CL](StructureDefinition-DocumentoCl.html)
* [Bundle_CL](StructureDefinition-BundleCl.html)
<br>
<br>

### Requerimientos de Conformidad
<br>
Los requerimientos de conformidad describen las expectativas sobre la funcionalidad de las aplicaciones servidor/cliente, identificando los perfiles específicos y las interacciones que deben implementar. Los perfiles individuales identifican los requerimientos estructurales y terminológicos. Las definiciones de parámetros de búsqueda y operaciones especifican cómo son implementados por los servidores.
<br>
<br>
<br> 

**Autores Primarios: Jorge Mansilla (HL7 Chile), César Galindo (HL7 Chile), Pablo Pizarro (MINSAL), Nicolás Soto (MINSAL)**

Autores Secundarios: Diego Olea (MINSAL), Franco Ulloa (MINSAL)




### Recursos a Disposición
[Ministerio de Salud de Chile] (http://www.minsal.cl)

[Capítulo Chileno de HL7, HL7 Chile](http://hl7chile.cl)

HL7 Internacional (http://hl7.org)

[FHIR R4](http://hl7.org/fhir/)

[FHIR Shorthand Documentation](https://build.fhir.org/ig/HL7/fhir-shorthand) 

[FHIR Shorthand documentation code repository](https://github.com/HL7/fhir-shorthand)

[SUSHI code repository](https://github.com/FHIR/sushi)

[Zulip](https://chat.fhir.org) channel: #shorthand