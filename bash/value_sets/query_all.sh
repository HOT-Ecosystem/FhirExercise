#!/usr/bin/env bash


# Create/Upload new value set
./post_value_set.sh # POSTs value_set.json, creates log value_set.txt
sleep 5
VALUE_SET_ID=`grep \"id\" post_value_set.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
echo "ValueSet ID is \"$VALUE_SET_ID\""


# Query for value set by ID
./query_specific_value_set.sh $VALUE_SET_ID


# Expand value set
./expand_value_set.sh $VALUE_SET_ID
CONCEPT_COUNT=`grep -e 36225005 -e 363286005  expand_value_set.out | awk -F: '{print $2}' | sort -u | wc -l `
if (( $CONCEPT_COUNT != 2)) ; then
    echo "ERROR: value set expansion didn't have 2 concepts, rather $CONCEPT_COUNT"
else
    echo "INFO: vlaue set looks OK"    
fi


# Validate concepts
./validate_value_set.sh $VALUE_SET_ID
ERROR_COUNT=`grep "Unknown code" value_set_a.out`
if (( $ERROR_COUNT > 0 )) ; then
    echo "weren't able to validate in value_set_a.out"
else
    echo "value_set_a.out looks OK"
fi

ERROR_COUNT=`grep "Unknown code" value_set_b.out`
if (( $ERROR_COUNT > 0 )) ; then
    echo "weren't able to validate in value_set_b.out"
else
    echo "value_set_b.out looks OK"
fi


# Intensional ValueSet
VALUE_SET_ID=`grep \"id\" post_intensional_value_set.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
post_intensional_value_set.txt
if [[ $VALUE_SET_ID

./expand_value_set.sh $VALUE_SET_ID
### BUG?
### I get an error that says the concept used in the VS definition is loinc, not snomed.
### Using the ui, I can find the concept in SNOMED, and I can see the VS tooo, and it shows the contents are/should-be from SNOMED.
###CONCEPT_COUNT=`grep -e XX -e YY  expand_value_set.out | awk -F: '{print $2}' | sort -u | wc -l `


