local exports = {}

local function copy_file(src, dest)
  local src_file = assert(io.open(src, "r"))
  local dest_file = assert(io.open(dest, "w+"))
  local content = src_file:read("*all")

  dest_file:write(content)

  src_file:close()
  dest_file:close()
end
exports.copy_file = copy_file

return exports
