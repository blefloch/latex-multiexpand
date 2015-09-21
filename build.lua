#!/usr/bin/env texlua
-- Build script for multiexpand
module = "multiexpand"
unpackfiles = {"*.dtx"}
checkfiles = {"*.lvt", "*.tlg"}
testfiledir = "."
tdsroot = "generic"

-- Ugly way of getting the README.md unpacked from the dtx
main = function(target, files)
  stdunpack = unpack
  function unpack()
    stdunpack()
    cp("README.md", unpackdir, ".")
  end
  stdmain(target, files)
end

kpse.set_program_name("kpsewhich")
dofile(kpse.lookup("l3build.lua"))
