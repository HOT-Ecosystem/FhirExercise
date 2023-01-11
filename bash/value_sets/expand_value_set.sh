#!/bin/bash
# https://build.fhir.org/valueset-example-intensional.json.html
ID=$1
url=http://localhost:$PORT/fhir/

if [[ $ID == '' ]] ; then
    echo "need an ID as the first argument"
    exit 1;
fi
echo "$url/ValueSet/$ID/\$expand"
curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output expand_value_set.out \
  --request GET \
  $url/ValueSet/$ID/\$expand

#  $url/Patient?_format=json&_pretty=true
