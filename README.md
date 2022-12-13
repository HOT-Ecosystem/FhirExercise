# FHIR Exercise
This repo is a collection of increasingly involved exercises looking into the FHIR api. It starts with a very low-tech method using cURL and json, and builds up.

## bash (WIP) - low tech BASH scripts using cURL
A down-in-the-weeds look at the FHIR Restful interface and JSON representations. This is a set of bash scripts containing REST calls using cURL to load data in JSON format. It requires some hands-on effort to link the data elements after loading them when IDs are assigned.  This requires the example set to be small, but makes for a small example that shows the data without having to immediately take on a client codebase as well.

One way to learn from this is to run it  yourself. Since the IDs will be different, after you load each step (organization, patient, encounter, etc.) you have to query for that resource and find the ID assigned. Then link the next level back using those IDs. For example, after organization is inserted, find the ID and edit patient to refer to that organization. Only then, upload the patient.

## JS (TBD) - fire up a headless JavaScript interpreter and use it to tweak the data read in from JSON with minimal coding
The next step might be to code this in JavaScript and use it to read in the python after each step to find the IDs and update the links before uploading the next step. I'd use something like nashorn, a javascript interpreter that runs outside the browser. (don't quote me, I haven't done this yet, and haven't messed with JS like this in quite a few years (2016?). Stay tuned).

## Java (TBD) - have a look at how the Phenoppackets folks do this in Java. Do they layer on top of the HAPI JPA? If so, re=order this.


## Java 2 (TBD) - less related, but look at the HAPI-FHIR JPA classes and clarify their relationship to the Resources



