#/bin/bash
#
# HDF5_CMAKE
#
mkdir -p ../BuildCexample
cd ../BuildCexample
cmake -DCMAKE_INSTALL_PREFIX=/home/reinhard ../HDF5_CMAKE/SourceCexample
make 
make install
./h5ex_d_rdwr
$HOME/bin/h5ex_d_rdwr
#==> /home/reinhard/bin/h5ex_d_rdwr: error while loading shared libraries: libhdf5.so.200: cannot open shared object file: No such file or directory
cp h5ex_d_rdwr $HOME/bin
$HOME/bin/h5ex_d_rdwr
