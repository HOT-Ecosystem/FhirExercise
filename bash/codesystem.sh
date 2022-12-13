#!/bin/bash

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --header "Accept-Encoding: gzip"\
  --request POST \
  --data @../fhir-owl/hp.json\
  http://localhost:8080/hapi-fhir-jpaserver/fhir/CodeSystem?_format=json&_pretty=true
echo $?
