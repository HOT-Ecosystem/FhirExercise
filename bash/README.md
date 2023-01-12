# FhirExercise


This project has short shell scripts that pretty much run a single 
FHIR API call each using cURL.  The idea is to have as thin a layer
of code over the API calls in FHIR as possible. The last line of the 
cURL call is the API call and looks like what  you'll see in the 
documenation at http://hl7.org/fhir.

The scripts are organized into directories. Scripts in the third,
conditions, depends on resources created by scripts in the first
and second: basic_data and value_sets. Each of these has a script
to run evertying in them, called query_all.sh in each case.

To run them, cd into a directory and ./query_all.sh
The scripts run leave their output log in a text file with a file
name identical to the script name, except has the .txt extension 
instead of .sh. Input data json files have names similar to the script name.

In many cases resources created in one script must be referenced
by resources created in another. The scripts create modified versions
of template json files with values extracted from the output of the
previous process. Look for grep in the scripts to do the extraction, and 
sed to do the modification.



