#!/bin/bash
# https://build.fhir.org/valueset-example-intensional.json.html

url=http://localhost:$PORT/fhir/

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output value_expand_19014.out \
  --request GET \
  $url/ValueSet/19014/$expand

#  $url/Patient?_format=json&_pretty=true
