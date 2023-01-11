#!/bin/bash
# TODO: only retrieves a single page.
# this is implemented in JS in the TimsUI, and in python in the TSDemoboard notebook for valuesets
url=http://localhost:$PORT/fhir/

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output value_set_all.out \
  --request GET \
  $url/ValueSet

