ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(0)
	end

	PlayerData = ESX.GetPlayerData()

	
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        local ped = PlayerPedId()
		local PlayerId = GetPlayerServerId(PlayerId())
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= nil then
            if GetVehicleClass(veh) == 18 or GetVehicleClass(veh) == 15 then
				if PlayerData.job ~= nil and PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'ambulance' then
					if (GetPedInVehicleSeat(veh, -1) == ped) then
						TaskLeaveVehicle(ped,veh,0)
						if Config.KickPlayer then
							TriggerServerEvent('kickplayer', PlayerId)
						end
					end
				end        
            else
				Citizen.Wait(100)
			end
		end
	end
end)