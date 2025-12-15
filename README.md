# Project Template Generator

A simple Bash CLI tool that scaffolds C or C++ projects with a standard directory layout, a working Makefile, and optional Git initialization.

This is designed for quick project bootstrapping without manually setting up folders, headers, source files, and build configuration every time.

---

## Features

- Generates **C** or **C++** project templates
- Creates standard project structure:
  ```
  project_name/
  ├── include/
  │   └── project_name.h
  ├── src/
  │   └── project_name.c | project_name.cpp
  └── Makefile
  ```
- Auto-generated Makefile with sensible defaults
- Optional `git init` via flag
- Works from any directory when installed on `$PATH`

---

## Installation

### 1. Clone the repository
```bash
git clone https://github.com/yourusername/project-template-generator.git
cd project-template-generator
```

### 2. Make the script executable
```bash
chmod +x template
```

### 3. (Optional) Install globally
To use the command from anywhere:

```bash
mkdir -p ~/.local/bin
mv template ~/.local/bin/template
chmod +x ~/.local/bin/template
```

Add to your PATH if needed:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

---

## Usage

```bash
template c|cpp <project_name> [-g]
```

### Arguments
- `c` – create a C project
- `cpp` – create a C++ project
- `<project_name>` – name of the project directory and output binary

### Options
- `-g` – initialize a Git repository inside the project directory

---

### Examples

Create a C project:
```bash
template c hello_world
```

Create a C++ project with Git initialized:
```bash
template cpp raytracer -g
```

---

## Generated Makefile

- C projects use `gcc`
- C++ projects use `g++` with `-std=c++17`
- Supports:
  ```bash
  make
  make clean
  ```

---

## Requirements

- Bash
- `gcc` / `g++`
- `make`
- (Optional) `git`

Tested on macOS and Linux.

---

## Motivation

This project exists to remove friction when starting small C/C++ projects, especially for coursework, experiments, or quick prototypes. Instead of rewriting Makefiles and folder structures, you can start coding immediately.

---

## License

MIT License
