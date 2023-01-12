#!/bin/bash
PORT=8001
url=http://localhost:$PORT/fhir/
curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --request POST \
  --data @find-matches.xml\
  --output find-matches.txt \
  $url/CodeSystem/\$find-matches
echo $?

#  $url/CodeSystem/\$find-matches?_format=xml&_pretty=true
