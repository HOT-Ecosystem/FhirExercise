#!/usr/bin/env bash


VALUE_SET_ID=`grep \"id\" post_value_set.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
echo "deleting ValueSet with ID \"$VALUE_SET_ID\""
./delete_value_set.sh $VALUE_SET_ID

rm post_value_set.txt

rm query_all_value_sets.json


