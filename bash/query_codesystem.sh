#!/usr/bin/env bash

# query_codesystem.sh
#
# after loading HPO with codesystem.sh, this script runs
# various queries to see what actually got loaded.
#
# Chris Roeder, July, 2022


# elemental chlorine
curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --header "Accept-Encoding: gzip"\
  --request GET \
  --data @../fhir-owl/hp.json\
  --output chebi_33431 \
  http://localhost:8080/hapi-fhir-jpaserver/fhir/CodeSystem/$lookup?system=http://purl.obolibrary.org/obo&code=CHEBI_33431
echo $?
