local exports = {}

local conf = require "conf"
local page_util = require "utils.page_util"
local path_util = require "utils.path_util"
local markdown_util = require "utils.markdown_util"

local function save_page_html(html, metadata)
  lfs.mkdir("html")
  lfs.chdir("html")
  lfs.mkdir(string.lower(metadata.title))
  lfs.chdir(string.lower(metadata.title))
  local f = assert(io.open("index.html", "w+"))
  f:write(html)
  f:close()
  lfs.chdir("../..")
end

local function save_pages_html()
  local pages = path_util.read_pages_folder()
  for k, v in pairs(pages) do
    local contents = page_util.read_page_file(v)
    local metadata, content = markdown_util.parse(contents)
    save_page_html(page_util.create_page_html(metadata, content), metadata)
  end
end
exports.run = save_pages_html

return exports
