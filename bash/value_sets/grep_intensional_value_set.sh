#!/usr/bin/env bash

VALUE_SET_ID=`grep \"id\" ../value_sets/post_intensional_value_set.txt | awk -F: '{print $2}' | sed -r  "s/.*\"(.*)\".*/\\1/"`
echo $VALUE_SET_ID


