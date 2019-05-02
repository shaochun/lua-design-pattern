local class = require "class-clean"
local SceneManager = class("SceneManager", {_m_state = "開始"})
print (SceneManager.name .. " class ready.")

function SceneManager:ChangeScene(stateName)
	local switch = {
		[1] = function()	-- for case 1
			print "Case 1."
		end,
		[2] = function()	-- for case 2
			print "Case 2."
		end,
		["開始"] = function()	-- for case 3
			print "Case 3 開始."
		end
	}

	local switch_result = switch[self._m_state]
	-- local switch_result = switch[stateName]
	if (switch_result) then switch_result() else print "Case default (not found)." end
end

function SceneManager:Update()
	local switch = {
		["開始"] = function()	
			print "Case 開始."
		end,
		["選單"] = function()	
			print "Case 選單."
		end,
		["主場景"] = function()
			print "Case 主場景."
		end
	}
	local switch_result = switch[self._m_state]
	if (switch_result) then switch_result() else print "Case default (not found)." end
end

----------------------------------------------------------
-- test
----------------------------------------------------------
local sceneManager = SceneManager()
--print (appWindow.width, appWindow.height)
sceneManager:ChangeScene(2) --"case 2"
sceneManager:ChangeScene(8888) --default not found
sceneManager:ChangeScene("開始") --"case 3 開始"