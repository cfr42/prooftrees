-- $Id: config-xetex.lua 11655 2026-02-20 23:33:18Z cfrees $
-- Build configuration for prooftrees
checkengines = { "xetex" }
-- the *only* test run is sockets !!
excludetests = {
  "mmzx-draw",
  "mmzx-expl",
  "mmzx-properties",
  "mmzx-tag-tikz",
  "mmzx-tag",
  "mmzx-talk",
  "mmzx-tikz-tagging-none",
  "mmzx-tikz-tagging",
}
-- vim: ts=2:sw=2:et:
