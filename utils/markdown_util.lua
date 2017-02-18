local yaml = require('yaml')

local exports = {}

local function parse(contents)
  local delimiter = "%-+\n"
  local headmatter_open_start, headmatter_open_end = contents:find(delimiter)

  if headmatter_open_start == nil or headmatter_open_start > 1 then
    return "", contents
  end

  local headmatter_close_start, headmatter_close_end =
    contents:find(delimiter, headmatter_open_end + 1)

  local headmatter =
    contents:sub(headmatter_open_end + 1, headmatter_close_start - 1)

  local content = contents:sub(headmatter_close_end + 1)
  local metadata = yaml.load(headmatter) or {}

  return metadata, content
end
exports.parse = parse

return exports
