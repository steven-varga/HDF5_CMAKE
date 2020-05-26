#/bin/bash
#
# HDF5_CMAKE
#
mkdir -p ../BuildConvert
cd ../BuildConvert

cmake -DCMAKE_INSTALL_PREFIX=/home/reinhard ../HDF5_CMAKE/SourceConvert
make 
make install
./Converthdf
$HOME/bin/Converthdf    
#===> /home/reinhard/bin/Converthdf: error while loading shared libraries: libhdf5_fortran.so.200: cannot open shared object file: No such file or directory
cp Converthdf $HOME/bin
$HOME/bin/Converthdf
