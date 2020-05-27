cmake_minimum_required (VERSION 3.10.2)
project (Convert C CXX Fortran)
include(FindHDF5)
find_package(ZLIB REQUIRED QUIET)

list(APPEND LIBS ${HDF5_C_LIBRARIES} ${ZLIB_LIBRARIES})
list(APPEND INCLUDE_DIRS ${CMAKE_SOURCE_DIR} ${HDF5_INCLUDE_DIRS}  ${ZLIB_INCLUDE_DIRS})

if (HDF5_FOUND)
    message("!!! Use H5CPP instead of HDF5_CXX: http://h5cpp.org")
    message("!!! H5CPP depends only on the CAPI, no HL, CXX ... ")
    message( "!!! why the fortran libs? doesn't the HDF5 C libs have all the symbols?")
else ()
  message (FATAL_ERROR " HDF5 is Required")
endif ()

message ( STATUS " LINK_LIBS ${LIBS}" )

# Add your application HERE
add_executable (h5ex_d_rdwr h5ex_d_rdwr.c )
#target_link_libraries (h5ex_d_rdwr PRIVATE ${LINK_LIBS})
target_link_libraries (h5ex_d_rdwr ${LIBS})
install (TARGETS h5ex_d_rdwr DESTINATION bin)
