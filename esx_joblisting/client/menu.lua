local Keys = {
	["ESC"] = 322, ["BACKSPACE"] = 177, ["E"] = 38, ["ENTER"] = 18,	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173
}


_menuPool = NativeUI.CreatePool()
mainMenu = NativeUI.CreateMenu(GetPlayerName(PlayerId()), "Bienvenue au pole emplois!", Config.MenuX, Config.MenuY,nil,nil,nil,Config.MenuColor.r,Config.MenuColor.g,Config.MenuColor.b,Config.MenuColor.a)
_menuPool:Add(mainMenu)

function AddMenuJobMenu(menu)
    local submenu = _menuPool:AddSubMenu(menu, "Pôle emplois : ~b~jobs non whitelist", "", Config.MenuX, Config.MenuY,nil,nil,nil,Config.MenuColor.r,Config.MenuColor.g,Config.MenuColor.b,Config.MenuColor.a, 5, 50)
	for i = 1 , #Jobs,1 do
		local job = NativeUI.CreateItem(Jobs[i].label, "")
		submenu.SubMenu:AddItem(job)
	end
	submenu.SubMenu.OnItemSelect = function(_,_,Index)
		TriggerServerEvent("esx_joblisting:setJob", Jobs[Index].value)
	end
end


_menuPool:MouseEdgeEnabled(false);
_menuPool:RefreshIndex()
