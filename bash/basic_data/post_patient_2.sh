#!/bin/bash
url=http://localhost:$PORT/fhir/
ORG_ID=$1
if [[ $ORG_ID == '' ]] ; then
    echo "ERROR: post_patient_2.sh needs an ID as the first argument, got \"$ORG_ID\""
    exit 1;
fi

sed -r "s/Organization\/XXX/Organization\/$ORG_ID/"  patient_2.json > patient_2_with_org.json

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output post_patient_2.txt \
  --request POST \
  --data @patient_2_with_org.json\
  $url/Patient?_format=json&_pretty=true
echo $?
