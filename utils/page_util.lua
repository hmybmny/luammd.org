local markdown = require "discount"

local exports = {}

local header = require "includes.header"
local page = require "includes.page"
local footer = require "includes.footer"

local function create_page_html(metadata, content)
  local html = header.html_header() .. page.html_page(metadata, markdown(content)) .. footer.html_footer()

  return html
end
exports.create_page_html = create_page_html


local function read_page_file(page)
  local filepath = "pages/" .. page
  local f = assert(io.open(filepath, "r"))
  local contents = f:read("*all")
  f:close()
  return contents
end
exports.read_page_file = read_page_file

return exports
