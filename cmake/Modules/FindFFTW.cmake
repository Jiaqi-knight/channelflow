# FFTW_INCLUDE_DIR = fftw3.h
# FFTW_LIBRARIES = libfftw3
# FFTW_FOUND = true if FFTW3 is found


FIND_LIBRARY(FFTW_OMP_LIBRARY fftw3_omp HINTS ${WITH_FFTW} "${WITH_FFTW}/lib" $ENV{LD_LIBRARY_PATH})
FIND_PATH(FFTW_INCLUDE_DIR fftw3.h HINTS "${FFTW_LIBDIR}/../include")
FIND_LIBRARY(FFTW_LIBRARY fftw3 HINTS ${FFTW_LIBDIR})
get_filename_component(FFTW_LIBDIR ${FFTW_LIBRARY} PATH)
FIND_LIBRARY(FFTW_MPI_LIBRARY fftw3_mpi HINTS ${FFTW_LIBDIR})
get_filename_component(FFTW_MPI_LIBDIR ${FFTW_MPI_LIBRARY} PATH)
include(LibFindMacros)
libfind_process(FFTW)


IF(FFTW_INCLUDE_DIR AND FFTW_LIBRARY)
#   MESSAGE(STATUS "FFTW_INCLUDE_DIR=${FFTW_INCLUDE_DIR}")
  MESSAGE(STATUS "FFTW_LIBRARY=${FFTW_LIBRARY}")
  MESSAGE(STATUS "FFTW_OMP_LIBRARY=${FFTW_OMP_LIBRARY}")
  MESSAGE(STATUS "FFTW_MPI_LIBRARY=${FFTW_MPI_LIBRARY}")
  #set(FFTW_LIBRARIES ${FFTW_LIBRARY} ${FFTW_OMP_LIBRARY} ${FFTW_MPI_LIBRARY})
  #MESSAGE(STATUS "FFTW_LIBRARIES=${FFTW_LIBRARIES}")
#   set(FFTW_FOUND TRUE)
ELSE()
  IF(FFTW_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "FFTW required, please specify it's location.")
  ELSE()
    MESSAGE(STATUS      "FFTW was not found.")
  ENDIF()
ENDIF()
if(NOT "${FFTW_MPI_LIBDIR}" STREQUAL "${FFTW_LIBDIR}")
  message(WARNING "The locations of fftw_mpi and fftw library are not the same. This is probably something you don't want!")
endif()


# MARK_AS_ADVANCED(FFTW_INCLUDE_DIR FFTW_LIBRARY)
