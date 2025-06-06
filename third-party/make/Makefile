# Compiler and Flags
CC = gcc
CFLAGS_Debug = -g -Og -Wall -Wextra -Werror      # Debug: Symbols, no opt, warnings
CFLAGS_Release = -O3 -DNDEBUG -Wall              # Release: Optimized, no asserts
CFLAGS_PROFILE = -pg -Wall -Wextra               # Profile: Profiling

# Project Variables
PROG = myapp
SRCS := $(wildcard src/*.c)                 # Source files in src/
HDRPATH = include

# Build Directories
DBG_DIR = debug
REL_DIR = release
PROF_DIR = profile

# Object files (in respective dirs)
DBG_OBJS = $(patsubst src/%.c, $(DBG_DIR)/%.o, $(SRCS))
REL_OBJS = $(patsubst src/%.c, $(REL_DIR)/%.o, $(SRCS))
PROF_OBJS = $(patsubst src/%.c, $(PROF_DIR)/%.o, $(SRCS))

# Targets
.PHONY: all debug release profile clean

all: release          # Default target (builds release)

debug: $(DBG_DIR)/$(PROG)  # Build debug executable
release: $(REL_DIR)/$(PROG) # Build release executable
profile: $(PROF_DIR)/$(PROG) # Build profile executable

# Build debug executable from object files
$(DBG_DIR)/$(PROG): $(DBG_OBJS)
	@mkdir -p $(@D)    # Create directory if it doesn't exist
	$(CC) $(CFLAGS_Debug) -o $@ $^

# Build release executable from object files
$(REL_DIR)/$(PROG): $(REL_OBJS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS_Release) -o $@ $^

# Build profile executable from object files
$(PROF_DIR)/$(PROG): $(PROF_OBJS)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS_PROFILE) -o $@ $^


# Compile .c files into debug objects (with debug flags)
$(DBG_DIR)/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS_Debug) -c -I$(HDRPATH) -o $@ $<

# Compile .c files into release objects (with release flags)
$(REL_DIR)/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS_Release) -c -I$(HDRPATH) -o $@ $<


# Comoile .c files into profile objects (with profile flags)
$(PROF_DIR)/%.o: src/%.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS_PROFILE) -c -I$(HDRPATH) -o $@ $<

# Cleanup
clean:
	rm -rf $(DBG_DIR) $(REL_DIR) $(PROF_DIR)
