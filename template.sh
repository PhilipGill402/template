#!/bin/bash

lang=$1
name=$2
init_git=$false

#makes sure that all arguments are passed
if [[ -z "$lang" || -z "$name" ]]; then
    echo "usage: $0 c|cpp <project_name>"
    exit 1
fi

while getopts ":cCp:p:" opt; do
    case "$opt" in
        -g) init_git=$true ;;
    esac
done

c_make_file=$(cat <<EOF
# Makefile

# Compiler and flags
CXX = gcc
CXXFLAGS = -g -Iinclude

# Sources and objects
SRC = \$(wildcard src/*.c)
OBJ = \$(patsubst src/%.c,src/%.o,\$(SRC))

# Output binary
TARGET = $name 

# Default rule
all: \$(TARGET)

# Linking
\$(TARGET): \$(OBJ)
	\$(CXX) \$(OBJ) -o \$(TARGET)

# Compile .cpp to .o
src/%.o: src/%.cpp
	\$(CXX) \$(CXXFLAGS) -c \$< -o \$@

# Clean build artifacts
clean:
	rm -f src/*.o \$(TARGET)
EOF
)

cpp_make_file=$(cat <<EOF
# Makefile

# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -Iinclude

# Sources and objects
SRC = \$(wildcard src/*.cpp)
OBJ = \$(patsubst src/%.cpp,src/%.o,\$(SRC))

# Output binary
TARGET = $name

# Default rule
all: \$(TARGET)

# Linking
\$(TARGET): \$(OBJ)
	\$(CXX) \$(OBJ) -o \$(TARGET)

# Compile .cpp to .o
src/%.o: src/%.cpp
	\$(CXX) \$(CXXFLAGS) -c \$< -o \$@

# Clean build artifacts
clean:
	rm -f src/*.o \$(TARGET)
EOF
)

#check if first argument is either 'c', or 'cpp'
if [ "$lang" = "c" ]; then
    #creates project folder
    mkdir "$name"
    
    #checks if git flag is set
    if [ $init_git = $true ]; then
        git init "$name"
    fi

    #creates include and source folders
    mkdir "$name/include"
    touch "$name/include/$name.h"
    mkdir "$name/src"
    touch "$name/src/$name.c"

    #creates the makefile
    touch "$name/Makefile"
    echo "$c_make_file" > "$name/Makefile"

elif [ "$lang" = "cpp" ]; then
    #creates project folder
    mkdir "$name"
    
    #checks if git flag is set
    if [ $init_git = $true ]; then
        git init "$name"
    fi

    #creates include and source folders
    mkdir "$name/include"
    touch "$name/include/$name.h"
    mkdir "$name/src"
    touch "$name/src/$name.cpp"

    #creates the makefile
    touch "$name/Makefile"
    echo "$cpp_make_file" > "$name/Makefile"
fi
