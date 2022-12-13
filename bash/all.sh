#!/bin/bash
export PORT=8000

./0_organization.sh
sleep 5

./1_patient.sh
sleep 5

./2_encounter.sh

