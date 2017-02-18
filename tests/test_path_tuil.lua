local lfs = require "lfs"

local path_util = require "utils.path_util"

local posts = path_util.read_posts_folder()

--for k, v in pairs(posts) do
  --print(k .. '\t' .. v)
--end

local pages = path_util.read_pages_folder()

for k, v in pairs(pages) do
  print(k .. '\t' .. v)
end
