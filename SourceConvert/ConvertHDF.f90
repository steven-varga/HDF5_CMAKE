program convertHDF
use HDF5
implicit none
integer :: hdferr
logical :: hdf_data
character(128) :: data_file
INTEGER(HID_T) :: file, space, dset
INTEGER(HSIZE_T), DIMENSION(1:3)  :: dims
REAL, DIMENSION(:,:,:), ALLOCATABLE, TARGET :: data_read
TYPE(C_PTR) :: f_ptr
integer :: jdim = 41
CALL h5open_f(hdferr)
data_file = 'meanfield.h5'
call execute_command_line('rm -f '//data_file, wait=.true.)
CALL h5fcreate_f(data_file, H5F_ACC_TRUNC_f, file, hdferr)
dims = (/jdim,jdim,jdim/)
allocate(data_read(1:dims(1),1:dims(2),1:dims(3)))
data_read = 1.0
CALL h5screate_simple_f(3, dims, space, hdferr)
CALL h5dcreate_f(file, 'data', H5T_NATIVE_REAL, space, dset, hdferr)
f_ptr = C_LOC(data_read(1,1,1))
CALL h5dwrite_f(dset, H5T_NATIVE_REAL, f_ptr, hdferr)
CALL h5dclose_f(dset , hdferr)
CALL h5sclose_f(space, hdferr)
CALL h5fclose_f(file , hdferr)
end program convertHDF
