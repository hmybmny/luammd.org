local exports = {}

local lfs = require "lfs"

local function read_posts_folder()
  local posts = {}
  for file in lfs.dir("posts/") do 
    if file ~= "." and file ~= ".." then
      table.insert(posts, file)
    end
  end

  return posts
end
exports.read_posts_folder = read_posts_folder

local function read_pages_folder()
  local pages = {}
  for file in lfs.dir("pages/") do 
    if file ~= "." and file ~= ".." then
      table.insert(pages, file)
    end
  end

  return pages
end
exports.read_pages_folder = read_pages_folder

local function make_posts_folder()
end
exports.make_posts_folder = make_posts_folder

local function make_pages_folder()
end
exports.make_pages_folder = make_pages_folder

return exports
