#!/bin/bash
# Post an errorneous patient.
# correct one described here: https://hl7.org/fhir/patient.html
# https://hl7.org/fhir/valueset-administrative-gender.html
# https://hl7.org/fhir/valueset-languages.html
# https://hl7.org/fhir/valueset-patient-contactrelationship.html

# So you put in data that doesn't live up to one o the ValueSets and it fails. OK
# Take it a step further and see the value sets in the TimsUI.


url=http://localhost:$PORT/fhir/
ORG_ID=$1
if [[ $ORG_ID == '' ]] ; then
    echo "ERROR: post_patient_erroneous.sh needs an ID as the first argument, got \"$ORG_ID\""
    exit 1;
fi

sed -r "s/Organization\/XXX/Organization\/$ORG_ID/"  patient_erroneous.json > patient_erroneous_with_org.json

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output post_patient_erroneous.txt \
  --request POST \
  --data @patient_erroneous_with_org.json \
  $url/Patient?_format=json&_pretty=true
echo $?

sleep 3
ERROR_COUNT=`grep -i error post_patient_erroneous.txt | wc -l`
if (( $ERROR_COUNT > 0)) ; then
    echo "INFO: got the expected error!"
else
    echo "ERROR ? did not get the expected error!"
fi

