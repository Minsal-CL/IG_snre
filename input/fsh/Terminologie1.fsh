ValueSet: VSTiposDocClinic
Id: VSTiposDocClinic
Title: "Tipos de Documentos Clínicos"
Description: "Tipos de Documentos clínicos para Composition. Se trae todo Loinc, se requerirá un VS específico"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-21T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system http://loinc.org


ValueSet: VSTiposEncuentroCL
Id: VSTiposEncuentro
Title: "Códigos de Tipos de Encuentro"
Description: "Códigos de Encuentros según Minsal"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-21T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSTiposEncuentroCL

CodeSystem: CSTiposEncuentroCL
Id: CSTiposEncuentro
Title: "Códigos de Tipos de Encuentro"
Description: "Códigos de Encuentros según Minsal"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-21T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #Programmed "Programada"
* #Spontaneous "Espontánea"
* #Committee "Comité"




ValueSet: VSTiposServicioCL
Id: VSTiposServicio
Title: "Tipos de Servicios"
Description: "Tipos de Servicios para encuentro remoto segun CodeSystem local."
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-22T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSCodServicioCL

CodeSystem: CSCodServicioCL
Id: CSCodigoServicio
Title: "Códigos de Servicios para encuentros remotos"
Description: "Códigos para los Servicios realizados en un encuentro remoto según indicaciones del Ministerio de Salud"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-22T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #nutINTA	"Nutrición INTA"
* #nedINTA	"Medicina INTA"
* #medInt	"Medicina Interna"
* #saludMDigital	"Salud Mental Digital"
* #medGen	"Medicina General"
* #derm	"Dermatología"
* #telDiabetes	"Telemedicina Diabetes"
* #telRehab	"Telerehabilitación"
* #otorrin	"Otorrinolaringología"
* #neurInf	"Neurología Infantil"
* #atencUrgAPS	"Atención de Urgencia APS"
* #vih	"VIH"
* #geri	"Geriatría"
* #gine	"Ginecología"

ValueSet: VSContactoSecundario
Id: VSContactosec
Title: "Contacto participantes"
Description: "Contacto telefonico o correo de los participantes"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-25T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* include codes from system ContactPointSystem
	



ValueSet: VSRazonNOencuentroCL
Id: VSRazonNOT
Title: "Razones por la que no se pudieron realizar la atención"
Description: "Razones por la que no se lleva a cabo un encuentro remoto según CodeSystem local."
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-22T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSRazonNOencuentroCL

CodeSystem: CSRazonNOencuentroCL
Id: CSRazonNOT
Title: "Códigos de razones por la cuales el encuentro remoto no se pudo llevar a cabo"
Description: "Códigos de las razones por la cual un encuentro remoto no pudo realizarse según indicaciones del Ministerio de Salud"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-05-22T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #pierdeLlam	"El participante pierde la llamada"
* #finaLlam "El participante finalizó la llamada abruptamente"
* #problConex "El participante tuvo problemas de conexión a internet"
* #medproblConex "Tuve problemas de conexión a internet"
* #otros "Otros / texto libre"


ValueSet: VSTiposVacunasCL
Id: VSTiposVacunas
Title: "Tipos de Vacunas RNI"
Description: "Tipos de Vacunas utilizadas en Chile según CodeSystem local"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-05T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSTiposVacunaCL

