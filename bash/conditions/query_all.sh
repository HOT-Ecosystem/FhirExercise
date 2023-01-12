#!/usr/bin/env bash

ORGANIZATION_ID=`grep \"id\" ../basic_data/post_organization.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
PATIENT_1_ID=`grep \"id\" ../basic_data/post_patient_1.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
PATIENT_2_ID=`grep \"id\" ../basic_data/post_patient_2.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
ENCOUNTER_ID=`grep \"id\" ../basic_data/post_encounter.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`

echo "PATIENT $PATIENT_1_ID"
echo "ENCOUNTER $ENCOUNTER_ID"


if (( 0 )) ; then
    ./post_condition.sh $PATIENT_1_ID $ENCOUNTER_ID
    sleep 3

    if [[ `grep ERROR post_condition.txt | wc -l ` > 1 ]]; then
        echo "ERROR with posting condition"
        grep ERROR post_condition.txt 
        exit 1
    fi
fi 

# OK
VALUE_SET_ID=`../value_sets/grep_value_set.sh`
./query_condition_w_vs.sh $VALUE_SET_ID

# failing with that weird bug where it thinks the snomed code is from LOINC
#INTENSIONAL_VALUE_SET_ID=`../value_sets/grep_intensional_value_set.sh`
#./query_condition_w_vs.sh $INTENSIONAL_VALUE_SET_ID
