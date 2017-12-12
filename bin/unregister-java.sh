#!/usr/bin/env bash

JENV_HOME=~/.jenv
JENV=$(brew --prefix)/bin/jenv

for version in `${JENV} versions --bare`; do
	${JENV} remove ${version}
done

rm -f ${JENV_HOME}/*.time
rm -f ${JENV_HOME}/versions/*