CodeSystem: CSTiposVacunaCL
Id: CSCodigoVacunas
Title: "Códigos de Vacunas RNI"
Description: "Códigos de las vacunas o inmunizaciones según indicaciones del Ministerio de Salud"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-05T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #actacelPriv "Actacel (sector privado)"
* #antirr "Antirrábica"
* #antirrPriv "Antirrábica (sector privado)"
* #antitifoInyPriv "Antitifoidea inyectable (sector privado)"
* #bcgMat "BCG MATERNIDAD"
* #bcg_mat "BCG_maternidad"
* #fiebreAmar "Fiebre Amarilla"
* #hep_A "Hepatítis A"
* #hep_A_adult "Hepatitis A adulto"
* #hep_A_adultPriv "Hepatitis A adulto (sector privado)"
* #hep_A_ped "Hepatitis A pediátrica"
* #hep_A_pedPriv "Hepatitis A pediátrica (sector privado)"
* #hep_A-B_adultPriv "Hepatitis A-B adulto (sector privado)"
* #hep_A-B_pedPriv "Hepatitis A-B pediátrica (sector privado)"
* #hep_B_adult "Hepatitis B adulto"
* #hep_B_adultPriv "Hepatitis B adulto (sector privado)"
* #hep_B_dializAdult "Hepatitis B dializados adulto"
* #hep_B_dializPed "Hepatitis B dializados pediátrica"
* #hep_B_ped "Hepatitis B pediátrica"
* #hep_B_pedPriv "Hepatitis B pediátrica (sector privado)"
* #hep_B_maternidad "Hepatitis B_maternidad"
* #herpesZPriv "Herpes Zoster (sector privado)"
* #hexavalent "Hexavalente"
* #hezavalentPriv "Hexavalente (sector privado)"
* #inmAntitetanic "INMUNOGLOBULINA ANTITETANICA"
* #inmAntiVaricela "Inmunoglobulina anti varicela"
* #inmAntirrabica "Inmunoglobulina antirrábica"
* #inmAntirrabicaPriv "Inmunoglobulina antirrábica (sector privado)"
* #inmAntitetanica "Inmunoglobulina Antitetánica"
* #inmEstandarH_A "Inmunoglobulina estandar (Hep. A)"
* #inmEstandarSaramp "Inmunoglobulina estandar (Sarampión)"
* #inmEstandarVaric "Inmunoglobulina estandar (Varicela)"
* #inmHepat_B "Inmunoglobulina Hepatitis B"
* #neumococicaConj10V "Neumocócica conjugada 10V"
* #neomococicaConj10VPriv "Neumocócica conjugada 10V (sector privado)"
* #neumococicaConj13V "Neumocócica conjugada 13V"
* #neumococicaConj13VPriv "Neumocócica conjugada 13V (sector privado)"
* #neumococicaPolisac23V "Neumocócica polisacárida 23V"
* #neumococicaPolisac23VPriv "Neumocócica polisacárida 23V (sector privado)"
* #pentavalente "Pentavalente"
* #polioInactIny "Polio inactivada inyectable"
* #polioInactInyPriv "Polio inactivada inyectable (sector privado)"
* #polioOralBival_boPV "Polio oral bivalente (bOPV)"
* #polioOralTrival "Polio oral trivalente"
* #rotavirus "Rotavirus"
* #rotavirusPriv "Rotavirus (sector privado)"
* #saramp_rube_paper "Sarampión-Rubeóla-Paperas"
* #toxoideDTPriv "Toxoide DT (sector privado)"
* #toxoideDTEscol "TOXOIDE DT ESCOLAR"
* #toxoideDTProfil "TOXOIDE DT PROFILAXIS"
* #vacunaAntiten "VACUNA ANTITETÁNICA"
* #vacunaAntitenPriv "Vacuna Antitetánica (sector privado)"
* #vacunaBCG "VACUNA BCG"
* #vacunaBexsero "VACUNA BEXSERO"
* #vacunaBexseroPriv "VACUNA BEXSERO (Sector privado)"
* #vacunaDPT "VACUNA DPT"
* #vacunadpTaPriv "Vacuna dpTa (sector privado)"
* #vacunadtPa "Vacuna dTpa"
* #vacunaHepat_AyB "VACUNA HEPATITIS A Y B"
* #vacunaHIB "VACUNA HIB"
* #vacunaHIBPriv "Vacuna HIB (sector privado)"
* #vacunaInfluTrival "VACUNA INFLUENZA TRIVALENTE"
* #vacunaMenacPriv "VACUNA MENACTRA (Sector privado)"
* #vacunaMenveo "VACUNA MENVEO"
* #vacunaMenveoPriv "VACUNA MENVEO (Sector privado)"
* #vacunaNeumoco7V "VACUNA NEUMOCOCICA 7 V"
* #vacunaNimenrix "VACUNA NIMENRIX"
* #vacunaNimenrixPriv "VACUNA NIMENRIX (sector privado)"
* #vacunaPoliomielInact "VACUNA POLIOMIELITIS INACTIVADA"
* #vacunaSRPt3VMonodos "VACUNA SRP (TRES VIRICA) MONODOSIS"
* #vacunaSRP3VMultidos "VACUNA SRP (TRES VIRICA) MULTIDOSIS"
* #vacunaSRPTrivMonodos "Vacuna SRP (trivirica) Monodosis"
* #vacunaSRPTrivMultidos "Vacuna SRP (trivirica) Multidosis"
* #varicela "Varicela"
* #varicelaPriv "Varicela (sector privado)"
* #VPHBivalPriv "VPH Bivalente (sector privado)"
* #VPHNonavalPriv "VPH Nonavalente (sector privado)"
* #VPHTetraval "VPH Tetravalente"
* #VPHTretavalPriv "VPH Tetravalente (sector privado)"




