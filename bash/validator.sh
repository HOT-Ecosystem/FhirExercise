#!/usr/bin/env bash
# https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator#UsingtheFHIRValidator-Downloadingthevalidator

if [[ ! -f validator_cli.jar ]] ; then
    wget https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar
fi


if (( 0 )) ;then
    echo "First example shows how to validate against the base spec."
    wget http://hl7.org/fhir/patient-example.xml 
    java -jar validator_cli.jar  patient-example.xml -version 3.0 -html-output first.html
    open first.html
fi


if (( 0 )); then
    echo "Second example shows how to validate against a profile in the spec:"
    wget http://hl7.org/fhir/observation-example-heart-rate.xml -O obs-ex.xml
    java -jar validator_cli.jar \
      obs-ex.xml \
      -version 4.0 \
      -profile http://hl7.org/fhir/StructureDefinition/heartrate \
      -html-output second.html
    open second.html
fi


if (( 0 )); then
    echo "Third example shows how to validate against a profile in an implementation guide:"
    #   Error @ Observation (line 1, col80): Specified profile type was 'Patient' in profile 'http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient|6.0.0-ballot', but found type 'Observation'
    wget http://hl7.org/fhir/observation-example-heart-rate.xml -O obs-ex.xml
    java -jar validator_cli.jar \
      obs-ex.xml \
      -version 3.0 \
      -ig http://hl7.org/fhir/us/core \
      -profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient \
      -html-output third.html
    open third.html
fi


if (( 1 )); then
    echo "Local example tries that erroneous file"
    # depends on an updated file with an existing organization
    java -jar validator_cli.jar \
       basic_data/patient_erroneous_with_org.json \
      -version 3.0 \
      -html-output local.html \
      #-ig http://hl7.org/fhir/us/core \
      #-profile http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient \

    open local.html

fi

