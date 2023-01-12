#!/usr/bin/env bash

if (( 1 )) ; then 
   ./post_organization.sh
    sleep 3
fi
ORGANIZATION_ID=`grep \"id\" post_organization.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
echo "Organization: $ORGANIZATION_ID"

if (( 1 )) ; then 
    ./post_patient_1.sh $ORGANIZATION_ID
    sleep 3

    if [[ `grep ERROR post_patient_1.txt | wc -l ` > 1 ]]; then
        echo "ERROR with posting patient 1"
        grep ERROR post_patient_1.txt 
        exit 1
    else 
       PERSON_1_ID=`grep \"id\" post_patient_1.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
       echo "Patient 1: $PERSON_1_ID"
    fi
else
       PERSON_1_ID=`grep \"id\" post_patient_1.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
fi

if (( 1 )) ; then 
    ./post_patient_2.sh $ORGANIZATION_ID
    sleep 3

    if [[ `grep ERROR post_patient_1.txt | wc -l ` > 1 ]]; then
        echo "ERROR with posting patient 1"
        grep ERROR post_patient_1.txt 
        exit 1
    else 
        PERSON_2_ID=`grep \"id\" post_patient_2.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
        echo "Patient 2: $PERSON_2_ID"
    fi
else
        PERSON_2_ID=`grep \"id\" post_patient_2.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
fi

echo "Person 1 id: $PERSON_1_ID"
echo "Person 2 id: $PERSON_2_ID"

if (( 1 )) ; then 
    ./post_encounter.sh $PERSON_1_ID
    sleep 3
    ENCOUNTER_ID=`grep \"id\" post_encounter.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
    echo "ORG $ORGANIZATION_ID"
fi

