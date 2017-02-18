---
title: Manual
---

A simple & [flexible *TODO*] static site generator, writen in Lua. 

## Dependencies

1. [Lua](https://www.lua.org/)(Tested Lua5.3)
2. [luafilesystem](https://github.com/keplerproject/luafilesystem)
3. [yaml](http://doc.lubyk.org/yaml.html)
4. [lua-discount](http://asbradbury.org/projects/lua-discount/)

## Usage

    git clone git@github.com:luammd/luammd.git
    cd luammd

Add markdown files in posts/ directory

    2017-01-08-luammd.md

    ---
    title: Hello Luammd!          must
    issueid: 1                    optional
    categories: Luammd            must
    uri: luammd                   must -> luammd.html
    ---

    A simple & flexible static site generator, writen in Lua. 

Add markdown files in pages/ directory

    about.md

    ---
    title: About                  must
    ---

    A simple & flexible static site generator, writen in Lua. 

Run server

    lua luammd.lua

All html files in html/ directory

Open browser in http://127.0.0.1:8080

## Links

1. [lettersmith](https://github.com/gordonbrander/lettersmith)
2. [luablog](https://github.com/henkboom/luablog)
