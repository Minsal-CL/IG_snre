// Originally defined on lines 1 - 10
Extension: Prod_Comercial
Parent: Extension
Id: Prod-Comercial
Title: "Identificación de un medicamento bajo su marca comercial"
Description: "Indicación de un Medicamento bajo su Marca Comercial"
* extension 0..0
* value[x] only Reference
* valueReference ^short = "Referencia a un recurso medicamento en \"https://api-receta.minsal.cl/v2/Medication\""
* extension 0..0

