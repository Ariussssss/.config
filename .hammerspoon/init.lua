require "modules.window"
require "modules.space"

function activeOrLaunch(appname, location)
   local app = hs.application.find(appname)
   if app then
      -- if app:isFrontmost() then
	 -- local aw = app:allWindows()
	 -- aw[#aw]:focus()
      -- else
      app:activate()
      -- end
   else
      hs.application.launchOrFocus(location)
   end
end

hs.hotkey.bind({"cmd", "alt"}, "1", function()
      activeOrLaunch('Google Chrome', "/Applications/Google Chrome.app")
  end
)

hs.hotkey.bind({"cmd", "alt"}, "2", function()
    activeOrLaunch('Emacs', "/Applications/Emacs.app")
  end
)

hs.hotkey.bind({"cmd", "alt"}, "3", function()
    local app = hs.application.find('alacritty')
    if app then
      app:activate()
    else
      hs.application.launchOrFocus("/Applications/Alacritty.app")
    end
  end
)

hs.hotkey.bind({"cmd", "alt"}, "4", function()
      activeOrLaunch('Figma', "/Applications/Figma.app")
    -- local app = hs.application.find('neteaseMusic')
    -- local s = hs.application.find('spotify')
    -- if s then
    --    s:activate()
    -- elseif app then
    --    app:activate()
    -- else
    --   hs.application.launchOrFocus("/Applications/NeteaseMusic.app")
    -- end
  end
)

hs.hotkey.bind({"cmd", "alt"}, "5", function()
    local app = hs.application.find('feishu')
    if app then
      app:activate()
    else
      hs.application.launchOrFocus("/Applications/Feishu.app")
    end
  end
)

hs.hotkey.bind({"cmd", "alt"}, "6", function()
    activeOrLaunch('Feishu Meeting', "/Applications/Feishu Meeting.app")
  end
)

hs.hotkey.bind({"alt"}, "escape", function()
      activeOrLaunch('wechat', "/Applications/Wechat.app")
  end
)

local hyper = {'ctrl', 'cmd'}

-- show front activated app infos
hs.hotkey.bind(
    hyper, ".",
    function()
       hs.alert.show(string.format("App path:        %s\nApp name:      %s\nIM source id:  %s",
				   hs.window.focusedWindow():application():path(),
				   hs.window.focusedWindow():application():name(),
				   hs.keycodes.currentSourceID()))
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
