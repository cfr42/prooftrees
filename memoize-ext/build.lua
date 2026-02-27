--------------------------------------------------------------------------------
-- $Id: build.lua 11705 2026-02-27 21:46:12Z cfrees $
-- Build configuration for memoize-ext
--------------------------------------------------------------------------------
maindir = maindir or ".."
sourcedir = sourcedir or "."
--------------------------------------------------------------------------------
ctanpkg = "memoize-ext"
module = "memoize-ext"
exludefiles = { 
  "build.lua", 
  "config-*.lua", 
  "memoize-ext-properties.dtx", 
  "memoize-ext-tikz-tagging.dtx" }
--------------------------------------------------------------------------------
checkengines = { "pdftex", "luatex" }
checkruns = 4
recordstatus = true
checkopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
checkconfigs = { "build", "config-xetex" }
excludetests = { 
  "mmzx-properties",
}
dynamicfiles = { "memos/*", "*.mmz" }
-- -- indexstyle = "gind.ist"
manifestfile = "manifest.txt"
-- -- sourcefiles = {"*.dtx","*.ins","memoize-ext.tex"}
-- sourcefiles = {"*.dtx","*.ins"}
sourcefiles = {
  "memoize-ext.ins", 
  "memoize-ext.dtx", 
  "memoize-ext-expl3.dtx", 
  "memoize-ext-l3draw.dtx", 
  --"memoize-ext-properties.dtx", 
  "memoize-ext-sockets.dtx", 
  "memoize-ext-tag.dtx", 
  "memoize-ext-talk.dtx"
}
-- tagfiles = { "*.dtx", "README.md", "build.lua", "*.sty", "memoize-ext.tex", "manifest.txt" }
typesetopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
typesetfiles = { "memoize-ext.dtx" }
typesetruns = 4 -- 4
--------------------------------------------------------------------------------
uploadconfig = {
  ctanPath = "/macros/latex/contrib/memoize-ext",
  pkg = "memoize-ext",
  version = "v0.2",
  author = "Clea F. Rees",
  uploader = "Clea F. Rees",
  license = "lppl1.3c",
  update = false,
  summary = "Extended support for memoization with Memoize.",
  description = "Automatic handling of additional kinds of material by or during memoization with Memoize. Provides support for memoizing content in tagged PDFs and compatibility with ltx-talk. TikZ pictures tagged with alt, actualtext or artifact are handled automatically. The package supports automatic detection of expl3 syntax zones, auto-replication of expl3 functions without ‘weird’ arguments and auto-memoization of l3draw pictures. The code is arranged into interdependent modules so activation may be customised at load time.", 
	bugtracker = "https://codeberg.org/cfr/prooftrees/issues",
	repository = {"https://codeberg.org/cfr/prooftrees", "https://github.com/cfr42/prooftrees"},
  topic = {"diagrams", "pgf-tikz", "expl3", "tagged-pdf"},
  -- note = "",
}
--------------------------------------------------------------------------------
date = "2024-2026"
if direxists(sourcedir .. "/../../adnoddau/l3build") then
  dofile(sourcedir .. "/../../adnoddau/l3build/manifest.lua")
  dofile(sourcedir .. "/../../adnoddau/l3build/tag.lua")
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function docinit_hook()
  local lines = {}
  for _,i in ipairs(sourcefiles) do
    if string.match(i, "%.dtx") then
      lines = {}
      for line in io.lines(typesetdir .. "/" .. i) do
        table.insert(lines, (string.gsub(line,"%_*%@%@%_","__mmzx_")))
      end
      local f = assert(io.open(typesetdir .. "/" .. i, "w"))
      f:write(table.concat(lines,"\n") .. "\n")
      f:close()
    end
  end
  return 0
end
--------------------------------------------------------------------------------
-- vim: ts=2:sw=2:tw=0:et:foldmethod=marker:
