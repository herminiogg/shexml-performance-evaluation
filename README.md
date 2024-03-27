# ShExML performance optimisation paper: scripts and results
This repository collects the used scripts, resources and results for the ShExML engine performance optimisation paper.

> If you want to see the statistical analysis of the data obtained using these resources you can visit the page [statistics](statistics).

## Running the experiment and directory structure
To run the experiment one can simply run the `run.sh` script:

```
$ bash run.sh
```

Each folder contains the following contents:

* data: it contains the scripts to create the datasets as well as the actual data once created.
* generated-data: it stores the outputs produced by running the mapping rules.
* mapping-rules: the used mapping rules per input are stored here.
* profiler-snapshots: it contains the snapshots extracted from the profiling tool (VisualVM) per input and per engine version that were used for the analysis of the bottlenecks.
* statistics: all the results and analysis related to the statistical analysis are stored here:
    * openRefineSteps: it contains a set of instructions to convert the text output of the experiments to a processable CSV.
    * results: the results once converted to CSV are stored here.
