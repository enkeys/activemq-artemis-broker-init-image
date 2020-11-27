#!Makefile

all: build

build:
	source .env; \
	docker build . -t $${TARGET_IMAGE}

test/dgoss:
	source .env; \
	dgoss run $${TARGET_IMAGE} sleep 300; \
	GOSS_OPTS="--format junit" dgoss run $${TARGET_IMAGE} sleep 300
	 > /tmp/goss.junit.xml