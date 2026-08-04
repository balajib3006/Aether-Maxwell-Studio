cmake_minimum_required(VERSION 3.28)

# ============================================================================
# Aether Maxwell Studio
# AI-Native Electronic Design Automation Platform
# ============================================================================

project(
    AetherMaxwellStudio
    VERSION 0.1.0
    DESCRIPTION "AI-Native Electronic Design Automation and Computational Electromagnetics Platform"
    LANGUAGES CXX
)

# ============================================================================
# Global Settings
# ============================================================================

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Organize Visual Studio solution folders
set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# ============================================================================
# Build Options
# ============================================================================

option(AMS_BUILD_TESTS        "Build unit tests"           ON)
option(AMS_BUILD_EXAMPLES     "Build examples"             ON)
option(AMS_BUILD_BENCHMARKS   "Build benchmarks"           OFF)

option(AMS_ENABLE_AI          "Enable AI modules"          ON)
option(AMS_ENABLE_CUDA        "Enable CUDA acceleration"   OFF)
option(AMS_ENABLE_MPI         "Enable MPI"                 OFF)
option(AMS_ENABLE_OPENMP      "Enable OpenMP"              ON)

# ============================================================================
# Output Directories
# ============================================================================

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# ============================================================================
# Qt
# ============================================================================

find_package(Qt6 REQUIRED COMPONENTS
    Core
    Gui
    Widgets
)

qt_standard_project_setup()

# ============================================================================
# Third Party Dependencies
# ============================================================================

find_package(Eigen3 REQUIRED)

# OpenCASCADE will be enabled later
# find_package(OpenCASCADE REQUIRED)

if(AMS_ENABLE_OPENMP)
    find_package(OpenMP)
endif()

# ============================================================================
# Compiler Warnings
# ============================================================================

if(MSVC)

    add_compile_options(
        /W4
        /permissive-
        /EHsc
        /utf-8
    )

else()

    add_compile_options(
        -Wall
        -Wextra
        -Wpedantic
        -Wshadow
        -Wconversion
    )

endif()

# ============================================================================
# Project Modules
# ============================================================================

add_subdirectory(core)

add_subdirectory(cad)

add_subdirectory(pcb)

add_subdirectory(rf)

add_subdirectory(em)

add_subdirectory(ai)

add_subdirectory(plugins)

add_subdirectory(apps)

# ============================================================================
# Optional Modules
# ============================================================================

if(AMS_BUILD_EXAMPLES)

    add_subdirectory(examples)

endif()

if(AMS_BUILD_TESTS)

    enable_testing()

    add_subdirectory(tests)

endif()

if(AMS_BUILD_BENCHMARKS)

    add_subdirectory(benchmarks)

endif()

# ============================================================================
# Install
# ============================================================================

include(GNUInstallDirs)

install(
    DIRECTORY resources/
    DESTINATION ${CMAKE_INSTALL_DATADIR}/AetherMaxwellStudio
)

message(STATUS "")
message(STATUS "==========================================")
message(STATUS " Aether Maxwell Studio")
message(STATUS " Version : ${PROJECT_VERSION}")
message(STATUS " Build   : ${CMAKE_BUILD_TYPE}")
message(STATUS " C++     : ${CMAKE_CXX_STANDARD}")
message(STATUS "==========================================")
message(STATUS "")