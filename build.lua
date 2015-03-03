#!/usr/bin/env texlua
-- Build script for multiexpand
module = "multiexpand"
unpackfiles = {"*.dtx"}
testfiledir = "build/unpacked"
packtdszip  = true

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
