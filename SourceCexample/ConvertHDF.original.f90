program convertHDF

use HDF5

implicit none

integer :: h,k,l,i,j, hdferr
real(8) :: max_data, uc_hdf(6), steps(3), llim(3), data_sim(41,41,41)
logical :: hdf_data
character(128) :: title, data_file, data_file_long, file_str
character(999) :: str

INTEGER(HSIZE_T), PARAMETER :: dim0      = 1
INTEGER(HSIZE_T), PARAMETER :: sdim      = 8

CHARACTER(LEN=4) , PARAMETER :: dataset = "data"
CHARACTER(LEN=sdim), DIMENSION(:), ALLOCATABLE :: rdata ! Read buffer
INTEGER(HSIZE_T), DIMENSION(2) :: data_dims = (/sdim,dim0/)

INTEGER(HSIZE_T), DIMENSION(1:3) :: maxdims
INTEGER(SIZE_T), DIMENSION(1) :: str_len = (/8/)
INTEGER(HID_T) :: file, space, dset,filetype, memtype ! handles
INTEGER(HSIZE_T), DIMENSION(1:3)  :: dims, dim_one
CHARACTER(LEN=sdim), DIMENSION(1:dim0), TARGET ::  wdata = (/"Yell 1.0"/) ! Write buffer

INTEGER(HID_T)               :: F_BASET  ! File base type
INTEGER(HID_T)               :: M_BASET  ! Memory base type
INTEGER(SIZE_T)  , PARAMETER :: NAME_BUF_SIZE = 16
REAL, DIMENSION(:,:,:), ALLOCATABLE, TARGET :: data_read

CHARACTER(LEN=5), DIMENSION(1:2) :: &
       names = (/"FALSE", "TRUE "/)

ENUM, BIND(C)
     ENUMERATOR :: FALSE = 0, TRUE
  END ENUM
TYPE(C_PTR) :: f_ptr
INTEGER(kind(FALSE)), TARGET :: val, ii
integer :: jdim = 41


!Read Data file
!data_file='example3.inte.PART_'
!do j = 1, jdim
!  write(file_str, "(i0.4)") j
!  data_file_long  = trim(adjustl(data_file))//file_str
!  write(*,*) data_file_long
! open(11,file=data_file_long,status='old')
!  i = 5
! do while (i .ne.0)
!   read(11,*) str
!   i = index(str,'#')
! end do
! read(11,*) str
!  i = 0
!  do h = 1, jdim
!    do k = 1, jdim-1, 5
!    write(*,*) k
!     read(11,*) data_sim(k:k+4,h,j)
!   enddo
!    read(11,*) data_sim(k,h,j)
!  enddo
! close(11)

!enddo

data_sim = 1.0
CALL h5open_f(hdferr)
data_file = 'meanfield.h5'
call execute_command_line('rm -f '//data_file, wait=.true.)
CALL h5fcreate_f(data_file, H5F_ACC_TRUNC_f, file, hdferr)
  
dims = (/jdim,jdim,jdim/)
allocate(data_read(1:dims(1),1:dims(2),1:dims(3)))
max_data = maxval(data_sim)
do i = 1, jdim
  do j = 1, jdim
   do k = 1, jdim
    data_read(i,j,k) = 10000*data_sim(k,j,i)/max_data
   enddo
  enddo
enddo
CALL h5screate_simple_f(3, dims, space, hdferr)
CALL h5dcreate_f(file, dataset,H5T_NATIVE_REAL, space, dset, hdferr)

f_ptr = C_LOC(data_read(1,1,1))
CALL h5dwrite_f(dset, H5T_NATIVE_REAL, f_ptr, hdferr)

CALL h5dclose_f(dset , hdferr)
CALL h5sclose_f(space, hdferr)
  
!Write other stuff for yell format

CALL H5Tcopy_f(H5T_STRING, filetype, hdferr)
CALL H5Tset_strpad_f(filetype, H5T_STR_NULLTERM_F, hdferr)
dim_one = 1
CALL h5screate_f(H5S_SCALAR_F, space, hdferr)
!CALL h5screate_simple_f(1, dim_one, space, hdferr)
CALL h5dcreate_f(file, 'format', filetype, space, dset, hdferr)
CALL h5dwrite_vl_f(dset, filetype, wdata, data_dims, str_len, hdferr, space)
CALL h5dclose_f(dset , hdferr)
CALL h5sclose_f(space, hdferr)
CALL H5Tclose_f(filetype, hdferr)
!
! Close and release resources.
!
F_BASET   = H5T_STD_I8BE      ! File base type
M_BASET   = h5kind_to_type(kind(FALSE), H5_INTEGER_KIND) ! Memory base type
dim_one = 1
CALL h5tenum_create_f (F_BASET, filetype, hdferr)
CALL h5tenum_create_f (M_BASET, memtype, hdferr)
val = 0
DO ii = FALSE, TRUE
   CALL h5tenum_insert_f(memtype, TRIM(names(ii+1)), val, hdferr)
   f_ptr = C_LOC(val)
   CALL h5tconvert_f (M_BASET, F_BASET, INT(1,SIZE_T), f_ptr, hdferr)
   CALL h5tenum_insert_f(filetype, TRIM(names(ii+1)), val, hdferr)
   val = val +1
ENDDO

CALL h5screate_f(H5S_SCALAR_F, space, hdferr)
!CALL h5screate_simple_f(1, dim_one, space, hdferr)
CALL h5dcreate_f(file, 'is_direct',filetype, space, dset, hdferr)
val = FALSE
f_ptr = C_LOC(val)
CALL h5dwrite_f(dset, memtype, f_ptr, hdferr)
CALL h5dclose_f(dset , hdferr)
CALL h5sclose_f(space, hdferr)
CALL h5tclose_f(filetype, hdferr)

dim_one = 3
llim(1) = -4.
llim(2) = -4.
llim(3) = -4.
CALL h5screate_simple_f(1, dim_one, space, hdferr)
CALL h5dcreate_f(file, 'lower_lim',H5T_IEEE_F64BE, space, dset, hdferr)
CALL h5dwrite_f(dset, H5T_NATIVE_DOUBLE, llim , dim_one, hdferr)
CALL h5dclose_f(dset , hdferr)
CALL h5sclose_f(space, hdferr)
!
dim_one = 3
steps(1) = 8/200.
steps(2) = 8/200.
steps(3) = 8/200.
CALL h5screate_simple_f(1, dim_one, space, hdferr)
CALL h5dcreate_f(file, 'step_sizes',H5T_IEEE_F64BE, space, dset, hdferr)
CALL h5dwrite_f(dset, H5T_NATIVE_DOUBLE, steps, dim_one, hdferr)
CALL h5dclose_f(dset , hdferr)
CALL h5sclose_f(space, hdferr)

dim_one = 6
uc_hdf(1:3) = 4.06
uc_hdf(4:6) = 90.0
CALL h5screate_simple_f(1, dim_one, space, hdferr)
CALL h5dcreate_f(file, 'unit_cell',H5T_IEEE_F64BE, space, dset, hdferr)
CALL h5dwrite_f(dset, H5T_NATIVE_DOUBLE, uc_hdf, dim_one, hdferr)
CALL h5dclose_f(dset , hdferr)
CALL h5sclose_f(space, hdferr)
CALL h5fclose_f(file , hdferr)

end program convertHDF
