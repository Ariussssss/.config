local hotkey = require "hs.hotkey"
local window = require "hs.window"
local spaces = require "hs.spaces"

mash = {"cmd", "ctrl", "alt"}

-- move current window to the space sp
function MoveWindowToSpace(sp)
  local win = hs.window.focusedWindow()      -- current window
  local cur_screen = hs.screen.mainScreen()
  local cur_screen_id = cur_screen:getUUID()
  local all_spaces = {}
  
  for _, s in ipairs(hs.screen.allScreens()) do
     local uuid = s:getUUID()
     for _, v in ipairs(hs.spaces.allSpaces()[uuid]) do
	table.insert(all_spaces, v)
     end
  end
  -- print(all_spaces[1])
  local spaceID = all_spaces[sp]
  spaces.moveWindowToSpace(win:id(), spaceID)
end

for spaceNum=1,6 do
   hs.hotkey.bind(mash, tostring(spaceNum), function()
	 MoveWindowToSpace(spaceNum)
   end)
end
