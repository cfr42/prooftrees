-- $Id: config-tag-mmz-luatex.lua 11608 2026-02-17 18:07:12Z cfrees $
-- Build configuration for prooftrees
--------------------------------------------------------------------------------
testfiledir = "testfiles-tag-mmz-lua"
checkengines = { "luatex" }
checkdepends = { maindir .. "/memoize-ext" }
checkruns = 3
recordstatus = true
--------------------------------------------------------------------------------
-- vim: ts=2:sw=2:et:
