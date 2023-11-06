-- Window management

-- Defines for window maximize toggler
local frameCache = {}
local logger = hs.logger.new("windows")

-- Resize current window

function winresize(how)
   local win = hs.window.focusedWindow()
   app = win:application():name()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   if how == "left" then
      hs.window.focusedWindow():moveToUnit({0, 0, 0.5, 1}) 
   elseif how == "right" then
      hs.window.focusedWindow():moveToUnit({0.5, 0, 0.5, 1})
   elseif how == "up" then
      hs.window.focusedWindow():moveToUnit({0, 0, 1, 0.5}) 
   elseif how == "down" then
      hs.window.focusedWindow():moveToUnit({0, 0.5, 1, 0.5})
   elseif how == "max" then
      hs.window.focusedWindow():moveToUnit({0, 0, 1, 1})
   elseif how == "center" then
      hs.window.focusedWindow():moveToUnit({0.25, 0, 0.5, 1})
   end
end


function winmovescreen(how)
   local win = hs.window.focusedWindow()
   if how == "left" then
      if win:moveOneScreenWest() then
      else
	 winmovescreen("right")
      end
   elseif how == "right" then
      if win:moveOneScreenEast() then
      else
	 winmovescreen("left")
      end
   end
end

function gotospace()
   spaces = {}
   local function focusLastFocused()
      local wf = hs.window.filter
      local lastFocused = wf.defaultCurrentSpace:getWindows(wf.sortByFocusedLast)
      if #lastFocused > 0 then lastFocused[1]:focus() end
   end
   for k, v in pairs(hs.spaces.allSpaces()) do
      for kk, vv in pairs(v) do
	 table.insert(spaces, {
			 ["text"] = vv,
			 ["subText"] = k
	 })
      end
   end
   local chooser = hs.chooser.new(function(choice)
	 if not choice then focusLastFocused(); return end
	 print(choice)
	 hs.alert.show(string.format("Spaces: %s, index: %s", spaces, choice["text"]))
	 hs.spaces.gotoSpace(choice["text"])
	 focusLastFocused()
   end)
   chooser:choices(spaces)
   chooser:show()
end

function windowMaximize()
   local win = hs.window.focusedWindow()      -- current window

   if win then
      win:maximize()
   end
end

-------- Key bindings

-- Halves of the screen
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Left",  hs.fnutils.partial(winresize, "left"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Right", hs.fnutils.partial(winresize, "right"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Up",    hs.fnutils.partial(winresize, "up"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Down",  hs.fnutils.partial(winresize, "down"))

-- Center of the screen
hs.hotkey.bind({"ctrl", "alt", "cmd"},  "C", hs.fnutils.partial(winresize, "center"))

-- Thirds of the screen
-- hs.hotkey.bind({"ctrl", "alt"}, "Left",  left_third)
-- hs.hotkey.bind({"ctrl", "alt"}, "Right", right_third)
-- hs.hotkey.bind({"ctrl", "alt"}, "Up",    up_third)
-- hs.hotkey.bind({"ctrl", "alt"}, "Down",  down_third)

-- Maximized
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "M",     windowMaximize)
-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Up",    hs.fnutils.partial(winresize, "max"))

-- Move between screens
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "Left",  hs.fnutils.partial(winmovescreen, "left"))
hs.hotkey.bind({"ctrl", "alt", "cmd", "shift"}, "Right", hs.fnutils.partial(winmovescreen, "right"))

hs.hotkey.bind({"alt", "cmd"}, "S", hs.fnutils.partial(gotospace))


