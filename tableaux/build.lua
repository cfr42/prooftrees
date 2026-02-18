-- $Id: build.lua 11616 2026-02-18 13:41:14Z cfrees $
-- Build configuration for prooftrees
--------------------------------------------------------------------------------
maindir = maindir or ".."
sourcedir = sourcedir or "."
--------------------------------------------------------------------------------
ctanpkg = "prooftrees"
module = "prooftrees"
--------------------------------------------------------------------------------
checkconfigs = { "build", "config-mem", "config-tag", "config-tag-mem" }
checkopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
manifestfile = "manifest.txt"
sourcefiles = {"*.dtx","*.ins"}
tagfiles = { "*.dtx", "*.ins", "README.md", "build.lua", "manifest.txt" }
typesetfiles = {"prooftrees-doc.tex","prooftrees-code.tex"}
-- typesetopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
typesetopts = "-interaction=errorstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
typesetdeps = {maindir .. "/forest-ext", maindir .. "/memoize-ext"}
checkdeps = {maindir .. "/forest-ext", maindir .. "/memoize-ext"}
--------------------------------------------------------------------------------
-- indexstyle = ""
typesetruns = 4
-- typesetruns = 1
--------------------------------------------------------------------------------
uploadconfig = {
  ctanPath = "/macros/latex/contrib/prooftrees",
  pkg = "prooftrees",
  version = "v0.9.2",
  author = "Clea F. Rees",
  uploader = "Clea F. Rees",
  license = "lppl1.3c",
  update = true,
  summary = "Annotated logical tableaux based on forest with support for cross-references and memoization.",
  description = "The package supports drawing proof trees of the kind often used in introductory logic classes, especially those aimed at students without strong mathematical backgrounds. Hodges (1991) is one example of a text which uses this system. When teaching such a system it is especially useful to annotate the tree with line numbers, justifications and explanations of branch closures.\n\nprooftrees provides a single environment, (either prooftree or tableau), and a variety of tools for annotating, customising and highlighting such trees. A cross-referencing system is provided for trees which cite line numbers in justifications for proof lines or branch closures.\n\nprooftrees is based on forest and, hence, TikZ. The package requires version 2.0.2 of Forest for expected results and will not work with version 1. Out-of-the-box support for memoization is based on forest version 2.1.",
	bugtracker = "https://codeberg.org/cfr/prooftrees/issues",
	repository = {"https://codeberg.org/cfr/prooftrees", "https://github.com/cfr42/prooftrees"},
  topic = {"logic", "pgf-tikz", "proof", "tree"},
}
--------------------------------------------------------------------------------
date = "2016-2026"
if direxists(maindir .. "/../adnoddau/l3build") then
  dofile(maindir .. "/../adnoddau/l3build/manifest.lua")
  dofile(maindir .. "/../adnoddau/l3build/tag.lua")
end
--------------------------------------------------------------------------------
function docinit_hook()
  local lines = {}
  for line in io.lines(typesetdir .. "/prooftrees.dtx") do
    table.insert(lines, (string.gsub(line,"%_*%@%@%_","__tableaux_")))
  end
  local f = assert(io.open(typesetdir .. "/prooftrees.dtx", "w"))
  f:write(table.concat(lines,"\n") .. "\n")
  f:close()
  return 0
end
--------------------------------------------------------------------------------
-- vim: ts=2:sw=2:et:
