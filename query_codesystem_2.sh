#!/usr/bin/env bash

# query_codesystem.sh
#
# after loading HPO with codesystem.sh, this script runs
# various queries to see what actually got loaded.
#
# Chris Roeder, July, 2022


# abnormal sense of smell
  # --header "Accept-Encoding: gzip"\
curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --request GET \
  --output HP_0004408 \
  http://localhost:8080/hapi-fhir-jpaserver/fhir/CodeSystem/$lookup?system=http://purl.obolibrary.org/obo&code=HP_0004408
echo $?

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --request GET \
  --output HP_0004408_2 \
  http://localhost:8080/hapi-fhir-jpaserver/fhir/CodeSystem/$lookup?system=http://purl.obolibrary.org/obo&code=HP:0004408

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --request GET \
  --output HP_0004408_3 \
  http://localhost:8080/hapi-fhir-jpaserver/fhir/CodeSystem/$lookup?system=http://purl.obolibrary.org/obo/HP&code=0004408
