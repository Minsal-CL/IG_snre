Extension: Prod_Comercial
Id: Prod-Comercial
Description: "Recomendación de Medicamento en Producto Comercial"


* extension 0..0
* value[x] only Reference
//* valueReference = Reference(medication)
* valueReference ^short = "Referencia a un recurso medicamento en \"http://api-receta.minsal.cl/v2/medication\""
