# Makefile to manage dotfiles with GNU Stow

# Retrieve the list of directories
DIRS := $(wildcard */)
# Remove the trailing slash from directory names
STOW_TARGETS := $(patsubst %/,%,$(DIRS))

# Check if Stow is installed
STOW := $(shell command -v stow 2> /dev/null)

# Rules

all: check-stow $(STOW_TARGETS)
.PHONY: all

# Apply Stow to all directories
$(STOW_TARGETS):
	@echo "Stowing $@"
	@$(STOW) $@
.PHONY: $(STOW_TARGETS)

# Check if Stow is installed
check-stow:
ifndef STOW
	$(error "GNU Stow is not installed. Please install it before using this Makefile.")
endif
.PHONY: check-stow

