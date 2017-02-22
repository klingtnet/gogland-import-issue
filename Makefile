.PHONY: clean docker test

BIN			:=example
PROJECT_NAME:=$(shell source s/env && echo $$project_name)
NAMESPACE	:=$(shell source s/env && echo $$namespace)
VERSION		:=$(shell git describe --tags --always|sed 's/^v//g')
GO_FLAGS	:=-ldflags="-X main.Version=$(VERSION)"
SOURCES		:=$(wildcard mylib/*.go)
GO_PATH		:=$(shell pwd)/.go

all: $(BIN)

foo:
	echo $(shell source s/env && echo "build: $$project_name")

$(GO_PATH):
	s/bootstrap

$(BIN): $(BIN).go $(SOURCES) $(GO_PATH)
	GOPATH=$(GO_PATH) go build $(GO_FLAGS) $(NAMESPACE)/$(PROJECT_NAME)

install: test $(BIN)
ifeq ($$EUID, 0)
	@install --mode=0755 --verbose $(BIN) /usr/local/bin
else
	@install --mode=0755 --verbose $(BIN) $$HOME/.local/bin
endif

fmt:
	gofmt -w . ./mylib

check: vet lint

vet:
	go vet . ./mylib

lint:
	golint .
	golint ./mylib

clean:
	rm -f $(BIN)

clean-all: clean
	rm -rf .go vendor
