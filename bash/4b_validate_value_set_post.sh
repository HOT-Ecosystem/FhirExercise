#!/bin/bash

url=http://localhost:$PORT/fhir/

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output value_set_19009_validate.out \
  --data ../data/4b_validate_value_set_1.json \
  --request POST \
  $url/ValueSet/19014/$validate-code
#?system=http://snomed.info/scti&code=363286005

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output value_set_19014_validate.out \
  --data ../data/4b_validate_value_set_2.json \
  --request POST \
  $url/ValueSet/19014/$validate-code
#?system=http://snomed.info/sct&code=36225005

#  $url/Patient?_format=json&_pretty=true
