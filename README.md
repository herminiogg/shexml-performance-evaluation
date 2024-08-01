# ShExML performance optimisation paper: scripts and results
[![DOI](https://zenodo.org/badge/751839577.svg)](https://zenodo.org/doi/10.5281/zenodo.10890036)

This repository collects the used scripts, resources and results for the ShExML engine performance optimisation paper.

> If you want to see the statistical analysis of the data obtained using these resources you can visit the page [statistics](statistics).

## Running the experiment and directory structure
To run the experiment one can simply run the `run.sh` script:

```
$ bash run.sh
```

Each folder contains the following contents:

* [data](data): it contains the scripts to create the datasets as well as the actual data once created.
* [generated-data](generated-data): it stores the outputs produced by running the mapping rules.
* [mapping-rules](mapping-rules): the used mapping rules per input are stored here.
* [profiler-snapshots](profiler-snapshots): it contains the snapshots extracted from the profiling tool (VisualVM) per input and per engine version that were used for the analysis of the bottlenecks.
* [statistics](statistics): all the results and analysis related to the statistical analysis are stored here:
    * [openRefineSteps](openRefineSteps): it contains a set of instructions to convert the text output of the experiments to a processable CSV.
    * [results](results): the results once converted to CSV are stored here.
* [sparql-anything-experiment](sparql-anything-experiment): it contains the replication study over the [SPARQL-Anything paper evaluation](https://github.com/SPARQL-Anything/experiments) containing the old versions of the engines as well as the new versions of them.
    * [sparql.anything.experiment](sparql.anything.experiment) it contains the Java code to create the data used in the evaluation
    * [experiment](experiment) it contains the modified version of the SPARQL-Anything experiment. To run this simply use the ```run_all.sh``` that will execute all the experiment including the original onew and the modified one with the new versions of the engines.
