# HDF5_CMAKE
#
I have two build directories outside this repository:
BuildConvert          ! A fortran90 example
BuildCexample         ! A C example

The HDF5 is installed into $HOME/HDF_Group  and the HDF5_DIR variable is set to:
/home/reinhard/HDF_Group/HDF5/1.12.0/share/cmake/hdf5

Within the Build directories I run:
: BuildConvert

cmake -DCMAKE_INSTALL_PREFIX=/home/reinhard ../HDF5_CMAKE/SourceConvert
make 
make install
./Converthdf      ! no issues
$HOME/bin/Converthdf    
#===> /home/reinhard/bin/Converthdf: error while loading shared libraries: libhdf5_fortran.so.200: cannot open shared object file: No such file or directory
cp Converthdf $HOME/bin
$HOME/bin/Converthdf  ! No issues   !!!!!!!!!!

: BuildCexample
cmake -DCMAKE_INSTALL_PREFIX=/home/reinhard ../HDF5_CMAKE/SourceCexample
make 
make install
./h5ex_d_rdwr    ! no issues
$HOME/bin/h5ex_d_rdwr
#==> /home/reinhard/bin/h5ex_d_rdwr: error while loading shared libraries: libhdf5.so.200: cannot open shared object file: No such file or directory
cp h5ex_d_rdwr $HOME/bin
$HOME/bin/h5ex_d_rdwr   ! No issue !!!!!!!!!


Why do the binaries in $HOME/bin fail with missing libraries, while the local binaries and the 
binaries copied into $HOME/bin do work? Am I missing something dumb in my CMakeLists.txt ?
I do not have such issues with make install in other projects.
