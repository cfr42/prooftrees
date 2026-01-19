-- $Id: build.lua 11545 2026-01-19 07:08:04Z cfrees $
-- Build configuration for forest-ext
--------------------------------------------------------------------------------
maindir = maindir or ".."
sourcedir = sourcedir or "."
--------------------------------------------------------------------------------
ctanpkg = "forest-ext"
module = "forest-ext"
--------------------------------------------------------------------------------
checkconfigs = { "build", "config-tag", "config-tag-mmz" } --, "config-mem" }
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
  ctanPath = "/graphics/pgf/contrib/forest-ext",
  pkg = "forest-ext",
  version = "v0.2",
  author = "Clea F. Rees",
  uploader = "Clea F. Rees",
  license = "lppl1.3c",
  update = true,
  summary = "Additional Forest libraries providing bug fixes, extensions and support for tagging",
  description = "Additional Forest libraries providing bug fixes, extensions and support for tagging",
	bugtracker = "https://codeberg.org/cfr/prooftrees/issues",
	repository = {"https://codeberg.org/cfr/prooftrees", "https://github.com/cfr42/prooftrees"},
  topic = {"tagged", "logic", "linguistic", "pgf-tikz", "tree"},
  note = "The catalogue description shown in search results for this package appears to be from of my other packages. Could this be corrected, please?",
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
