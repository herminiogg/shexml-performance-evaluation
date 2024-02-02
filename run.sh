#!/bin/bash

echo "Deleting data from last experiment..."
rm -rf bin
rm -rf generated-data/*
rm data/films_1000_entries.json
rm data/films_1000_entries.xml
rm resultEvaluationInstitutions.txt
rm resultEvaluationJSON.txt
rm resultEvaluationXML.txt

echo "Launching the experiment..."

echo "### JSON ###"
bash runEvaluationForJSON.sh > resultEvaluationJSON.txt

echo "### XML ###"
bash runEvaluationForXML.sh > resultEvaluationXML.txt

echo "### EHRI institutions ###"
bash runEvaluationForEHRIInstitutions.sh > resultEvaluationInstitutions.txt