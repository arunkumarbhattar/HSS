/* Copyright (C) 2000, 2009-2022 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   This file is free software: you can redistribute it and/or modify
   it under the terms of the GNU Lesser General Public License as
   published by the Free Software Foundation; either version 2.1 of the
   License, or (at your option) any later version.

   This file is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

#include <config.h>

/* Specification.  */
#include <spawn.h>

#include <string.h>

/* Get process group ID from the attribute structure.  */
int
posix_spawnattr_getpgroup (const posix_spawnattr_t *attr, pid_t *pgroup)
{
  /* Copy the process group ID.  */
  *pgroup = attr->_pgrp;

  return 0;
}
