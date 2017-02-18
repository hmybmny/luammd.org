local index_util = require "utils.index_util"
local pages_util = require "utils.pages_util"
local posts_util = require "utils.posts_util"
local file_util = require "utils.file_util"
local feed_util = require "utils.feed_util"

local exports = {}

local function save_html()
  index_util.run()
  pages_util.run()
  posts_util.run()
  feed_util.run()
end

local function chdir(src, dest)
  lfs.mkdir(src)
  lfs.chdir(src)
  lfs.mkdir(dest)
  lfs.chdir("../")
end

local function copy_static_file()
  chdir("html", "stylesheets")
  file_util.copy_file("includes/stylesheets/styles.css", "html/stylesheets/styles.css")
  file_util.copy_file("includes/stylesheets/pygment_trac.css", "html/stylesheets/pygment_trac.css")
  file_util.copy_file("includes/stylesheets/reset.css", "html/stylesheets/reset.css")
  chdir("html", "js")
  file_util.copy_file("includes/js/jquery-2.1.1.min.js", "html/js/jquery-2.1.1.min.js")
  chdir("html", "images")
  file_util.copy_file("includes/images/GitHub-Mark-64px.png", "html/images/GitHub-Mark-64px.png")
  file_util.copy_file("includes/images/luammd-logo.png", "html/images/luammd-logo.png")
  file_util.copy_file("includes/CNAME", "html/CNAME")
end

local function run_server()
  lfs.chdir("html")
  os.execute("python -m SimpleHTTPServer 8080")
end

local function run()
  save_html()
  copy_static_file()
  run_server()
end
exports.run = run

return exports