ValueSet: VSNombreCampanaCL
Id: VSNombreCampana
Title: "Campañas de vacunación que se realizan según RNI"
Description: "Campañas de Inmunización utilizada en Chile según CodeSystem local"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-05T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSNombreCampanaCL

CodeSystem: CSNombreCampanaCL
Id: CSNombreCampana
Title: "Nombre de Campañas de Inmunización de RNI"
Description: "Códigos de las campañas de vacunas o inmunizaciones según indicaciones del Ministerio de Salud"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-05T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #campanSARSCov_2_AstraZ "Campaña SARS-CoV-2 (AstraZeneca)"
* #campanSARSCov_2_Cansino "Campaña SARS-CoV-2 (CanSino)"
* #campanSARSCov_2_Intern "Campaña SARS-CoV-2 (Internacional)"
* #campanSARSCov_2_Janssen "Campaña SARS-CoV-2 (Janssen)"
* #campanSARSCov_2_Moderna "Campaña SARS-CoV-2 (Moderna)"
* #campanSARSCov_2_Pfizer "Campaña SARS-CoV-2 (Pfizer)"
* #campanSARSCov_2_Sinovac "Campaña SARS-CoV-2 (Sinovac)"
* #campanSRP20_40 "Campaña SRP 20 - 24 años"
* #estratCapullo "Estrategia Capullo"
* #estratCapullo2013 "Estrategia Capullo 2013"
* #estratMeningocócica "Estrategia Meningocócica"
* #hepatiA "Hepatitis A"
* #hepatiA2012 "Hepatitis A 2012"
* #hepatiApost_Terr "Hepatitis A post-terremoto"
* #hepatiAar_Tar_Bio "Hepatitis A, Arica-Tarapacá-Bíobío"
* #hepatiABrote_Conting "Hepatitis A,Brote/Contingencia"
* #influenza2010 "Influenza 2010"
* #influenza2011 "Influenza 2011"
* #influenza2012 "Influenza 2012"
* #influenza2013 "Influenza 2013"
* #influenza2014 "Influenza 2014"
* #influenza2015 "Influenza 2015"
* #influenza2016 "Influenza 2016"
* #influenza2017 "Influenza 2017"
* #influenza2018 "Influenza 2018"
* #influenza2019 "Influenza 2019"
* #influenza2020 "Influenza 2020"
* #influenza2021 "Influenza 2021"
* #influenza2022 "Influenza 2022"
* #sarampRubeoPaperas "Sarampión-Rubeóla-Paperas"
* #SRPCampanSeguim2015 "SRP - Campaña de Seguimiento - 2015"
* #SRPFuncSaludyPuestosFronteriz "SRP - Funcionarios de salud y Puestos Fronterizos"
* #SRPCampanSeguim2020 "SRP- Campaña de seguimiento- 2020"
* #SRPdelViajero "SRP del viajero"
* #tosConvul_brote_conting "Tos Convulsiva Brote-Contingencia"
* #vacunaFiebAmar "Vacuna Fiebre Amarilla"






