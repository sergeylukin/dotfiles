--Reload config
local hyper = { "cmd", "alt", "ctrl", "shift" }

hs.hotkey.bind(hyper, "0", function()
  hs.reload()
  hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()
end)

--Resize windiows
hs.window.animationDuration = 0
hs.hotkey.bind(hyper, "h", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.left50)
end)
hs.hotkey.bind(hyper, "j", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.maximized)
end)
hs.hotkey.bind(hyper, "k", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)
hs.hotkey.bind(hyper, "l", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.right50)
end)

--Hyper + a/s/d/f for quick App switch
local applicationHotkeys = {
  a = 'Brave Browser',
  s = 'Google Chrome',
  d = 'iTerm',
  f = 'Finder',
  e = 'Sublime Text'
}
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

--Lock screen
hs.hotkey.bind(hyper, "q", function()
  hs.caffeinate.lockScreen()
end)

--Fullscreen
hs.hotkey.bind(hyper, "return", function()
  local win = hs.window.frontmostWindow()
  win:setFullscreen(not win:isFullscreen())
end)

wifiwatcher = hs.wifi.watcher.new(function ()
    net = hs.wifi.currentNetwork()
    if net=="HiredScore" then
        hs.notify.show("Connected to Wi-Fi network","",net,"")
        hs.application.launchOrFocus("Slack")
    else
    end
end)
wifiwatcher:start()
