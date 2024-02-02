#!/bin/bash

cd data
if [[ ! -e "institutions" ]]; then
	mkdir institutions
	python downloadEHRIInstitutionsData.py
fi
cd ..

if [[ ! -e "bin" ]]; then
	mkdir bin
	cd bin/
	curl -OL https://github.com/herminiogg/ShExML/releases/download/v0.3.2/ShExML-v0.3.2.jar
    curl -OL https://github.com/herminiogg/ShExML/releases/download/v0.3.3/ShExML-v0.3.3.jar
    curl -OL https://github.com/herminiogg/ShExML/releases/download/v0.4.0/ShExML-v0.4.0.jar
    curl -OL https://github.com/herminiogg/ShExML/releases/download/v0.4.2/ShExML-v0.4.2.jar
	curl -OL https://github.com/herminiogg/ShExML/releases/download/v0.5.1/ShExML-v0.5.1.jar
	cd ..
fi
if [[ ! -e "generated-data" ]]; then
	mkdir generated-data
fi

function m_one_no_timeout() {
	t0=$(date +%s%3N)
	eval $($1 >/dev/null)
	t1=$(date +%s%3N)
	total=$(($total+$t1-$t0))
	echo "test 1 $1 $(($t1-$t0))ms"
}

function m() {
	for i in $(seq 1 30)
	do
		t0=$(date +%s%3N)
	   	eval $(timeout 3m $1 >/dev/null)
	   	t1=$(date +%s%3N)
	   	total=$(($total+$t1-$t0))
	   	echo "test $i $1 $(($t1-$t0))ms"
	done
}

JVM_ARGS=

m_one_no_timeout "java $JVM_ARGS -jar bin/ShExML-v0.3.2.jar -m=mapping-rules/institutions.shexml -o=generated-data/ShExML-institutions-v0.3.2.ttl"
m "java $JVM_ARGS -jar bin/ShExML-v0.3.3.jar -m=mapping-rules/institutions.shexml -o=generated-data/ShExML-institutions-v0.3.3.ttl"
m "java $JVM_ARGS -jar bin/ShExML-v0.4.0.jar -m=mapping-rules/institutions.shexml -o=generated-data/ShExML-institutions-v0.4.0.ttl"
m "java $JVM_ARGS -jar bin/ShExML-v0.4.2.jar -m=mapping-rules/institutions.shexml -o=generated-data/ShExML-institutions-v0.4.2.ttl"
m "java $JVM_ARGS -jar bin/ShExML-v0.5.1.jar -m=mapping-rules/institutions.shexml -o=generated-data/ShExML-institutions-v0.5.1.ttl"
