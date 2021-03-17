#!Makefile

SHELL := /bin/sh -x
DOT_ENV ?= ./.env

all: build

build:
	@set -a; . $(DOT_ENV); \
	docker build . -t $${IMAGE_INIT_TAG}

test/dgoss:
	@set -a; . $(DOT_ENV); \
	GOSS_OPTS="--format documentation --format-options verbose" dgoss run $${IMAGE_INIT_TAG} sleep 300; \
	GOSS_OPTS="--format junit --format-options verbose" dgoss run $${IMAGE_INIT_TAG} sleep 300 > goss.junit.xml;
