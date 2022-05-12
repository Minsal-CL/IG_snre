## sdfsdfsdfsdfsdfsdfdfsdfsfsd
## Esto es un mensaje para JORGE
<br>
<br>

### No hacer trampas con el Rubik
<br>

Es importante hacer el rubik sin un tutorial
This profile sets minimum expectations for the resource to record, search, and fetch pediatric weight for height and age observations associated with a patient. It is based on the [US Core Vital Signs Profile] and identifies the *additional* mandatory core elements, extensions, vocabularies and value sets which **SHALL** be present in the Observation resource when using this profile.

**Example Usage Scenarios:**

The following are example usage scenarios for the US Core Pediatric Weight for Height Observation Profile:

- Query for pediatric weight observations belonging to a pediatric patient
- [Record or update] pediatric weight observations belonging to a pediatric patient

### Mandatory and Must Support Data Elements

*In addition* to the mandatory and must support data elements in the US Core Vital Signs Profile, the following data-elements must always be presentd if the data is present in the sending system ([Must Support] definition). They are presented below in a simple human-readable explanation. Profile specific guidance and examples are provided as well.  The [Formal Profile Definition] below provides the  formal summary, definitions, and terminology requirements.  The "Snapshot Table (Must Support)" tab below displays all the mandatory and must support data elements for this profile and the those inherited from the US Core Vital Signs Profile.  Note that this profile also conforms to the base FHIR [Vital Signs Profile].

**Each Observation must have:**

1. a patient
1. a fixed code for pediatric weight for height and age measurement

**Each Observation must support:**

1.  a result value

**Profile specific implementation guidance:**
