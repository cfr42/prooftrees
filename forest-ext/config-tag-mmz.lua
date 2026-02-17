-- $Id: config-tag-mmz.lua 11608 2026-02-17 18:07:12Z cfrees $
-- Build configuration for prooftrees
--------------------------------------------------------------------------------
testfiledir = "testfiles-tag-mmz"
checkengines = { "pdftex" }
checkdepends = { maindir .. "/memoize-ext" }
checkruns = 4
recordstatus = true
--------------------------------------------------------------------------------
-- vim: ts=2:sw=2:et:
