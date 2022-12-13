#!/bin/bash

url=http://localhost:$PORT/fhir/

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output condition_2.out \
  --request GET \
  "$url/Condition?code=36225005"

#  "$url/Condition?code=http://snomed.info/sct|36225005"

# code
#      "system" : "http://snomed.info/sct",
#      "code" : "36225005",


#  $url/Patient?_format=json&_pretty=true
