# FHIR Exercise
This repo is a collection of simple scripts using cURL and json to explore the FHIR API. Bash isn't the prettiest, but I chose it here because the REST API calls are pretty clearly laid out.
BTW, the ACS page has some good queries: https://build.fhir.org/ig/HL7/vulcan-rwd/acs.html


## Goals / Questions (from TSDemoBoard #12)
- How do you query for simple patients, like by name? Patient$match
    - (not done)
- How do you query for patients with a given condition? specific prescribed meds, administered meds?
    - Query for the Condition Resources. They will have links back to the patients. AFAICT, joining back is an application, not data-store (database) thing.
- How do you find (whatever) meds that have been prescribed to a particular patient?
    - Much like the Condition question above, but I need to figure out and test the trail from Patient to Medication.
- Do or can valuesets play into this and how?
    - using the REST API's Search functionality with an "in" search. Like an "in list" in SQL, except that the value set (singular) embodies the list.  (not working yet)

## bash (WIP) - low tech BASH scripts using cURL
A down-in-the-weeds look at the FHIR Restful interface and JSON representations. This is a set of bash scripts containing REST calls using cURL to load data in JSON format. It requires some hands-on effort to link the data elements after loading them when IDs are assigned.  This requires the example set to be small, but makes for a small example that shows the data without having to immediately take on a client codebase as well.

One way to learn from this is to run it  yourself. Since the IDs will be different, after you load each step (organization, patient, encounter, etc.) you have to query for that resource and find the ID assigned. Then link the next level back using those IDs. For example, after organization is inserted, find the ID and edit patient to refer to that organization. Only then, upload the patient.

## TODO
I hope to go further with these exercises, exploring some of the layers on top of FHIR available in either Python or Java.



