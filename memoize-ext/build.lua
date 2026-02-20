--------------------------------------------------------------------------------
-- $Id: build.lua 11648 2026-02-20 08:58:04Z cfrees $
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
--  "memoize-ext-l3draw.dtx", 
--  "memoize-ext-expl3.dtx", 
  "memoize-ext-properties.dtx", 
  "memoize-ext-tikz-tagging.dtx" }
--------------------------------------------------------------------------------
checkengines = { "pdftex", "luatex" }
checkruns = 4
recordstatus = true
checkopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
excludetests = { 
  "mmzx-expl",
  "mmzx-beamer", 
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
-- typesetfiles = {"*-doc.tex", "*-imp.tex"}
typesetopts = "-interaction=nonstopmode -cnf-line='TEXMFHOME=.' -cnf-line='TEXMFLOCAL=.' -cnf-line='TEXMFARCH=.'"
typesetfiles = { "memoize-ext.dtx" }
typesetruns = 4 -- 4
--------------------------------------------------------------------------------
uploadconfig = {
  ctanPath = "/macros/latex/contrib/memoize-ext",
  pkg = "memoize-ext",
  version = "v0.0",
  author = "Clea F. Rees",
  uploader = "Clea F. Rees",
  license = "lppl1.3c",
  update = false,
  summary = "Extended support for memoization with Memoize.",
  description = "Automatic handling of additional kinds of material by or during memoization with Memoize. Provides support for memoizing content in tagged PDFs and compatibility with ltx-talk. TikZ pictures tagged with alt, actualtext or artifact are handled automatically.", --  Enables auto-memoization of tagged TikZ pictures and l3draw, with automatic handling of properties (ltproperties), including position on page. Arbitrary expl3 functions may be specified for auto-replication, provided their parameter specifications do not include 'w'.",
	bugtracker = "https://codeberg.org/cfr/memoize-ext/issues",
	repository = {"https://codeberg.org/cfr/memoize-ext", "https://github.com/cfr42/memoize-ext"},
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
