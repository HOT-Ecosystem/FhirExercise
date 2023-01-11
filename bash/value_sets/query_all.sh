#!/usr/bin/env bash


./post_value_set.sh # POSTs value_set.json, creates log value_set.txt
sleep 5
VALUE_SET_ID=`grep \"id\" post_value_set.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
echo "ValueSet ID is \"$VALUE_SET_ID\""


# potentially useless when very many value sets have been loaded from IGs
# ./query_all_value_sets.sh # GETs query_all_value_sets.json

./query_specific_value_set.sh $VALUE_SET_ID




