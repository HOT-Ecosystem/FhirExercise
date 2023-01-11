#!/bin/bash
ID=$1
url=http://localhost:$PORT/fhir/

if [[ $ID == '' ]] ; then
    echo "ERROR: no id provided"
else
    echo "Validating codes in value set with ID \"$ID\"."
    echo ""
    echo  $url/ValueSet/$ID/\$validate-code?system=http://snomed.info/sct\&code=363286005
    echo  $url/ValueSet/$ID/\$validate-code?system=http://snomed.info/sct\&code=36225005

    curl -i \
      --header "Content-Type: application/fhir+json; charset=UTF-8" \
      --header "Accept-Charset: utf-8"\
      --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
      --output value_set_a.out \
      --request GET \
      $url/ValueSet/$ID/\$validate-code?system=http://snomed.info/sct\&code=363286005
   
    sleep 2
 
    curl -i \
      --header "Content-Type: application/fhir+json; charset=UTF-8" \
      --header "Accept-Charset: utf-8"\
      --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
      --output value_set_b.out \
      --request GET \
      $url/ValueSet/$ID/\$validate-code?system=http://snomed.info/sct\&code=36225005
fi    
