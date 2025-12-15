# Makefile

# Compiler and flags
CXX = gcc
CXXFLAGS = -g -Iinclude

# Sources and objects
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c,src/%.o,$(SRC))

# Output binary
TARGET = test 

# Default rule
all: $(TARGET)

# Linking
$(TARGET): $(OBJ)
	$(CXX) $(OBJ) -o $(TARGET)

# Compile .cpp to .o
src/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean build artifacts
clean:
	rm -f src/*.o $(TARGET)
