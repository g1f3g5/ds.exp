PACKAGES=$(shell go list ./... | grep -v '/simulation')

VERSION := $(shell echo $(shell git describe --tags) | sed 's/^v//')
COMMIT := $(shell git log -1 --format='%H')

ldflags = -X github.com/cosmos/cosmos-sdk/version.Name=NewApp \
	-X github.com/cosmos/cosmos-sdk/version.ServerName=pofed \
	-X github.com/cosmos/cosmos-sdk/version.ClientName=pofecli \
	-X github.com/cosmos/cosmos-sdk/version.Version=$(VERSION) \
	-X github.com/cosmos/cosmos-sdk/version.Commit=$(COMMIT) 

BUILD_FLAGS := -ldflags '$(ldflags)'

.PHONY: all
all: install
all: build
all: init

.PHONY: install
install: go.sum
		go install -mod=readonly $(BUILD_FLAGS) ./cmd/pofed
		go install -mod=readonly $(BUILD_FLAGS) ./cmd/pofecli
		npm --prefix ./vue i --save 
		npm --prefix ./vue run build

go.sum: go.mod
		@echo "--> Ensure dependencies have not been modified"
		GO111MODULE=on go mod verify

.PHONY: build
build:
		go build ./cmd/pofed
		go build ./cmd/pofecli

.PHONY: init
init:
		. ./initialize.sh

# Uncomment when you have some tests
# test:
# 	@go test -mod=readonly $(PACKAGES)
.PHONY: lint
# look into .golangci.yml for enabling / disabling linters
lint:
	@echo "--> Running linter"
	@golangci-lint run
	@go mod verify