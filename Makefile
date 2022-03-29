GIT_VER ?= $(shell git describe --tags | sed -e 's/-/+/')
DATE := $(shell date +%Y-%m-%dT%H:%M:%S%z)
GO ?= go
GO_BUILD ?= $(GO) build

rec_wildcard = $(foreach d,$(wildcard $1*),$(call rec_wildcard,$d/,$2) $(filter $(subst *,%,$2),$d))
SRC := $(call rec_wildcard,,*.go) go.mod go.sum

## build the binary of vpshell
cmd/vpshell/vpshell: $(SRC)
	cd cmd/vpshell && \
	$(GO_BUILD) -ldflags "-s -w -X main.Version=$(GIT_VER) -X main.buildDate=$(DATE)" -trimpath
