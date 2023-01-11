#!/bin/bash
ID=$1
url=http://localhost:$PORT/fhir/

if [[ $ID == '' ]] ; then
    echo "need an ID as the first argument"
    exit 1;
fi
echo "QUERYING for id \"$ID\""

if [[ $ID == '' ]] ; then
    echo "need an ID as the first argument"
else
    curl -i \
      --header "Content-Type: application/fhir+json; charset=UTF-8" \
      --header "Accept-Charset: utf-8"\
      --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
      --output query_specific_value_set.out \
      --request GET \
      $url/ValueSet/$ID
    
    echo $?
fi
