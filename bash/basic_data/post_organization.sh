#!/bin/bash
url=http://localhost:$PORT/fhir/
curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output post_organization.txt \
  --request POST \
  --data @organization.json\
    $url/Organization?_format=json&_pretty=true
echo $?
