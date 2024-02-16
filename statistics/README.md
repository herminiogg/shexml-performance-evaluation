# Statistical Analysis
This folder contains the results and the statistical analysis performed for all the inputs used in the experiment.

## Raw data
There three files containing the results of the last experiment execution, one per input:
* [resultEvaluationJSON.csv](resultEvaluationJSON.csv): results for the input films_1000_entries.json
* [resultEvaluationXML.csv](resultEvaluationXML.csv): results for the input films_1000_entries.xml
* [resultEvaluationInstitutions.csv](resultEvaluationInstitutions.csv): results for all the inputs under the folder institutions

## Statistical analysis in R
The statistical analysis was performed in R and it has been documented using RMarkdown. For each input the analysis was conducted separately and it is delivered under three equivalent files: `*.Rmd` source file for R, `*.md` results obtained after executing the R commands in Markdown format, and `*.html` which contains the results after the execution of the R commands but in HTML. Therefore, for each input, the results can be consulted in:

* films_1000_entries.json:
    * [performanceJSONAnalysis.Rmd](performanceJSONAnalysis.Rmd)
    * [performanceJSONAnalysis.md](performanceJSONAnalysis.md)
    * [performanceJSONAnalysis.html](https://herminiogg.github.io/shexml-performance-evaluation/statistics/performanceJSONAnalysis.html)
* films_1000_entries.xml:
    * [performanceXMLAnalysis.Rmd](performanceXMLAnalysis.Rmd)
    * [performanceXMLAnalysis.md](performanceXMLAnalysis.md)
    * [performanceXMLAnalysis.html](https://herminiogg.github.io/shexml-performance-evaluation/statistics/performanceXMLAnalysis.html)
* EHRI institutions:
    * [performanceInstitutionsAnalysis.Rmd](performanceInstitutionsAnalysis.Rmd)
    * [performanceInstitutionsAnalysis.md](performanceInstitutionsAnalysis.md)
    * [performanceInstitutionsAnalysis.html](https://herminiogg.github.io/shexml-performance-evaluation/statistics/performanceInstitutionsAnalysis.html)