# http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
# http://www.cs.uleth.ca/~bomhof/cs1620A/tutorials/MakefileNotes.html
# http://www.cs.dartmouth.edu/~campbell/cs50/buildlib.html
# https://codereview.stackexchange.com/questions/74136/makefile-that-places-object-files-into-an-alternate-directory-bin/74139#74139

##########################################
#           Editable options             #
##########################################

# Compiler options
CC=g++
VERS=-std=c++17
CFLAGS=-O3 -Wall -Iinclude
LDFLAGS=-Llib -lsimple
COMPLDFLAGS=-L /opt/rh/devtoolset-7/root/usr/lib/gcc/x86_64-redhat-linux/7/
EXECUTABLE_NAME=main

# Folders
SRC=src
LIB=lib
BIN=bin
OBJ=build

# Files
SOURCE_FILES=\
    main.cpp\
    birthday.cpp\
	person.cpp

#########################################################
#                     Compilation                       #
#########################################################
# setting up some basic "rules"
EXECUTABLE_FILES = $(EXECUTABLE_NAME:%=$(BIN)/%)
OBJECT_FILES     = $(SOURCE_FILES:%.cpp=$(OBJ)/%.o)

# the build option sets the rule for what
# rule to execute when make is typed. 
build: $(EXECUTABLE_FILES)

clean:
	rm -rf $(OBJ)
	rm -rf $(LIB)

all:
	rm -rf $(BIN)

.PHONY: all build clean

# The reverse order is to keep the compilation order in check 
$(EXECUTABLE_FILES): $(LIB)/libsimple.a
	$(CC) $(VERS) $(COMPLDFLAGS) -o $@ $(LDFLAGS)
	@echo "Build successful!" # the @ suppresses the echoing of a command

# I would have preffered to make separate .a files
# one for the objects without main libsimple
# and one with the main libsimplemain
# but this seemed too much of a hastle
# also hardcoding...
$(LIB)/libsimple.a: $(OBJECT_FILES)
	@echo "Creating static libraries: libsimple.a"
	@ar -cq $@ $^ 

$(OBJECT_FILES): $(OBJ)/%.o: $(SRC)/%.cpp
	@echo "Producing object code for: " $(@F)
	@mkdir -p $(@D)
	@mkdir -p $(BIN)
	@mkdir -p $(LIB)

	@$(CC) $(CFLAGS) -c -o $@ $<

##########################################
#                  Old                   #
##########################################
# CC=g++
# VERS=-std=c++17
# CFLAGS=-O3 -Wall
# LDFLAGS=-L /opt/rh/devtoolset-7/root/usr/lib/gcc/x86_64-redhat-linux/7/

# EXE=main1
# DEPS=birthday.h person.h
# OBJ=main.o birthday.o person.o
# OBJDIR=build

# $(OBJDIR)/%.o: %.c $(DEPS)
# 	$(CC) $(CFLAGS) $(VERS) $(LDFLAGS) -c -o $@ $< 

# $(EXE): $(OBJ)
# 	$(CC) $(CFLAGS) $(VERS) $(LDFLAGS) -o $@ $^ 

# .PHONY: clean

# clean:
# 	rm -f *.o

# all:
# 	rm -f *.o $(EXE)
