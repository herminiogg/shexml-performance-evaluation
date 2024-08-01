#
# Copyright (c) 2022 SPARQL Anything Contributors @ http://github.com/sparql-anything
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

mvn -f ../sparql.anything.experiment/pom.xml clean install
THIS_FOLDER=$(pwd)
mvn -f ../sparql.anything.experiment/pom.xml exec:java  -Dexec.cleanupDaemonThreads=false -Dexec.mainClass="com.github.spiceh2020.sparql.anything.experiment.TestDataCreator" -Dexec.args="$THIS_FOLDER"

echo "RUN increasing input experiment"
bash run_increasing_input_experiment.sh

echo "RUN increaseing input experiment NEW VERSIONS"
bash run_increasing_input_experiment_new.sh
