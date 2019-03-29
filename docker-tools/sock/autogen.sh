#!/bin/sh

DIE=0

echo
echo "              Sock Build Tools Setup"
echo "===================================================="
echo
echo "Checking whether we have all tools available ..."

(autoconf --version) < /dev/null > /dev/null 2>&1 || {
  echo
  echo ${BLD_ON}"Error"${BLD_OFF}": You must have \`autoconf' installed to."
  echo "Download the appropriate package for your distribution,"
  echo "or get the source tarball at ftp://ftp.gnu.org/pub/gnu/"
  DIE=1
}

(automake --version) < /dev/null > /dev/null 2>&1 || {
  echo
  echo ${BLD_ON}"Error"${BLD_OFF}": You must have \`automake' installed."
  echo "Get ftp://ftp.gnu.org/pub/gnu/automake-1.3.tar.gz"
  echo "(or a newer version if it is available)"
  DIE=1
  NO_AUTOMAKE=yes
}

# if no automake, don't bother testing for aclocal
test -n "$NO_AUTOMAKE" || (aclocal --version) < /dev/null > /dev/null 2>&1 || {
  echo
  echo ${BLD_ON}"Error"${BLD_OFF}": Missing \`aclocal'.  The version of \`automake'"
  echo "installed doesn't appear recent enough."
  echo "Get ftp://ftp.gnu.org/pub/gnu/automake-1.3.tar.gz"
  echo "(or a newer version if it is available)"
  DIE=1
}

if test "$DIE" -eq 1; then
  exit 1
fi

echo "All necessary tools found."
echo

if [ -d autom4te.cache ] ; then
    echo "Removing autom4te.cache ..."
    rm -rf autom4te.cache
fi

echo
echo "running "${BLD_ON}"aclocal"${BLD_OFF}
echo "----------------------------------------------------"
aclocal -I . $ACLOCAL_FLAGS
if [ $? -ne 0 ]; then
    echo "*** ERROR, aborting."
    exit 1
fi

echo
echo "running "${BLD_ON}"autoheader"${BLD_OFF}
echo "----------------------------------------------------"
autoheader
if [ $? -ne 0 ]; then
    echo "*** ERROR, aborting."
    exit 1
fi

echo
echo "running "${BLD_ON}"automake"${BLD_OFF}
echo "----------------------------------------------------"
automake -a -c 
if [ $? -ne 0 ]; then
    echo "*** ERROR, aborting."
    exit 1
fi

echo
echo "running "${BLD_ON}"autoconf"${BLD_OFF}
echo "----------------------------------------------------"
autoconf
if [ $? -ne 0 ]; then
    echo "*** ERROR, aborting."
    exit 1
fi

echo
echo 
echo "Setup finished. Now run:"
echo
echo "  $ ./configure (with options as needed, try --help)"
echo
echo "and then"
echo
echo "  $ make"
echo "  # make install"
echo
