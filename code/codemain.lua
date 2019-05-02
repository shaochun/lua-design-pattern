local class = require "class-clean"
local Window = class("Window", {width = 150, height = 100})

print (Window.name)

local appWindow = Window()
print (appWindow.width, appWindow.height)

require("code.state.notsogood-scenemanager")