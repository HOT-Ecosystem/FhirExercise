#!/bin/bash
# ARG for id of value_set to delete

VS_ID=$1
echo "DELETING value set with id \"$VS_ID\""

url=http://localhost:$PORT/fhir/
curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --request DELETE \
  --output delete_value_set.txt \
  $url/ValueSet/$VS_ID

echo "status: $?"