ValueSet: VSRazonNOTinmCL
Id: VSRazonNOTinm
Title: "Razones por las cuales no se pudo realizar la inmunización"
Description: "Razones por la que no se lleva a cabo la administración de una vacuna o registro de una inmunización según CodeSystem local"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-08T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSRazonNOinmunizacionCL

CodeSystem: CSRazonNOinmunizacionCL
Id: CSRazonNOTinm
Title: "Códigos de razones por las cuales el registro de inmunización no se pudo llevar a cabo"
Description: "Códigos de las razones por la cual el registro de inmunización no pudo realizarse según indicaciones del Ministerio de Salud"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-10T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #solicitudPaci "Solicitud del paciente"
* #otras "Otras"
* #contraindicación "Contraindicación"
* #solicitudPad "Solicitud de los Padres"




ValueSet: VSCodigosServiciosSaludCL
Id: VSCodigosServiciosSalud
Title: "Códigos de Servicos de Salud en Chile"
Description:  "Códigos de Servicios de Salud que existen en Chile"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-10T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSCodSSaludCL

CodeSystem: CSCodSSaludCL
Id: CSCodSSalud
Title: "Códigos del Sistema Nacional de Servicios de Salud"
Description:  "Códigos del Sistema Nacional de Servicios de Salud"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-10T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #SSA "Servicio de Salud Arica"
* #SSAN "Servicio de Salud Antofagasta"
* #SSAT "Servicio de Salud Atacama"
* #SSC "Servicio de Salud Coquimbo"
* #SSVSA "Servicio de Salud Valparaíso-San Antonio"
* #SSVQ "Servicio de Salud Viña del Mar-Quillota"
* #SSAC "Servicio de Salud Aconcagua"
* #SSMN "Servicio de Salud Metropolitano Norte (SSMN)"
* #SSMOC "Servicio de Salud Metropolitano Occidente (SSMOC)"
* #SSMC "Servicio de Salud Metropolitano Central (SSMC)"
* #SSMS "Servicio de Salud Metropolitano Sur (SSMS)"
* #SSMO "Servicio de Salud Metropolitano Oriente (SSMO)"
* #SSMSO "Servicio de Salud Metropolitano Sur Oriente (SSMSO)"
* #SSOH "Servicio de Salud Libertador B. OHiggins"
* #SSM "Servicio de Salud del Maule"
* #SSÑ "Servicio de Salud Ñuble"
* #SSCO "Servicio de Salud Concepción"
* #SSAR "Servicio de Salud Arauco"
* #SST "Servicio de Salud Talcahuano"
* #SSB "Servicio de Salud Bíobío"
* #SSARN "Servicio de Salud Araucanía Norte"
* #SSAS "Servicio de Salud Araucanía Sur"
* #SSV "Servicio de Salud Valdivia"
* #SSO "Servicio de Salud Osorno"
* #SSR "Servicio de Salud Reloncaví"
* #SSCH "Servicio de Salud Chiloé"
* #SSAY "Servicio de Salud Aysén"
* #SSMA "Servicio de Salud Magallanes"

ValueSet: VSCodigoslenguaje
Id: VSCodigoslenguaje
Title: "Codigoslenguaje"
Description:  "Códigos de leguaje"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-10T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSCodigoslenguaje

