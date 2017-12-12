#!/usr/bin/env bash

JAVA_FOLDER=~/java
JENV_HOME=~/.jenv
JENV=$(brew --prefix)/bin/jenv
RED='\x1B[0;31m'
GREEN='\x1B[0;32m'
NC='\x1B[0m' # No Color

unregister-java.sh

cd ${JAVA_FOLDER}

for file in jdk*; do
	if [ -f ${file}/bin/java ]; then
		echo Register ${file}
		${JENV} add $file $file > /dev/null 2>&1

		INSTALLED=$(${JENV} versions --bare | grep -c ${file})
		if [[ "${INSTALLED}" -ne "1" ]]; then
			echo -e "${RED}NOT INSTALLED${NC}"
		else
			echo -e "${GREEN}Installed${NC}"
		fi
	fi
done
