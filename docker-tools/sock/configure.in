dnl
dnl Process this file with autoconf to produce a configure script.
dnl $Id: configure.in,v 1.11 2000/06/19 19:52:49 mborella Exp $

dnl Make sure that we're in the right directory by looking for ipgrab.c
AC_INIT(src/main.c)

dnl set up for automake
AM_INIT_AUTOMAKE(sock,0.3.2)

dnl set up automake header file
AM_CONFIG_HEADER(config.h)

dnl Checks for C compiler and make
AC_PROG_CC

dnl check for socket libraries
AC_CHECK_LIB(nsl, main)
AC_CHECK_LIB(socket, main)

dnl Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS(sys/types.h sys/socket.h sys/param.h sys/time.h time.h netinet/in.h arpa/inet.h errno.h fcntl.h netdb.h signal.h stdio.h stdlib.h string.h sys/stat.h sys/uio.h unistd.h sys/wait.h sys/un.h sys/select.h poll.h strings.h sys/ioctl.h sys/filio.h sys/sockio.h pthread.h sys/sysctl.h poll.h netconfig.h netdir.h stropts.h, [], [], [
#ifdef HAVE_SYS_PARAM_H
#include <sys/param.h>
#endif])

dnl Checks for compiler characteristics.
AC_C_CONST
AC_C_BIGENDIAN dnl You'll get a warning from autoconf

dnl Checks for types
AC_TYPE_SIZE_T
AC_UNP_CHECK_TYPE(u_int8_t, unsigned char)
AC_UNP_CHECK_TYPE(int16_t, short)
AC_UNP_CHECK_TYPE(u_int16_t, unsigned short)
AC_UNP_CHECK_TYPE(int32_t, int)
AC_UNP_CHECK_TYPE(u_int32_t, unsigned int)

dnl check for prototypes
AC_CHECK_FUNC_PROTO(addrinfo, netdb.h)

dnl Checks for library functions.
AC_TYPE_SIGNAL
AC_CHECK_FUNCS(strdup strerror setlinebuf)
AC_CHECK_FUNC(getopt_long, [GETOPT=""], [GETOPT="../src/getopt.o ../src/getopt_internal.o"])
AC_SUBST(GETOPT)

dnl Check for structure definitions.
AC_CACHE_CHECK(for addrinfo{}, ac_cv_have_addrinfo_struct,
	AC_EGREP_HEADER(addrinfo, netdb.h,
		ac_cv_have_addrinfo_struct=yes,
		ac_cv_have_addrinfo_struct=no))
if test $ac_cv_have_addrinfo_struct = yes ; then
	AC_DEFINE([HAVE_ADDRINFO_STRUCT], [], [struct addrinfo is defined])
fi

dnl Check if msghdr{} has msg_control member.
dnl
AC_CACHE_CHECK(if msghdr{} has msg_control member, ac_cv_msghdr_has_msg_control,
        AC_TRY_COMPILE([
#               include <sys/types.h>
#               include <sys/socket.h>],
                [unsigned int i = sizeof(((struct msghdr *)0)->msg_control)],
        ac_cv_msghdr_has_msg_control=yes,
        ac_cv_msghdr_has_msg_control=no))
if test $ac_cv_msghdr_has_msg_control = yes ; then
        AC_DEFINE(HAVE_MSGHDR_MSG_CONTROL, [], [struct msghdr has msg_control field])
fi

dnl Check if msghdr{} has msg_field member.
dnl
AC_CACHE_CHECK(if msghdr{} has msg_field member, ac_cv_msghdr_has_msg_field,
        AC_TRY_COMPILE([
#               include <sys/types.h>
#               include <sys/socket.h>],
                [unsigned int i = sizeof(((struct msghdr *)0)->msg_flags)],
        ac_cv_msghdr_has_msg_flags=yes,
        ac_cv_msghdr_has_msg_flags=no))
if test $ac_cv_msghdr_has_msg_flags = yes ; then
        AC_DEFINE(HAVE_MSGHDR_MSG_FLAGS, [], [struct msghdr has msg_flags field])
fi

dnl Define DEBUG for debugging.  Comment this out to turn it off
dnl AC_DEFINE([DEBUG], [1], [use debugging])

dnl Create Makefile from Makefile.in
AC_OUTPUT(Makefile src/Makefile)

dnl end configure.in
