# Control de Cambios
Esta versión contiene las siguientes actualizaciones

## Nuevo Formato de Guía
Se generó un nuevo formato de guía en donde las paginas que se generan ahora son:

* Inicio
* Objetivos
* Generalidades
* Operaciones
* Artefactos
 * General
 * Perfiles
 * Extensiones
 * ValueSets 
* Ejemplos
* Descargas

## Cambios en los Recursos

* Se generó un cambio en el qualifier del Prestador para asignar la definición de especialidad en ese elemento
* Se ajusto el Ientification del Prestador para permitir identificacion por RUN y número RNPI
* Se modifico la estructura de algunos elementos MS del perfil Location
* Se generó mejor texto de definición y comentarios en los perfiles 
* Correcciones menores de formato

## Cambios en los ejemplos
* Se ajustaron los ejemplos a los cambios generados en los perfiles. Esto en especial en el ejemplo del Pestador, del Paciente Nacional y de la Localización

# FHIR_Core_CH
Es el Core Nacional de FHIR en una versión Preliminar 0.8, que se esta preparando para ballot
Este Repositorio se estructura con el contenido dela carpeta que se genera desde Shorthand Sushi, considerando el template, los input, el output de la versión y los archivos básicos para compilar y publicas
Los perfiles generados corresponden a Paciente_CH, Prestador_CH, Medicamento_CH, Organización_CH, Localizacion_CH y Especialidad_CH

# Desarrollo de la Guía
La Guía ha sido desarrollada en **sushi-shothand** y llevada al formato correspondiente mediante el uso de **publisher**. Para esto se requiere pasos de instalación de algunas herramientas

## Instalación
### Paso 1: Instalación de Node.js
Para esto debe descargar https://nodejs.org/ para la versión LTS. Se debe ejecutar el instalable para que este despliegue las configuraciones básicas.

Para asegurar que quedo bien instalado ejecute desde *línea de comando* lo siguiente, lo que devolverá como resultado el núnero de versión

~~~
$ node --version
$ npm --version
~~~

### Paso 2: Instalar Sushi
Desde *línea de comando*

~~~
$ npm install -g fsh-sushi
~~~

Verificar la instalación ejecutando

~~~
$ sushi -h
~~~
### Pasos Adicionales
La instalación de **Node.js** y **sushi** puede implicar la instalación de herramientas para el uso posterior de **publisher**. En particular se puede requerir la instalación de  **GEM-Ruby** https://rubygems.org/pages/download, para de esta forma poder dejar habilitado **Jekyll** https://jekyllrb.com/docs/installation/

También en algunos casos se puede tener problemas en la ejecución de **publisher** vía comando java debido a permisos, por lo que se deben configurar las *variables de ambiente* de **JAVA_HOME** and **PATH**.

## Ejecutando Sushi
Para ejecutar sushi y complilar la GI se debe ejecutar desde el directorio raíz del proyecto

~~~
$ sushi .
~~~

## Ejecutando Publisher
Para publicar la GI en el template por defecto o en que se configure, desde el directorio raiz del proyecto se debe ejecutar:

~~~
$ _genonce
~~~

SUSHI utiliza el contenido de un **package.json** y un directorio **ig-data** creados por el usuario para generar las entradas del **IG Publisher**. Para un IG básico sin personalización, simplemente cree una carpeta **ig-data** vacía. Para un IG personalizado, cree y rellene la carpeta **ig-data** con contenido y configuraciones personalizadas.

## Modificando y agregando nuevas versiones al historial
Dentro de la carpeta history, existe un archivo llamado "history.html", el cual contiene la información relacionada con el historial de versiones publicadas.
En caso de querer agregar nuevas versiones, se debe editar este mismo archivo, y agregar las nuevas entradas.

## Más Información
Para mas información puede navegar por las páginas:

* http://hl7.org/fhir/uv/shorthand/2020May/sushi.html
* http://hl7.org/fhir/uv/shorthand/2020May/tutorial.html
* 
