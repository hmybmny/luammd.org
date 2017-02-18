local feed = require "includes.feed"

local exports = {}

local function save_feed_html()
  local feed_data = feed.html_feed()
  lfs.mkdir("html")
  lfs.chdir("html")
  lfs.mkdir("feed")
  lfs.chdir("feed")
  local f = assert(io.open("index.html", "w+"))
  f:write(feed_data)
  f:close()
  lfs.chdir("../..")
end
exports.run = save_feed_html

return exports
