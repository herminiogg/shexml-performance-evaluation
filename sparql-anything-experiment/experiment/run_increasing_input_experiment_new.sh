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

SPARQL_ANYTHING_VERSION=0.9.0
SHEXML_JAR=ShExML-v0.5.1.jar
RML_JAR=rmlmapper-6.5.1-r371-all.jar
SPARQL_GENERATE_JAR=sparql-generate-2.1.0.jar
if [[ ! -e "bin_new" ]]; then
	echo "bin_new not exists"
	mkdir bin_new
	cd bin_new/
	curl -OL https://github.com/SPARQL-Anything/sparql.anything/releases/download/$SPARQL_ANYTHING_VERSION/sparql-anything-$SPARQL_ANYTHING_VERSION.jar
	curl -OL https://github.com/sparql-generate/sparql-generate/releases/download/2.1.0/sparql-generate-2.1.0.jar
	curl -OL https://github.com/RMLio/rmlmapper-java/releases/download/v6.5.1/rmlmapper-6.5.1-r371-all.jar
	curl -OL https://github.com/herminiogg/ShExML/releases/download/v0.5.1/ShExML-v0.5.1.jar
	cd ..
fi

if [[ ! -e "generated-data" ]]; then
	mkdir generated-data
fi

function m() {

	#echo "eval  \$(timeout 3m $1 >/dev/null)"

	total=0
	for i in 1 2 3
	do
			t0=$(date +%s%3N)
	   	eval  $(timeout 3m $1 >/dev/null)
	   	t1=$(date +%s%3N)
	   	total=$(($total+$t1-$t0))
	   	echo "test $i $1 $(($t1-$t0))ms"
	done
	echo "Average: $1 $(($total/3)) ms"
}

JVM_ARGS=-Xmx10g

m "java $JVM_ARGS -jar bin_new/$SHEXML_JAR -m=shexml-mappings/q12_10.shexml -o=generated-data/shexml-q12_10.ttl"
m "java $JVM_ARGS -jar bin_new/$SHEXML_JAR -m=shexml-mappings/q12_100.shexml -o=generated-data/shexml-q12_100.ttl"
m "java $JVM_ARGS -jar bin_new/$SHEXML_JAR -m=shexml-mappings/q12_1000.shexml -o=generated-data/shexml-q12_1000.ttl"
m "java $JVM_ARGS -jar bin_new/$SHEXML_JAR -m=shexml-mappings/q12_10000.shexml -o=generated-data/shexml-q12_10000.ttl"
m "java $JVM_ARGS -jar bin_new/$SHEXML_JAR -m=shexml-mappings/q12_100000.shexml -o=generated-data/shexml-q12_100000.ttl"
m "java $JVM_ARGS -jar bin_new/$SHEXML_JAR -m=shexml-mappings/q12_1000000.shexml -o=generated-data/shexml-q12_1000000.ttl"


m "java $JVM_ARGS -jar bin_new/sparql-anything-$SPARQL_ANYTHING_VERSION.jar  -q sparql-anything-queries/q12_10.rqg -f TTL -o generated-data/sparql-anything-q12_10.ttl"
m "java $JVM_ARGS -jar bin_new/sparql-anything-$SPARQL_ANYTHING_VERSION.jar  -q sparql-anything-queries/q12_100.rqg -f TTL -o generated-data/sparql-anything-q12_100.ttl"
m "java $JVM_ARGS -jar bin_new/sparql-anything-$SPARQL_ANYTHING_VERSION.jar  -q sparql-anything-queries/q12_1000.rqg -f TTL -o generated-data/sparql-anything-q12_1000.ttl"
m "java $JVM_ARGS -jar bin_new/sparql-anything-$SPARQL_ANYTHING_VERSION.jar  -q sparql-anything-queries/q12_10000.rqg -f TTL -o generated-data/sparql-anything-q12_10000.ttl"
m "java $JVM_ARGS -jar bin_new/sparql-anything-$SPARQL_ANYTHING_VERSION.jar  -q sparql-anything-queries/q12_100000.rqg -f TTL -o generated-data/sparql-anything-q12_100000.ttl"
m "java $JVM_ARGS -jar bin_new/sparql-anything-$SPARQL_ANYTHING_VERSION.jar  -q sparql-anything-queries/q12_1000000.rqg -f TTL -o generated-data/sparql-anything-q12_1000000.ttl"

m "java $JVM_ARGS -jar bin_new/$RML_JAR -m rml-mappings/m4_10.ttl -s turtle -o generated-data/rml-m4_10.ttl"
m "java $JVM_ARGS -jar bin_new/$RML_JAR -m rml-mappings/m4_100.ttl -s turtle -o generated-data/rml-m4_100.ttl"
m "java $JVM_ARGS -jar bin_new/$RML_JAR -m rml-mappings/m4_1000.ttl -s turtle -o generated-data/rml-m4_1000.ttl"
m "java $JVM_ARGS -jar bin_new/$RML_JAR -m rml-mappings/m4_10000.ttl -s turtle -o generated-data/rml-m4_10000.ttl"
m "java $JVM_ARGS -jar bin_new/$RML_JAR -m rml-mappings/m4_100000.ttl -s turtle -o generated-data/rml-m4_100000.ttl"
m "java $JVM_ARGS -jar bin_new/$RML_JAR -m rml-mappings/m4_1000000.ttl -s turtle -o generated-data/rml-m4_1000000.ttl"

m "java $JVM_ARGS -jar bin_new/$SPARQL_GENERATE_JAR -q sparql-generate-queries/q12_10.rqg -fo TTL -o generated-data/sparql-generate-q12_10.ttl -l INFO"
m "java $JVM_ARGS -jar bin_new/$SPARQL_GENERATE_JAR -q sparql-generate-queries/q12_100.rqg -fo TTL -o generated-data/sparql-generate-q12_100.ttl -l INFO"
m "java $JVM_ARGS -jar bin_new/$SPARQL_GENERATE_JAR -q sparql-generate-queries/q12_1000.rqg -fo TTL -o generated-data/sparql-generate-q12_1000.ttl -l INFO"
m "java $JVM_ARGS -jar bin_new/$SPARQL_GENERATE_JAR -q sparql-generate-queries/q12_10000.rqg -fo TTL -o generated-data/sparql-generate-q12_10000.ttl -l INFO"
m "java $JVM_ARGS -jar bin_new/$SPARQL_GENERATE_JAR -q sparql-generate-queries/q12_100000.rqg -fo TTL -o generated-data/sparql-generate-q12_100000.ttl -l INFO"
m "java $JVM_ARGS -jar bin_new/$SPARQL_GENERATE_JAR -q sparql-generate-queries/q12_1000000.rqg -fo TTL -o generated-data/sparql-generate-q12_1000000.ttl -l INFO"
