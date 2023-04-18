# Copyright (C) 2002-2022 Free Software Foundation, Inc.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this file.  If not, see <https://www.gnu.org/licenses/>.
#
# As a special exception to the GNU General Public License,
# this file may be distributed as part of a program that
# contains a configuration script generated by Autoconf, under
# the same distribution terms as the rest of that program.
#
# Generated by gnulib-tool.
#
# This file represents the specification of how gnulib-tool is used.
# It acts as a cache: It is written and read by gnulib-tool.
# In projects that use version control, this file is meant to be put under
# version control, like the configure.ac and various Makefile.am files.


# Specification in the form of a command-line invocation:
# gnulib-tool --import --local-dir=gnulib-local \
#  --lib=libgettextlib \
#  --source-base=gnulib-lib \
#  --m4-base=gnulib-m4 \
#  --doc-base=doc \
#  --tests-base=gnulib-tests \
#  --aux-dir=../build-aux \
#  --with-tests \
#  --makefile-name=Makefile.gnulib \
#  --no-conditional-dependencies \
#  --libtool \
#  --macro-prefix=gl \
#  --avoid=fdutimensat-tests \
#  --avoid=futimens-tests \
#  --avoid=utime-tests \
#  --avoid=utimens-tests \
#  --avoid=utimensat-tests \
#  --avoid=array-list-tests \
#  --avoid=linked-list-tests \
#  --avoid=linkedhash-list-tests \
#  --avoid=unilbrk/u8-possible-linebreaks-tests \
#  --avoid=unilbrk/ulc-width-linebreaks-tests \
#  --avoid=unistr/u8-mbtouc-tests \
#  --avoid=unistr/u8-mbtouc-unsafe-tests \
#  --avoid=uniwidth/width-tests \
#  alloca-opt \
#  ansi-c++-opt \
#  atexit \
#  attribute \
#  backupfile \
#  basename-lgpl \
#  binary-io \
#  bison \
#  bison-i18n \
#  byteswap \
#  c-ctype \
#  c-strcase \
#  c-strcasestr \
#  c-strstr \
#  clean-temp \
#  closedir \
#  closeout \
#  configmake \
#  copy-file \
#  csharpcomp \
#  csharpcomp-script \
#  csharpexec \
#  csharpexec-script \
#  error \
#  error-progname \
#  execute \
#  extensions \
#  filename \
#  findprog \
#  fnmatch \
#  fopen \
#  free-posix \
#  fstrcmp \
#  full-write \
#  fwriteerror \
#  gcd \
#  getline \
#  getopt-gnu \
#  gettext \
#  gettext-h \
#  gettext-tools-misc \
#  iconv \
#  include_next \
#  java \
#  javacomp \
#  javacomp-script \
#  javaexec \
#  javaexec-script \
#  libunistring-optional \
#  libxml \
#  localcharset \
#  locale \
#  localename \
#  localtime \
#  lock \
#  malloc-posix \
#  mbrtowc \
#  mbsinit \
#  mem-hash-map \
#  memchr \
#  memmove \
#  memset \
#  minmax \
#  mkdir \
#  multiarch \
#  noreturn \
#  obstack \
#  open \
#  opendir \
#  openmp-init \
#  pipe-filter-ii \
#  progname \
#  propername \
#  read-file \
#  readdir \
#  relocatable-prog \
#  relocatable-script \
#  setlocale \
#  setlocale-null \
#  sh-filename \
#  sh-quote \
#  sigpipe \
#  sigprocmask \
#  snippet/arg-nonnull \
#  snippet/c++defs \
#  snippet/warn-on-use \
#  spawn-pipe \
#  ssize_t \
#  stdbool \
#  stddef \
#  stdint \
#  stdio \
#  stdlib \
#  stpcpy \
#  stpncpy \
#  strchrnul \
#  strcspn \
#  streq \
#  strerror \
#  strpbrk \
#  strtol \
#  strtoul \
#  supersede \
#  sys_select \
#  sys_stat \
#  sys_time \
#  trim \
#  unictype/ctype-space \
#  unictype/syntax-java-whitespace \
#  unilbrk/ulc-width-linebreaks \
#  uniname/uniname \
#  unistd \
#  unistr/u16-mbtouc \
#  unistr/u8-check \
#  unistr/u8-mbtouc \
#  unistr/u8-mbtoucr \
#  unistr/u8-uctomb \
#  uniwidth/width \
#  unlocked-io \
#  unsetenv \
#  vasprintf \
#  verify \
#  wait-process \
#  wchar \
#  wctype-h \
#  windows-mutex \
#  windows-once \
#  windows-recmutex \
#  windows-rwlock \
#  write \
#  xalloc \
#  xconcat-filename \
#  xerror \
#  xmalloca \
#  xmemdup0 \
#  xsetenv \
#  xstriconv \
#  xstriconveh \
#  xvasprintf

