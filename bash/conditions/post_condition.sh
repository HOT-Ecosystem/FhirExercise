#!/bin/bash
url=http://localhost:$PORT/fhir/
PATIENT_ID=$1
ENCOUNTER_ID=$2
if [[ $PATIENT_ID == '' ]] ; then
    echo "ERROR: post_condition.sh needs an ID as the first argument, got \"$PATIENT_ID\""
    exit 1;
fi
if [[ $ENCOUNTER_ID == '' ]] ; then
    echo "ERROR: post_condition.sh needs an ID as the second argument, got \"$ENCOUNTER_ID\""
    exit 1;
fi

sed -r "s/Patient\/XXX/Patient\/$PATIENT_ID/"  condition.json  | \
  sed -r "s/Encounter\/XXX/Encounter\/$ENCOUNTER_ID/"   > \
  condition_with_args.json

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output post_condition.txt \
  --request POST \
  --data @condition_with_args.json\
  $url/Condition?_format=json&_pretty=true
echo $?
