PROJECT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
CI_BUILD_NUMBER ?= $(USER)-snapshot

VERSION ?= 0.0.$(CI_BUILD_NUMBER)
FLOW_VERSION ?= 0.40.0

PUBLISH_TAG=meetup/node-flow:$(FLOW_VERSION)-$(VERSION)

# lists all available targets
list:
	@sh -c "$(MAKE) -p no_op__ | \
		awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);\
		for(i in A)print A[i]}' | \
		grep -v '__\$$' | \
		grep -v 'make\[1\]' | \
		grep -v 'Makefile' | \
		sort"

# required for list
no_op__:

#Assemles the software artifact using the defined build image.
__package:
	docker build -t $(PUBLISH_TAG) .

package: __package component-test

component-test:
	echo "No component test :("

#Pushes the container to the docker registry/repository.
publish: package
	@docker push $(PUBLISH_TAG)

version:
	@echo $(VERSION)

publish-tag:
	@echo $(PUBLISH_TAG)
