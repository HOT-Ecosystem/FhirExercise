#!/bin/bash

# I want to query for that renal failure condition using one of the two valuesets.
# The trick is an "in" modifier. https://build.fhir.org/search.html#modifierin

url=http://localhost:$PORT/fhir/

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output condition_vs1.out \
  --request GET \
  "$url/Condition?code:in=ValueSet/19009"

#  $url/Patient?_format=json&_pretty=true
