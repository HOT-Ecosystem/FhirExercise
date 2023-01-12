#!/bin/bash
VALUE_SET_ID=$1
if [[ $VALUE_SET_ID == '' ]] ; then
    echo "ERROR: post_encounter.sh needs an ID as the first argument, got \"$VALUE_SET_ID\""
    exit 1;
fi

# I want to query for that renal failure condition using one of the two valuesets.
# The trick is an "in" modifier. https://build.fhir.org/search.html#modifierin

url=http://localhost:$PORT/fhir/

curl -i \
  --header "Content-Type: application/fhir+json; charset=UTF-8" \
  --header "Accept-Charset: utf-8"\
  --header "User-Agent: HAPI-FHIR/5.0.0 (FHIR Client; FHIR 4.0.1/R4; apache)"\
  --output condition_$VALUE_SET_ID.out \
  --request GET \
  "$url/Condition?code:in=ValueSet/$VALUE_SET_ID"

#  $url/Patient?_format=json&_pretty=true
