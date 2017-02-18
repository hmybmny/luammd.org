local post_util = require "utils.post_util"
local path_util = require "utils.path_util"
local markdown_util = require "utils.markdown_util"

local exports = {}

local function save_post_html(html, metadata)
  lfs.mkdir("html")
  lfs.chdir("html")
  lfs.mkdir(string.lower(metadata.categories))
  lfs.chdir(string.lower(metadata.categories))
  local f = assert(io.open(metadata.uri .. ".html", "w+"))
  f:write(html)
  f:close()
  lfs.chdir("../..")
end
--exports.save_post_html = save_post_html

local function save_posts_html()
  local posts = path_util.read_posts_folder()
  for k, v in pairs(posts) do
    local contents = post_util.read_post_file(v)
    local metadata, content = markdown_util.parse(contents)
    metadata.date = string.sub(v, 1, 10)

    save_post_html(post_util.create_post_html(metadata, content), metadata)
  end
end
--exports.save_posts_html = save_posts_html

exports.run = save_posts_html

return exports
