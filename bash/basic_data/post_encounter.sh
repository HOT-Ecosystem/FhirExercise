#!/bin/bash
url=http://localhost:$PORT/fhir/
PATIENT_ID=$1
if [[ $PATIENT_ID == '' ]] ; then
    echo "ERROR: post_encounter.sh needs an ID as the first argument, got \"$PATIENT_ID\""
    exit 1;
fi

sed -r "s/Person\/XXX/Patient\/$Patient_ID/"  patient_1.json > patient_1_with_org.json

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output post_encounter.txt \
  --request POST \
  --data @encounter.json\
  $url/Encounter?_format=json&_pretty=true
echo $?
