-- $Id: config-xetex.lua 11719 2026-03-02 13:19:21Z cfrees $
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
  "mmzx-talk-prefix",
  "mmzx-talk-tag",
  "mmzx-tikz-tagging-none",
  "mmzx-tikz-tagging",
}
-- vim: ts=2:sw=2:et:
