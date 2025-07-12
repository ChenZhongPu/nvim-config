# Compiler and Flags
CC = gcc
#CFLAGS_Debug = -g -O0 -Wall -Wextra -Werror      # Debug: Symbols, no opt, warnings
CFLAGS_Debug = -g -O0 -Wall -Wextra     # Debug: Symbols, no opt, warnings
CFLAGS_Release = -O2 -DNDEBUG -Wall              # Release: Optimized, no asserts
CFLAGS_PROFILE = -pg -Wall -Wextra               # Profile: Profiling

# Project Variables
SRCS := $(wildcard src/*.c)                 # Source files in src/
PROGS := $(patsubst src/%.c, %, $(SRCS))   # Program names from source files
HDRPATH = include

# Build Directories
DBG_DIR = debug
REL_DIR = release
PROF_DIR = profile

# Get the goals from the command line (e.g., "debug info")
GOALS := $(MAKECMDGOALS)

# Separate the build type (debug, release, profile) from the program names
BUILD_TYPE := $(filter debug release profile, $(GOALS))

# Get the specific programs requested, if any. If none, build all programs.
TARGET_PROGS := $(filter-out $(BUILD_TYPE), $(GOALS))
ifeq ($(strip $(TARGET_PROGS)),)
TARGET_PROGS := $(PROGS)
endif

# Define the executables to be built based on the build type and requested programs
DBG_TARGETS = $(patsubst %, $(DBG_DIR)/%, $(TARGET_PROGS))
REL_TARGETS = $(patsubst %, $(REL_DIR)/%, $(TARGET_PROGS))
PROF_TARGETS = $(patsubst %, $(PROF_DIR)/%, $(TARGET_PROGS))


# Targets
.PHONY: all debug release profile clean

all: release          # Default target (builds release)

debug: $(DBG_TARGETS)
release: $(REL_TARGETS)
profile: $(PROF_TARGETS)

# Generic rule to build a debug executable
$(DBG_DIR)/%: src/%.c
	@mkdir -p $(@D)    # Create directory if it doesn't exist
	$(CC) $(CFLAGS_Debug) -I$(HDRPATH) -o $@ $<

# Generic rule to build a release executable
$(REL_DIR)/%: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS_Release) -I$(HDRPATH) -o $@ $<

# Generic rule to build a profile executable
$(PROF_DIR)/%: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS_PROFILE) -I$(HDRPATH) -o $@ $<


# Cleanup
clean:
	rm -rf $(DBG_DIR) $(REL_DIR) $(PROF_DIR)
