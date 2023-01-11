#!/bin/bash
url=http://localhost:$PORT/fhir/

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --request POST \
  --data @value_set_intensional.json\
  --output value_set_intensional.txt \
  $url/ValueSet?_format=json&_pretty=true

echo $?