# Specification in the form of a few gnulib-tool.m4 macro invocations:
gl_LOCAL_DIR([../gnulib-local])
gl_MODULES([
  alloca-opt
  ansi-c++-opt
  atexit
  attribute
  backupfile
  basename-lgpl
  binary-io
  bison
  bison-i18n
  byteswap
  c-ctype
  c-strcase
  c-strcasestr
  c-strstr
  clean-temp
  closedir
  closeout
  configmake
  copy-file
  csharpcomp
  csharpcomp-script
  csharpexec
  csharpexec-script
  error
  error-progname
  execute
  extensions
  filename
  findprog
  fnmatch
  fopen
  free-posix
  fstrcmp
  full-write
  fwriteerror
  gcd
  getline
  getopt-gnu
  gettext
  gettext-h
  gettext-tools-misc
  iconv
  include_next
  java
  javacomp
  javacomp-script
  javaexec
  javaexec-script
  libunistring-optional
  libxml
  localcharset
  locale
  localename
  localtime
  lock
  malloc-posix
  mbrtowc
  mbsinit
  mem-hash-map
  memchr
  memmove
  memset
  minmax
  mkdir
  multiarch
  noreturn
  obstack
  open
  opendir
  openmp-init
  pipe-filter-ii
  progname
  propername
  read-file
  readdir
  relocatable-prog
  relocatable-script
  setlocale
  setlocale-null
  sh-filename
  sh-quote
  sigpipe
  sigprocmask
  snippet/arg-nonnull
  snippet/c++defs
  snippet/warn-on-use
  spawn-pipe
  ssize_t
  stdbool
  stddef
  stdint
  stdio
  stdlib
  stpcpy
  stpncpy
  strchrnul
  strcspn
  streq
  strerror
  strpbrk
  strtol
  strtoul
  supersede
  sys_select
  sys_stat
  sys_time
  trim
  unictype/ctype-space
  unictype/syntax-java-whitespace
  unilbrk/ulc-width-linebreaks
  uniname/uniname
  unistd
  unistr/u16-mbtouc
  unistr/u8-check
  unistr/u8-mbtouc
  unistr/u8-mbtoucr
  unistr/u8-uctomb
  uniwidth/width
  unlocked-io
  unsetenv
  vasprintf
  verify
  wait-process
  wchar
  wctype-h
  windows-mutex
  windows-once
  windows-recmutex
  windows-rwlock
  write
  xalloc
  xconcat-filename
  xerror
  xmalloca
  xmemdup0
  xsetenv
  xstriconv
  xstriconveh
  xvasprintf
])
gl_AVOID([ fdutimensat-tests futimens-tests utime-tests utimens-tests utimensat-tests array-list-tests linked-list-tests linkedhash-list-tests unilbrk/u8-possible-linebreaks-tests unilbrk/ulc-width-linebreaks-tests unistr/u8-mbtouc-tests unistr/u8-mbtouc-unsafe-tests uniwidth/width-tests])
gl_SOURCE_BASE([gnulib-lib])
gl_M4_BASE([gnulib-m4])
gl_PO_BASE([])
gl_DOC_BASE([doc])
gl_TESTS_BASE([gnulib-tests])
gl_WITH_TESTS
gl_LIB([libgettextlib])
gl_MAKEFILE_NAME([Makefile.gnulib])
gl_LIBTOOL
gl_MACRO_PREFIX([gl])
gl_PO_DOMAIN([])
gl_WITNESS_C_MACRO([])
