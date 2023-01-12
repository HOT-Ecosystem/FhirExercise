#!/usr/bin/env bash

ORGANIZATION_ID=`grep \"id\" ../basic_data/post_organization.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
PATIENT_1_ID=`grep \"id\" ../basic_data/post_patient_1.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
PATIENT_2_ID=`grep \"id\" ../basic_data/post_patient_2.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
ENCOUNTER_ID=`grep \"id\" ../basic_data/post_encounter.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`

echo "PATIENT $PATIENT_1_ID"
echo "ENCOUNTER $ENCOUNTER_ID"

if (( 1 )) ; then
    ./post_condition.sh $PATIENT_1_ID $ENCOUNTER_ID
    sleep 3

    if [[ `grep ERROR post_condition.txt | wc -l ` > 1 ]]; then
        echo "ERROR with posting condition"
        grep ERROR post_condition.txt 
        exit 1
    fi
fi 
