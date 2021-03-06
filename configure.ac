#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_INIT([amqpcpp], [1.11.13], [kyzmenko.pavel@gmail.com])
AC_GNU_SOURCE

# Checks for programs.
AC_PROG_CXX
AC_PROG_CC
AC_PROG_RANLIB

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([fcntl.h inttypes.h limits.h malloc.h stddef.h stdint.h stdlib.h string.h sys/file.h sys/ioctl.h sys/mount.h sys/param.h sys/time.h unistd.h utime.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_HEADER_STDBOOL
AC_TYPE_UID_T
AC_C_INLINE
AC_TYPE_INT32_T
AC_TYPE_MODE_T
AC_TYPE_OFF_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_CHECK_MEMBERS([struct stat.st_blksize])
AC_TYPE_UINT8_T

# Checks for library functions.
AC_FUNC_MALLOC
AC_FUNC_MMAP
AC_FUNC_REALLOC
AC_FUNC_STRERROR_R
AC_CHECK_LIB([rabbitmq],[main],[],[AC_MSG_ERROR([librabbitmq library missing])])
AC_CHECK_FUNCS([clock_gettime fdatasync gettimeofday localtime_r memmove memset munmap strdup strerror strtol utime])

AC_CONFIG_FILES([amqpcpp.pc])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
