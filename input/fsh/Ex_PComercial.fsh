Extension: Prod_Comercial
Id: Prod-Comercial
Title: "Identificación de un medicamento bajo su marca comercial"
Description: "Indicación de un Medicamento bajo su Marca Comercial"


* extension 0..0
* value[x] only Reference
//* valueReference = Reference(medication)
* valueReference ^short = "Referencia a un recurso medicamento en \"https://api-receta.minsal.cl/v2/Medication\""


/*
Instance: Ejemplo-Curacion-Pie-Diabetico
InstanceOf: Prod-Comercial
Title: "Ejemplo Curacion Pie Diabetico"
Description: "Ejemplo Curacion Pie Diabetico"
Usage: #example
* url = "https://rme.hl7chile.cl/StructureDefinition/Prod-Comercial"
* valueReference.display = "ibupirac LC 400 mg cápsula blanda (Chemopharma)"
* valueReference.reference = "https://apiqa-receta.minsal.cl/v2/Medication/2023101000167118"
*/