# FHIR Exercise
This repo is a collection of increasingly involved exercises looking into the FHIR api. It starts with a very low-tech method using cURL and json, and builds up.

## ABSOLUTELY refer to the ACS Page! They show some useful queries! 
https://build.fhir.org/ig/HL7/vulcan-rwd/acs.html


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

### I'm learning...
This is not a relational db. I started out wanting to find patients that a specific condition and was thinking of a query for patients that joins to condition for the filtering criteria. I suspect the way to do this is look for **instances** of the resource Condition that have the type of disease you're interested in, like renal insufficiency, and those will have references of the patients in them.

## JS (TBD) - fire up a headless JavaScript interpreter and use it to tweak the data read in from JSON with minimal coding
The next step might be to code this in JavaScript and use it to read in the python after each step to find the IDs and update the links before uploading the next step. I'd use something like nashorn or V8, a javascript interpreter that runs outside the browser. IIRC these are implemented in java, but that's not the point or necessary.

## Java (TBD) - have a look at how the Phenoppackets folks do this in Java. Do they layer on top of the HAPI JPA? If so, re=order this.


## Java 2 (TBD) - less related, but look at the HAPI-FHIR JPA classes and clarify their relationship to the Resources



