# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/SourceCexample

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/BuildCexample

# Include any dependencies generated for this target.
include CMakeFiles/h5ex_d_rdwr.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/h5ex_d_rdwr.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/h5ex_d_rdwr.dir/flags.make

CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.o: CMakeFiles/h5ex_d_rdwr.dir/flags.make
CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.o: /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/SourceCexample/h5ex_d_rdwr.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/BuildCexample/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.o   -c /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/SourceCexample/h5ex_d_rdwr.c

CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/SourceCexample/h5ex_d_rdwr.c > CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.i

CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/SourceCexample/h5ex_d_rdwr.c -o CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.s

# Object files for target h5ex_d_rdwr
h5ex_d_rdwr_OBJECTS = \
"CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.o"

# External object files for target h5ex_d_rdwr
h5ex_d_rdwr_EXTERNAL_OBJECTS =

h5ex_d_rdwr: CMakeFiles/h5ex_d_rdwr.dir/h5ex_d_rdwr.c.o
h5ex_d_rdwr: CMakeFiles/h5ex_d_rdwr.dir/build.make
h5ex_d_rdwr: /home/reinhard/HDF_Group/HDF5/1.12.0/lib/libhdf5_cpp.so.200.0.0
h5ex_d_rdwr: /home/reinhard/HDF_Group/HDF5/1.12.0/lib/libhdf5_fortran.so.200.0.0
h5ex_d_rdwr: /home/reinhard/HDF_Group/HDF5/1.12.0/lib/libhdf5_f90cstub.so.200.0.0
h5ex_d_rdwr: /home/reinhard/HDF_Group/HDF5/1.12.0/lib/libhdf5.so.200.0.0
h5ex_d_rdwr: CMakeFiles/h5ex_d_rdwr.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/BuildCexample/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable h5ex_d_rdwr"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/h5ex_d_rdwr.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/h5ex_d_rdwr.dir/build: h5ex_d_rdwr

.PHONY : CMakeFiles/h5ex_d_rdwr.dir/build

CMakeFiles/h5ex_d_rdwr.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/h5ex_d_rdwr.dir/cmake_clean.cmake
.PHONY : CMakeFiles/h5ex_d_rdwr.dir/clean

CMakeFiles/h5ex_d_rdwr.dir/depend:
	cd /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/BuildCexample && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/SourceCexample /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/SourceCexample /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/BuildCexample /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/BuildCexample /home/reinhard/sw/fortran90/HDF5/HDF5_CMAKE/BuildCexample/CMakeFiles/h5ex_d_rdwr.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/h5ex_d_rdwr.dir/depend
