local lfs = require "lfs"
local file_util = require "utils.file_util"

lfs.mkdir("html")
lfs.chdir("html")
lfs.mkdir("stylesheets")
lfs.chdir("../")
file_util.copy_file("includes/stylesheets/style.css", "html/stylesheets/style.css")
