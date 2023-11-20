require('configs.base')
require('configs.highlights')
require('configs.maps')
require('configs.plugins')
require('configs.theme')
require('hardtime').setup()

local has = vim.fn.has
local is_mac = has "macunix"
local is_linux = has "unix"
local is_win = has "win32"
local is_wsl = has "wsl"

if is_mac == 1 then
  require('configs.macos')
end
if is_linux == 1 then
  require('configs.linux')
end
if is_win == 1 then
  require('configs.windows')
end
if is_wsl == 1 then
  require('configs.wsl')
end
