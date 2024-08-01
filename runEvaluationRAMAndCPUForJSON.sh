#!/bin/bash

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

function m() {
	for i in $(seq 1 30)
	do
		metrics=$((/usr/bin/time -q -f "%e;%U;%S;%P;%M" $1 >/dev/null) 2>&1)
	   	echo "$i;$2;$metrics"
	done
}

JVM_ARGS=

echo "Hit;Engine;Elapsed_time(s);CPU_user(s);CPU_kernel(s);CPU_Percentage;MaxMemory(Kbytes)"

m "java $JVM_ARGS -jar bin/ShExML-v0.3.2.jar -m=mapping-rules/filmsJSON.shexml -o=generated-data/ShExML-JSON-v0.3.2.ttl" "ShExML-v0.3.2"
m "java $JVM_ARGS -jar bin/ShExML-v0.3.3.jar -m=mapping-rules/filmsJSON.shexml -o=generated-data/ShExML-JSON-v0.3.3.ttl" "ShExML-v0.3.3"
m "java $JVM_ARGS -jar bin/ShExML-v0.4.0.jar -m=mapping-rules/filmsJSON.shexml -o=generated-data/ShExML-JSON-v0.4.0.ttl" "ShExML-v0.4.0"
m "java $JVM_ARGS -jar bin/ShExML-v0.4.2.jar -m=mapping-rules/filmsJSON.shexml -o=generated-data/ShExML-JSON-v0.4.2.ttl" "ShExML-v0.4.2"
m "java $JVM_ARGS -jar bin/ShExML-v0.5.1.jar -m=mapping-rules/filmsJSON.shexml -o=generated-data/ShExML-JSON-v0.5.1.ttl" "ShExML-v0.5.1"