CodeSystem: CSCodigoslenguaje
Id: CSCodigoslenguaje
Title: "Codigoslenguaje"
Description:  "Codigoslenguaje"
* ^version = "1.0.0"
* ^status = #active
* ^date = "2022-06-10T00:00:00-03:00"
* ^contact.name = "HL7 Chile"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "chair@hl7chile.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #ar-SA "Arabic" "Saudi Arabia, Arabic (Saudi Arabia)"
* #bn-BD "Bangla" "Bangladesh, Bangla (Bangladesh)"
* #bn-IN "Bangla" "India, Bangla (India)"
* #cs-CZ "Czech" "Czech Republic, Czech (Czech Republic)"
* #da-DK "Danish" "Denmark, Danish (Denmark)"
* #de-AT "German" "Austria, Austrian German"
* #de-CH "German" "Switzerland, Swiss German"
* #de-DE "German" "Germany, Standard German (as spoken in Germany)"
* #el-GR "Greek" "Greece, Modern Greek"
* #en-AU "English" "Australia, Australian English"
* #en-CA "English" "Canada, Canadian English"
* #en-GB "English" "United Kingdom, British English"
* #en-IE "English" "Ireland, Irish English"
* #en-IN "English" "India, Indian English"
* #en-NZ "English" "New Zealand, New Zealand English"
* #en-US "English" "United States, US English"
* #en-ZA "English" "South Africa, English (South Africa)"
* #es-AR "Spanish" "Argentina, Argentine Spanish"
* #es-CL "Spanish" "Chile, Chilean Spanish"
* #es-CO "Spanish" "Columbia, Colombian Spanish"
* #es-ES "Spanish" "Spain, Castilian Spanish (as spoken in Central-Northern Spain)"
* #es-MX "Spanish" "Mexico, Mexican Spanish"
* #es-US "Spanish" "United States, American Spanish"
* #fi-FI "Finnish" "Finland, Finnish (Finland)"
* #fr-BE "French" "Belgium, Belgian French"
* #fr-CA "French" "Canada, Canadian French"
* #fr-CH "French" "Switzerland, Swiss French"
* #fr-FR "French" "France, Standard French (especially in France)"
* #he-IL "Hebrew" "Israel, Hebrew (Israel)"
* #hi-IN "Hindi" "India, Hindi (India)"
* #hu-HU "Hungarian" "Hungary, Hungarian (Hungary)"
* #id-ID "Indonesian" "Indonesia, Indonesian (Indonesia)"
* #it-CH "Italian" "Switzerland, Swiss Italian"
* #it-IT "Italian" "Italy, Standard Italian (as spoken in Italy)"
* #jp-JP "Japanese" "Japan, Japanese (Japan)"
* #ko-KR "Korean" "Republic of Korea, Korean (Republic of Korea)"
* #nl-BE "Dutch" "Belgium, Belgian Dutch"
* #nl-NL "Dutch" "The Netherlands, Standard Dutch (as spoken in The Netherlands)"
* #no-NO "Norwegian" "Norway, Norwegian (Norway)"
* #pl-PL "Polish" "Poland, Polish (Poland)"
* #pt-BR "Portugese" "Brazil, Brazilian Portuguese"
* #pt-PT "Portugese" "Portugal, European Portuguese (as written and spoken in Portugal)"
* #ro-RO "Romanian" "Romania, Romanian (Romania)"
* #ru-RU "Russian" "Russian Federation, Russian (Russian Federation)"
* #sk-SK "Slovak" "Slovakia, Slovak (Slovakia)"
* #sv-SE "Swedish" "Sweden, Swedish (Sweden)"
* #ta-IN "Tamil" "India, Indian Tamil"
* #ta-LK "Tamil" "Sri Lanka, Sri Lankan Tamil"
* #th-TH "Thai" "Thailand, Thai (Thailand)"
* #tr-TR "Turkish" "Turkey, Turkish (Turkey)"
* #zh-CN "Chinese" "China, Mainland China, simplified characters"
* #zh-HK "Chinese" "Hond Kong, Hong Kong, traditional characters"
* #zh-TW "Chinese" "Taiwan, Taiwan, traditional characters"