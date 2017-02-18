local markdown = require "discount"

local exports = {}

local header = require "includes.header"
local post = require "includes.post"
local footer = require "includes.footer"

local function create_post_html(metadata, content)

  local html = header.html_header() .. post.html_post(metadata, markdown(content)) .. footer.html_footer()

  return html
end
exports.create_post_html = create_post_html

local function read_post_file(post)
  local filepath = "posts/" .. post
  local f = assert(io.open(filepath, "r"))
  local contents = f:read("*all")
  f:close()
  return contents
end
exports.read_post_file = read_post_file

return exports
