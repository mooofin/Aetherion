# Aetherion

A classic first-person raycasting game engine built from scratch in C++, inspired by the legendary rendering techniques of early 3D games like Wolfenstein 3D and Doom.


## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Building the Project](#building-the-project)
  - [Running the Game](#running-the-game)
- [Controls](#controls)
- [Project Architecture](#project-architecture)
- [Technical Implementation](#technical-implementation)
- [License](#license)


## Overview

This project implements a raycasting engine that creates a pseudo-3D environment from a 2D map. The renderer casts rays from the player's perspective to determine wall distances and heights, creating the illusion of three-dimensional space. The game features textured walls, floor rendering, audio effects, and multiple playable levels.

<!-- Add overview screenshot here -->


## Features

### Core Rendering
- Raycasting algorithm for real-time 3D visualization
- Dynamic texture mapping on walls
- Floor and ceiling rendering
- Adjustable field of view and rendering distance

### Gameplay Elements
- First-person perspective navigation
- Multiple map levels with different layouts
- Interactive doors and obstacles
- Flashlight mechanic with audio feedback
- Player UI overlay

### Technical Features
- Frame rate limiting (144 FPS target)
- SDL2-based graphics and audio
- CMake build system
- Cross-platform compatibility
- Efficient texture loading and caching





## Getting Started

### Prerequisites

Before building the project, ensure you have the following installed:

- **C++ Compiler** (GCC 9+ or Clang 10+ with C++20 support)
- **CMake** (version 3.22 or higher)
- **SDL2** development libraries
- **SDL2_image** development libraries

#### Installing Dependencies on Linux

```bash
# Ubuntu/Debian
sudo apt-get install build-essential cmake libsdl2-dev libsdl2-image-dev

# Fedora
sudo dnf install gcc-c++ cmake SDL2-devel SDL2_image-devel

# Arch Linux
sudo pacman -S base-devel cmake sdl2 sdl2_image

# NixOS
# Use the provided shell.nix file for a reproducible development environment
nix-shell

# Or install system-wide
nix-env -iA nixos.cmake nixos.SDL2 nixos.SDL2_image nixos.gcc
```

#### Installing Dependencies on macOS

```bash
brew install cmake sdl2 sdl2_image
```

#### Installing Dependencies on Windows

Download the development libraries from:
- SDL2: https://github.com/libsdl-org/SDL/releases
- SDL2_image: https://github.com/libsdl-org/SDL_image/releases


### Installation

Clone the repository to your local machine:

```bash
git clone https://github.com/mooofin/Aetherion.git
cd Aetherion
```


### Building the Project

#### Linux/macOS

```bash
mkdir -p build
cd build
cmake ..
make
```

#### NixOS

The project includes a `shell.nix` file for a reproducible build environment:

```bash
# Enter the Nix shell environment
nix-shell

# Then build as usual
mkdir -p build
cd build
cmake ..
make
```

#### Windows

```bash
mkdir build
cd build
cmake ..
cmake --build . --config Release
```


### Running the Game

After building, run the executable from the build directory:

```bash
./doom
```

Make sure you run the game from the `build` directory so that asset paths are correctly resolved.


## Controls

| Key | Action |
|-----|--------|
| `W` / `↑` | Move forward |
| `S` / `↓` | Move backward |
| `A` | Strafe left |
| `D` | Strafe right |
| `←` | Rotate camera left |
| `→` | Rotate camera right |
| `F` | Toggle flashlight |
| `ESC` | Exit game |


## Project Architecture

```
HEKATE/
├── src/
│   ├── main.cpp          # Application entry point and game loop
│   ├── raycaster.h       # Raycasting engine implementation
│   ├── imageloader.h     # Texture loading and management
│   └── color.h           # Color utilities and definitions
├── assets/
│   ├── audios/           # Sound effects and music
│   ├── maps/             # Level definitions (text-based)
│   ├── screens/          # Menu and UI images
│   └── textures/         # Wall and sprite textures
├── build/                # Build output directory
├── CMakeLists.txt        # Build configuration
└── README.md             # This file
```

### Key Components

**main.cpp**
- Game initialization and main loop
- Event handling and input processing
- Frame rate management
- Audio playback system

**raycaster.h**
- Ray casting algorithm implementation
- Wall collision detection
- Distance calculations and rendering
- Texture coordinate mapping

**imageloader.h**
- SDL2 image loading wrapper
- Texture caching system
- Rendering utilities

**color.h**
- RGB color structures
- Color manipulation utilities


## Technical Implementation

### Raycasting Algorithm

The raycasting engine works by:

1. Casting rays from the player position at angles across the field of view
2. Calculating intersection points with the map grid
3. Determining the distance to walls using the Digital Differential Analyzer (DDA) algorithm
4. Projecting wall heights based on distance (perspective correction)
5. Mapping textures onto walls based on hit positions

### Performance Optimizations

- Frame rate capping at 144 FPS to prevent excessive CPU usage
- Efficient map representation using 2D character arrays
- Texture caching to minimize file I/O
- Optimized ray stepping algorithms


## License

This project is open source and available under the MIT License.

```
MIT License

Copyright (c) 2025 mooofin

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```


---

**Built with C++ and SDL2** | **Inspired by classic FPS games**
