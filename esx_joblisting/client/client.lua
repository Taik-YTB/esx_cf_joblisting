ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

-- blips

local blips = {
    {title="Pôle emplois", colour=5, id=408, x = -265.0, y = -963.6, z = 30.2}
}

Citizen.CreateThread(function()

    if Config.EnableBlips then
        for _, info in pairs(blips) do
            info.blip = AddBlipForCoord(info.x, info.y, info.z)
            SetBlipSprite(info.blip, info.id)
            SetBlipDisplay(info.blip, 4)
            SetBlipScale(info.blip, 0.9)
            SetBlipColour(info.blip, info.colour)
            SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(info.blip)
        end
    end
end)

-- marker et help text

local joblisting = {
	{x = -265.0, y = -963.6, z = 30.2},
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

        for k in pairs(joblisting) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, joblisting[k].x, joblisting[k].y, joblisting[k].z)

            if dist <= 1.2 then
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour accéder au ~b~pôle emplois~s~")
				if IsControlJustPressed(1,51) then 
					mainMenu:Visible(not mainMenu:Visible())
				end
            end
        end
    end
end)
