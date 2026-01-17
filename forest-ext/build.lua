-- $Id: build.lua 11490 2026-01-16 19:31:55Z cfrees $
-- Build configuration for forest-ext
--------------------------------------------------------------------------------
maindir = maindir or ".."
sourcedir = sourcedir or "."
--------------------------------------------------------------------------------
ctanpkg = "forest-ext"
module = "forest-ext"
--------------------------------------------------------------------------------
checkconfigs = { "build", "config-tag" } --, "config-mem", "config-tag-mem" }
checkopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
checkruns = 1
manifestfile = "manifest.txt"
sourcefiles = {"*.dtx","*.ins"}
tagfiles = { "*.dtx", "*.ins", "README.md", "build.lua", "manifest.txt" }
typesetfiles = {"forest-ext-doc.tex","forest-ext-code.tex"}
-- typesetopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
typesetopts = "-interaction=errorstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
-- typesetdemofiles{"tagging-eg.tex"}
--------------------------------------------------------------------------------
-- indexstyle = ""
typesetruns = 4
-- typesetruns = 1
--------------------------------------------------------------------------------
uploadconfig = {
  ctanPath = "/macros/latex/contrib/forest-ext",
  pkg = "forest-ext",
  version = "v0.1",
  author = "Clea F. Rees",
  uploader = "Clea F. Rees",
  license = "lppl1.3c",
  update = false,
  summary = "Additional Forest libraries providing bug fixes, extensions and support for tagging",
  description = "Additional Forest libraries providing bug fixes, extensions and support for tagging",
	bugtracker = "https://codeberg.org/cfr/prooftrees/issues",
	repository = {"https://codeberg.org/cfr/prooftrees", "https://github.com/cfr42/prooftrees"},
  topic = {"accessibility", "logic", "linguistics", "pgf-tikz", "tree"},
}
--------------------------------------------------------------------------------
date = "2025-2026"
if direxists(maindir .. "/../adnoddau/l3build") then
  dofile(maindir .. "/../adnoddau/l3build/manifest.lua")
  dofile(maindir .. "/../adnoddau/l3build/tag.lua")
end
--------------------------------------------------------------------------------
function docinit_hook()
  local lines = {}
  for line in io.lines(typesetdir .. "/forest-ext-tagging.dtx") do
    table.insert(lines, (string.gsub(line,"%_*%@%@%_","__tagforest_")))
  end
  local f = assert(io.open(typesetdir .. "/forest-ext-tagging.dtx", "w"))
  f:write(table.concat(lines,"\n") .. "\n")
  f:close()
  lines = {}
  for line in io.lines(typesetdir .. "/forest-ext-utils.dtx") do
    if not (string.match(line, "^%% *%^%^A")) then
      table.insert(lines, (string.gsub(line,"%_*%@%@%_","__forestext_")))
    end
  end
  local f = assert(io.open(typesetdir .. "/forest-ext-utils.dtx", "w"))
  f:write(table.concat(lines,"\n") .. "\n")
  f:close()
  return 0
end
--------------------------------------------------------------------------------
-- vim: ts=2:sw=2:et:
