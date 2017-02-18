local header = require "includes.header"
local index = require "includes.index"
local footer = require "includes.footer"
local path_util = require "utils.path_util"
local post_util = require "utils.post_util"
local markdown_util = require "utils.markdown_util"

local exports = {}

local function create_index_html(posts)
  local html = header.html_header("Recent posts") .. index.html_index(posts) .. footer.html_footer()

  lfs.mkdir("html")
  lfs.chdir("html")
  local f = assert(io.open("index.html", "w+"))
  f:write(html)
  f:close()
  lfs.chdir("../")
end
--exports.create_index_html = create_index_html

local function save_index_html()
  local posts = {}
  local _posts = path_util.read_posts_folder()
  for k, v in pairs(_posts) do
    local contents = post_util.read_post_file(v)
    local metadata, content = markdown_util.parse(contents)
    metadata.date = string.sub(v, 1, 10)
    table.insert(posts, metadata)
  end

  --for k, v in pairs(posts) do
    --if (type(v) ~= "table") then
      --print(k .. '\t' .. v)
    --end
    --print(type(k) .. '\t' .. type(v.title))
  --end
  table.sort(posts, function (a, b)
    if a.date > b.date then
      return true
    elseif a.date < b.date then
      return false
    else
      return a.uri > b.uri
    end
  end)

  create_index_html(posts)
end
--exports.save_index_html = save_index_html

exports.run = save_index_html

return exports
